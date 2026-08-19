+++
date = '2026-08-18T23:01:04-04:00'
draft = false
title = 'Terminus Devlog 5'
tags = ["gamedev", "terminus", "devlog"]
description = "UI updates and testing out shaders!"
+++

For this update, there's a lot more interaction to show compared to last time. I wanted to do some more visual changes as opposed to what I've been doing lately which has been a lot of backend data stuff (stats, HP etc.).

## Interactable Highlight

One thing I wanted to do was make it so things that were interactable, were visibly interactable. I did this by way of adding a special shader to the mesh when you move your mouse over it. At first I tried to do this with Godot's [Visual Shader](https://docs.godotengine.org/en/stable/tutorials/shaders/visual_shaders.html) which I was more familiar with coming from doing pet projects in Unreal. However, because I didn't even [grok](https://hackersdictionary.com/html/entry/grok.html) the basics of how shaders worked in Godot it wasn't that easy to just jump into.

Ultimately I opted to write it in code which made figuring out the fundamentals a bit easier. I did try some from [Godot Shaders](https://godotshaders.com/), and while they worked pretty well, I opted for something custom. I wanted to have a more "computery" type look with scanlines.

{{< video src="shader.mp4" autoplay="true" muted="true" loop="true" >}}

I'm not 100% happy with the look but for a prototype it should work just fine. The good thing is, it will be easy to adjust in the future.

## Entity Nameplates

Another way to indicate an entity is interactable is I wanted to give it a nameplate similar to Baldurs Gate 3. At first I was thinking of just putting it above the entity you're mousing over, but that may be tricky when things obscure the view of the nameplate by being in front. To make it simpler, I ended up putting it at the top. Right now, it shows the name of the entity and the status of their hit points.

It also updates in real time! Two changes I need to make are:

1. When Bonus HP is > 0, it should show another HP bar, either overlayed on top, or below
2. When Bonus HP < 0, it shouldn't show bonus HP!

Below is a video of everything, including attacking the door, seeing its HP deplete and finally be destroyed! Again, these are prototypes, not the final product!

{{< video src="terminus-devlog-5.mp4" >}}
