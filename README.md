# CGRA 252 Game Engine Programming
*NOTE:* Built in Godot 4.1

## Your name
Niamh Kirsty Ferns

### Online Aliases:
*I have these here noted in-case the names on my commits mess up without me noticing.*
- Sleebee
- KaosBunny

## Assignment 1
## Title of the Game
Phlappi I3ird - The Phlappening

**Video:** https://drive.proton.me/urls/HCNQ1HM2HW#1iUQljlHiKHQ

# Game Description
## Summary
Phlappi I3ird - The Phlappening is a re-imagining of Flappy Bird but this time you're controlling the pipes, not the bird.


## Controls
### Movement
Up and Down Arrows.

## Goal
**Survive!**

Your only goal in this game is to survive as long as possible. Score is tallied as you go through each obstacle and your only goal is to make it through as many obstcles as possible.

## Game Mechanic
The main mechanic of this game is based on movement and predication. You want to try to predict where the bird will be and move your obstacle in time so that the bird doesn't hit it.

## Coding Challenge
The game overall was fairly easy to put together but I'd say the most challenging aspect would either bet the bird's AI (getting this to look smooth is hard) or figuring out the options menu.

For the options menu, I ended up creating a singleton that holds all the values for the settings and then these can be updated or pulled by different parts of the game.

## Interesting feature
Given it's a very simple game, I'd say the most interesting feature is just the pipe movement itself. The pipes automatically switch based on the one that is directly in font of the player so you need ot think not just of the pipe your currently focused on but need to be ready to move the next pipes after that as well.

# Reflection
Over all I did feel like I learned a lot from this, especially in organising my projects and in how to use Godot but because of the game I decided to make, I wasn't particularly challenged in terms of complexity.

I'm going to break this section down into 4 main sections: Code, Engine, Design, and Git Usage related issues.

## Code
Coding with Godot is, thankfully, incredibly simple. The engine is a joy to work with and because of this I feel like it was fairly easy to avoid some common pitfalls that I would have fallen into doing this from scratch (handling physics being a big one).

I do need to improve on my "componentisation" of my code, though. That is, currently a lot of my components are very interdependent. The options menu is responsible for handling parts of it's children (namely the audio slider). Ideally this wouldn't be the case and I'd have just used signals to handle all this. Another example would be how I handled dark mode. Ideally, there would be some way that a person implementing dark mode features for textures in the game in the future would easily be able to follow a pattern put in place earlier but currently you just have to know that it expects a certain string value and it can vary from component to component making reading the code annoying or inconsistent.

I also need to work more with connecting signals and exporting editor editable values more. Currently these are hidden in code and it makes them hard to find/annoying to work with. To add onto this, building my own classes would have been nice and also having a logging system in place would be nice.

## Engine
I feel like I made good use of engine features overall. In particular, I'm proud of my use of AnimatedSprite2Ds to handle night mode because it means I can change the texture of even static elements with a simple string. No having to load resources in code because I can handle those assets with the engine's UI.

I still need to find my way around many of the features of Godot, though. The animation tree and working with tilesets for example are two parts of the engine I haven't had the opportunity to touch because I picked a simple game to build.

## Design
The game design is simple and easy to follow which is good but it leaves a lot lacking in terms of expandability.

Not really much else to add. I feel that I could have designed the movement better for the bird but that would have taken excess time.

## Git Usage
I feel I used git well but my commit consistency and branching could use some work. I didn't make use of the issue tracker because I find tracking my work locally to be much easier for solo-projects. 

Commit messages in particular I think I need to work on. There were often times where I'd work on two or three separate* things and because it would take too much time to split them up cleanly, they all just end up in one mega-commit. Not good for tracking and not good for other devs trying to catch up on my work.

## Conclusion
I feel like this, in the future, gives me a better understanding of what features of the engine I should use when. Trying to build the movement myself for the bird for example, not a good idea. In the future I should be using RigidBody and controlling the physics through the inbuilt physics engine. Trying to connect all the signals manually in engine is rather rigid and so it would be best to use code to `.connect()` on a signal when I need it.

A good example of this pattern that I'd like to use in the future is connecting to a signal on `_ready()`.

```gdscript
func _ready():
    sig.connect(_on_sig_detection)

func _on_sig_detection():
    # Do stuff here...
```

There are a few smaller bits and pieces like this but it's all mostly in how all the pieces fit together, not how the engine works fundamentally.
