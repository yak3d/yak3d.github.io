+++
title="My Switch to Linux: CachyOS"
date = 2026-01-01
description = ""
tags=["linux", "gamedev", "unreal"]
+++

Towards the end of 2025, I decided to make the switch to Linux from Windows. There's a number of reasons to do such a change, mine were mostly because I wanted control over my computer again. It also is a good time to switch with [Valve's Proton](https://github.com/ValveSoftware/Proton) being in a fantastic state as of writing this and with plenty of good distros to choose from.

# My Previous Linux/UNIX Experience
I've been using Linux off and on for servers for about a decade and a half, mostly with Debian or Ubuntu. Specifically I've had a home server running for six to seven years that's running Ubuntu server.

In addition to that I've been using Macs for as long as I can remember, including in my professional career. So, using that as a software engineering platform has made me fluent in the command line, POSIX and everything else that comes with that.

With all of that, I also took a class in college on systems programming. If you're a total nerd and want to know some of the UNIX fundamentals I strongly recommend *Understanding Unix/Linux Programming* by Bruce Molay.

This post will be about my journey on picking a distro to stick with. A disclaimer is in order though!

# Disclaimer
*The thoughts below are my own. There are very likely workarounds, solutions or just a simple paradigm shift to the issues I encountered. Some of the issues I encountered weren't even that big of a deal, I switched because of them just to try something else out and see if it worked better.*

*If you find Distro X is better, then use Distro X.*

# CachyOS
After a few trials and tribulations with Mint, Debian and Fedora I landed on [CachyOS](https://cachyos.org/). I wanted something a bit more cutting edge, good gaming support and KDE. It checked all the boxes!

The installer is a little rough around the edges, but the [Arch Wiki](https://wiki.archlinux.org/title/Main_page) is a tremendous resource and helped me through some of the issues I ran into. The issues were mainly self inflicted because I wanted an encrypted disk and separate `home` partition. The installer didn't support that out of the box easily, but I was able to get it done.

Once I was booted in I found it surprisingly polished. The last time I used Linux with a desktop was a long time ago and its certainly improved.

Within a couple hours I was able to get *Cyberpunk 2077* installed, along with ModOrganizer 2 using [NaK](https://github.com/SulfurNitride/NaK) for my modlist. It also ran pretty dang well. I was able to have it at Psycho settings with Path Tracing @ 1440p with ~80 FPS. Once I enabled DLSS and frame generation I got it up to 120+ easily and it was buttery smooth.

I did notice some ghosting, though using CachyOS' [`PROTON_DLSS_UPGRADE`](https://wiki.cachyos.org/configuration/gaming/#environment-variables) variable that seemed to be fixed. See [my report on ProtonDB](https://www.protondb.com/app/1091500#1AoTB4B1lU) for more information on the tinkering I did to get it to work with mods.

## On NaK
One thing with NaK is because it uses a prefix separate to Steam's prefix for the game, you need to symlink your save games from the NaK prefix to the Steam prefix. For example:
```shell
ln -s "~/.local/share/Steam/steamapps/compatdata/1091500/pfx/drive_c/users/steamuser/Saved Games/CD Projekt Red/Cyberpunk 2077/" "~/NaK/Prefixes/mo2_cyberpunk/pfx/drive_c/users/steamuser/Saved Games/CD Projekt Red/Cyberpunk 2077"
```

# Final Words
I've been using Cachy for about a month or so now, the only time I've booted back into Windows was to copy some files from WSL. Otherwise I haven't needed it. It's been freeing. If you're on the fence about making the switch to Linux, now's the time. Here's a list of games/tools I've been using with basically no issues.

- Cyberpunk 2077*
- Skyrim Special Edition (with mods)*
- Starfield + Starfield CreationKit
- Affinity v3*
- Old School Runescape w/ Bolt Launcher

I'll have more to report on things like my backup strategy, disk setup and more!

*The \* denotes if tinkering with Wine/Proton was required*
