+++
date = '2026-08-05T17:40:07-04:00'
description = ""
draft = false
title = 'Terminus Devlog 2'
tags = ["gamedev", "terminus", "devlog"]
+++

Okay! Some more exciting stuff is happening around here! Here's what we've got so far:

- Click to move, moving with navmesh
- Controllable free camera
  - Movement with WASD along the XZ axes
  - Q and E to rotate around the level
  - Scroll wheel to zoom
- Found some [blueprint assets](https://store.godotengine.org/asset/tuily/modular-blueprint-kit/) to help [greyboxing](http://www.neilblevins.com/art_lessons/greybox/greybox.htm) a bit for my movement tests

## Click to Move

This one is what I'm most excited about. It was actually surprisingly straightforward with [Godot's navigation tools](https://docs.godotengine.org/en/latest/tutorials/navigation/navigation_using_navigationmeshes.html). While this is a pretty basic level to just test it, I was able to get the navmesh generated pretty easily and quickly.

There will definitely have to be tweaking, especially when I get a real character mesh in the game. Until then though, we continue!

## Camera Movement

This wasn't as straightforward for me. It took a few different attempts at different ways of creating the camera, and the linear algebra/vector math was a thorn in my side for a bit. However, I think I ended up with an end product I actually like.

My baseline was Warhammer _40,000: Rogue Trader by Owlcat_. This game employs WASD movement for the camera, you can rotate around and zoom in/out. One thing I want to add though is the ability to "focus" on the main character and follow them. That way movement isn't click, then WASD around to find them.

## What's next?

Next I'm going to work on the player name, save system and player attributes. This is so I can start to handle skill checks which will be the first real "mechanic" of the game!

{{< video src="terminus-devlog-2-camera.mp4" >}}
