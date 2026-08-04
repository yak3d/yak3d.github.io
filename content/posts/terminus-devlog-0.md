+++
date = '2026-08-03T20:06:26-04:00'
draft = false
title = 'Terminus Devlog 0'
tags = ["gamedev", "terminus", "devlog"]
+++

This will be the first of (hopefully) many dev logs about a game I'm going to be prototyping over the next thirty days or so. I wouldn't say this is my "dream" game, but nor is it small in scope necessarily. It'll probably be more than a solo developer could do. I've accepted that, but still want to give it a shot.

## What is the Game?

[Terminus](./2025-01-02-intro-to-terminus.md) was (and may still be) a Creation for Starfield. However, I found working in CreationKit a little frustrating and given I have the next month or so free I wanted to have a bit more freedom from frustrations. I've pivoted now to making Terminus a CRPG based on [Cities Without Number](https://www.drivethrurpg.com/en/product/449079/cities-without-number) by Kevin Crawford. CWN has its System Reference Document with a Creative Commons 0 license. My hope here is that I can use this to offload a lot of the thinking I'll have to do on the mechanics.

Talking scope, I recognize RPGs are probably _the_ worst type of game to start with. My hope here is I can get the core mechanics prototyped this month and then slowly burn away at content. That being said, I really wanted to limit the scope of the content since that's a major reason CRPGs are hard to make.

## A Note About Generative AI

Generative AI has taken the world by storm, you cannot even walk outside without seeing something about it. Here's how I'm treating it for this project:

1. Absolutely zero generative AI for art. This includes textures, meshes, music, voices etc.
   - This is for a few reasons. I don't think the end result is very good, some of the art I can do myself and if I can't there are tons of folks who are available for commission that do some awesome work. I think art forms thrive when multiple people work on them together and I look forward to embracing that.
   - I also believe asset stores are a boon to solo developers and look forward to utilizing those as well where applicable.
2. The "boring stuff", specifically things like `.editorconfig` files or other IDE configurations
3. Building tooling. Godot is an open source engine, so its support in text editors isn't the same across the board. I've had success getting a custom VSCodium plugin to auto-complete node names, resource names, animation names etc. I've also been using Claude Code to build a web front end for [Lore](https://lore.org/) which is a new VCS by Epic Games, tailored to games and open source.
4. Learning. This is one aspect of LLMs that I think go a little under utilized. I've recently been going through [GDQuest's 3D Course](https://school.gdquest.com/products/learn_3d_gamedev_godot_4) course and absolutely loving it. However to escape from "tutorial hell" I've found I need to spread my wings and fly. This is scary though, when you don't have a mentor.
   - I personally struggle with Discord communities. There's a lot of them, and sometimes your questions go unanswered for hours. If they do get answered sometimes its not the answer that helps you. These communities are still great and I like engaging in them. However, as a learning tool they're not for me.
   - My process so far has been to search the Godot docs, then do a Kagi search for my problem like the good old days. If I then can't find an answer, I will ask Claude and continue asking questions until _I_ understand.
5. Not writing the code. I actually think this could make a working game. I'm doing this for the fun of it. Writing the code to me is very fun! So I don't want to outsource it. I also don't like putting my name on things I don't understand. LLMs generate far more code than I could keep up with.

I'm not under the illusion that I'll finish this, or even get to the point of production but I figured it could be a fun way to get my feet wet. I'd rather not finish something that I'm interested in working on, than finish something I'm not quite interested in!
