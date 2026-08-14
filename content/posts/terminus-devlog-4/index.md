+++
date = '2026-08-13T21:40:08-04:00'
draft = false
title = 'Terminus Devlog 4'
description = 'Armor, hit points, inspection and attacking, oh my!'
tags = ["gamedev", "terminus", "devlog"]
+++

It's been a few days since the last one, a lot of time was spent refactoring things to work a bit better. This means that I haven't had as much to show. However the changes I made to the code made combat hopefully easier to flesh out.

## Hit Points

Both characters and world entities now have hit points. I've been calling Player Characters (PCs) and Non-Player Characters (NPCs) "character entities" and things like our Cirdaroh Cube and destroyable door are "world entities".

World entities also can have hit points, imagine a door you want to just muscle down or a platform you can destroy to damage the people standing on it. They can be damaged just like characters!

## Armor Class

In _Cities Without Number_ characters have both ranged armor class and melee armor class. Like with many TTRPGs, in order to hit you roll your attack and if its higher than the target's AC, you hit and then roll damage.

In Terminus, character and world entities now have armor class. Currently there's no inventory system, so I've set a flat 10 as their AC plus their Dexterity modifier since 10 is the AC of "Ordinary Clothing" in the CWN SRD.

## Inspect

This is a basic take on inspection. You can right click on an entity, choose **Inspect** and it will log the current hit points of the target. Eventually, this will show the target's statblock/character sheet depending on what it is.

Right now every interaction on an object moves the player to it. For certain interactions like **Inspect** we'll want to forgo that.

## Attacks

As our first taste of combat I've added the ability to attack world entities. This is very basic, and uses a lot of hardcoded values for now since there's no inventory or weapons (yet).

In the demo below you can see the player inspecting which shows the hit points of the target, our snazzy right click context menu and then finally attacking and destroying the door.

{{< video src="terminus-devlog-4.mp4" >}}
