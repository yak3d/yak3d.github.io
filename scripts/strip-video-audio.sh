#!/usr/bin/env bash
#
# Strip audio tracks from the videos in a Hugo content post, in place.
#
# Usage:
#   scripts/strip-video-audio.sh terminus-devlog-5
#   scripts/strip-video-audio.sh content/posts/terminus-devlog-5
#   scripts/strip-video-audio.sh -y terminus-devlog-5   # skip the confirm
#
# Video streams are copied, not re-encoded, so this is lossless and fast.

set -euo pipefail

VIDEO_EXTS=(mp4 m4v mov webm ogv)

die() { printf 'error: %s\n' "$1" >&2; exit 1; }

usage() {
  sed -n '3,11p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

assume_yes=false
while getopts ':yh' opt; do
  case $opt in
    y) assume_yes=true ;;
    h) usage 0 ;;
    *) usage 1 ;;
  esac
done
shift $((OPTIND - 1))

[[ $# -eq 1 ]] || usage 1
command -v ffmpeg  >/dev/null || die 'ffmpeg not found on PATH'
command -v ffprobe >/dev/null || die 'ffprobe not found on PATH'

# Accept either a bare post slug or a path, relative to the repo root.
repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || die 'not inside a git repository'
target=$1
for candidate in "$target" "$repo_root/$target" "$repo_root/content/posts/$target"; do
  if [[ -d $candidate ]]; then post_dir=$(cd "$candidate" && pwd); break; fi
done
[[ -n ${post_dir:-} ]] || die "no such post directory: $target"

# Collect videos that actually carry an audio stream; the rest are already done.
find_args=()
for ext in "${VIDEO_EXTS[@]}"; do
  find_args+=(-iname "*.${ext}" -o)
done
unset 'find_args[${#find_args[@]}-1]'

videos=()
skipped=()
while IFS= read -r -d '' file; do
  if [[ -n $(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$file") ]]; then
    videos+=("$file")
  else
    skipped+=("$file")
  fi
done < <(find "$post_dir" -maxdepth 1 -type f \( "${find_args[@]}" \) -print0 | sort -z)

for file in "${skipped[@]}"; do
  printf '  skip  %s (no audio track)\n' "${file#"$post_dir"/}"
done

if [[ ${#videos[@]} -eq 0 ]]; then
  printf 'Nothing to do: no videos with audio in %s\n' "${post_dir#"$repo_root"/}"
  exit 0
fi

printf '\nVideos with audio in %s:\n\n' "${post_dir#"$repo_root"/}"
for i in "${!videos[@]}"; do
  file=${videos[$i]}
  codec=$(ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of csv=p=0 "$file")
  size=$(du -h "$file" | cut -f1)
  printf '  %2d) %-40s %6s  audio: %s\n' "$((i + 1))" "${file#"$post_dir"/}" "$size" "$codec"
done

printf '\nWhich? (numbers like "1 3", "all", or empty to cancel): '
read -r reply

selected=()
case ${reply,,} in
  '')    printf 'Cancelled.\n'; exit 0 ;;
  all)   selected=("${videos[@]}") ;;
  *)
    for n in $reply; do
      [[ $n =~ ^[0-9]+$ ]] || die "not a number: $n"
      (( n >= 1 && n <= ${#videos[@]} )) || die "out of range: $n"
      selected+=("${videos[$((n - 1))]}")
    done
    ;;
esac

printf '\nWill strip audio from %d file(s), in place:\n' "${#selected[@]}"
printf '  %s\n' "${selected[@]#"$post_dir"/}"

if ! $assume_yes; then
  printf '\nProceed? [y/N] '
  read -r confirm
  [[ ${confirm,,} == y || ${confirm,,} == yes ]] || { printf 'Cancelled.\n'; exit 0; }
fi

printf '\n'
for file in "${selected[@]}"; do
  name=${file#"$post_dir"/}
  ext=${file##*.}
  tmp=$(mktemp "${file%.*}.stripped.XXXXXX.${ext}")

  # faststart moves the moov atom up front so the browser can start playing
  # before the whole file lands; only meaningful for the MP4 family.
  extra=()
  case ${ext,,} in
    mp4|m4v|mov) extra=(-movflags +faststart) ;;
  esac

  before=$(du -h "$file" | cut -f1)
  if ffmpeg -v error -y -i "$file" -map 0 -map -0:a -c copy "${extra[@]}" "$tmp"; then
    # Replace only once ffmpeg has fully succeeded, so a failure never eats the source.
    mv -f "$tmp" "$file"
    printf '  ok    %-40s %6s -> %s\n' "$name" "$before" "$(du -h "$file" | cut -f1)"
  else
    rm -f "$tmp"
    printf '  FAIL  %s (left untouched)\n' "$name" >&2
  fi
done
