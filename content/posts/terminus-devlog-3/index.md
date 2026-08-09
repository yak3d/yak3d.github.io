+++
date = '2026-08-09T09:16:11-04:00'
draft = false
description = "Interaction and rolling implemented!"
title = 'Terminus Devlog 3'
tags = ["gamedev", "terminus", "devlog"]
+++

The first mechanic is ready to test out/prototype. Skill checks! Skill checks are a big part of an TTRPG/CRPG but are easier to sort out than combat so I decided to tackle them early on. We also needed the ability to interact with objects in the world so I implemented a very basic version if interaction.

## Interaction

The player can click on interactable objects, which will move them towards it and then "interact". The interaction is defined by the object itself. In this case, there's a cube called the Cirdaroh Cube that needs repairing. When you click on it, you'll move towards it and then perform a check.

## Attributes + Skills

In order to support skill checks and rolls generally, I added attributes and skills to our character entities. Attributes in CWN are similar to D&D 5e where you have an attribute score, and that score dictates a modifier. I've taken the creative liberty here to adopt what Pathfinder 2e does and just have you select modifiers. There's one rule in the CWN SRD that requires an attribute score check.

> **3.6.8.2 Cyber-Induced Psychosis (CIP)**
>
> A subject whose Alienation score rises above their Wisdom attribute score breaks down entirely, becoming enslaved to their existing adaptations.

For CIP I'll alter it to use the modifier instead, just to make things simple. As development goes along and I find a need to have attribute scores I'll add them back.

There's a set of skills in CWN, and player characters who are trained in a skill have at least Level 0 in that skill. If a PC is untrained in that skill, then they have a -1 penalty when performing checks with that skill. This system has also been added to Terminus.

Also to support this, I added a debug menu to set the player's name and their attributes. Skills coming soon!

## Skill Checks

In CWN, you perform skill checks by rolling 2d6, adding your skill level and a modifier. For example, if you were attempting to fix something that required your brain you could be asked to do a **Fix**/**Intelligence** skill check. If you had level 2 in **Fix** and +1 **Intelligence**, you'd perform 2d6+2+1 and check it against a DC.

This system will take into account the players skill level, the relevant modifier and perform the roll. The result will tell the denote if they succeeded or failed, and by how much.

In the below demo video, I show off everything above. The player moves, interacts, performs the **Fix**/**Intelligence** check and on success "repairs" the cube. Repairing this case just swaps the material from yellow to green. Full screen is recommended to see the log.
<br />

{{< video src="terminus-devlog-3.mp4" >}}
