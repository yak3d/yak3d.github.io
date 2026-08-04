+++
date = '2026-08-03T21:04:16-04:00'
draft = false
title = 'Terminus Devlog 1'
tags = ["gamedev", "terminus", "devlog"]
+++

The first day is in the books. On the surface, it doesn't look like I made it that far. However here is a list of what I accomplished today:

- Setup a general template with:
  - Folder structure for Terminus and future games based on [DevDuck's structure](https://www.youtube.com/watch?v=4az0VX9ApcA)
  - `.editorconfig` for my C# code
  - Inclusion of some custom C# packages I'm workshopping for some formatting/Roslyn analyzers
- A test scene for movement
- Setting up the Player Character with a collision, capsule mesh, camera and camera rig
- The _beginnings_ of a click-to-move system for the player character using navmesh

The game template and C# setup took the bulk of the day, so I didn't get as far as I'd like with the movement system and it is mostly broken!

{{< video src="terminus-devlog-1-movement.mp4" >}}

Tomorrow I'm looking forward to figuring out why we're moving backwards, and why the rotation continues even after we've made it to the end of the navigation path.
