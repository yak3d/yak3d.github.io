+++
date = '2026-09-01T20:00:11-04:00'
title = 'Terminus Devlog 6'
tags = ["gamedev", "terminus", "devlog"]
description = "Yap yap yap yap yap"
+++

It's been awhile! There's a bunch of updates and the ending of my month long gamejam. I'll be splitting them into a couple posts because I find these hard to write! So, it's been thirty-one days since I started this game. It's hard to feel accomplished because the entirety of the time was spent on mechanics.

I've been following [_Production Point_](https://uheartbeast.itch.io/production-point) by Benjamin Anderson which stresses the importance of prototyping first, and then production. In this case production is creating content, namely assets, writing, etc. So I knew ahead of starting this that the end product would not be something I could show off to friends. However, its still hard to see friends go "So can I see your game?" and its just a pill walking around and talking to NPCs.

All of that said, I knew what my goals were, and I would say I accomplished more than I planned to. I have a good base to start adding onto and that is just as important as a sexy demo. Enough yapping though!

## Dialogue

I lied, we're gonna keep yapping. But it will be to our friendly bartender Cordova. In this update I'll be showing off the dialogue system and rough UI. Keep in mind that the UI, dialogue content etc. is not final and _will_ be changed. This was just enough to prototype both the player experience and the development experience.

I did have some help in this endeavor. I opted to use [Godot Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager). This sped up development tremendously since it handles line delivery, options, state, etc. It also has the added bonus of all the dialogue being in text files which makes it really nice to version control.

So I wrote some rough dialogue, between our player character, Cordova and "John" who is a performer at the bar _Terminus_. John doesn't have a mesh, but I wanted to test the dialogue with more than two characters. The syntax for the dialogue is pretty intuitive, and I'm happy with it. I may write a converter between Twee and the syntax for Dialogue Manager, but we'll see.

For the UI, I did a pretty basic setup that shows who the speaker is, their portrait and the responses. Since I have no portraits yet, I used some [Placecats](https://placecats.com/). So maybe they're not accurate, but at least they're cute.

{{< video src="yap.mp4" >}}
