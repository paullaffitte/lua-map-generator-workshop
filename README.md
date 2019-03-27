# Lua Map Generator [WORKSHOP]

This workshop will introduce you to 2D map generation in [lua](https://www.lua.org) language, with the help of [LÖVE2D](https://love2d.org).

Here is an example of a result that you could obtain.
![island](https://github.com/paullaffitte/lua-map-generator-workshop/blob/master/example/island.png)

## What is map generation ?
Map generation is a powerful technique used in many games to create map or parts of a map with algorithms. The method of creating data from algorithms is named [procedural generation](https://en.wikipedia.org/wiki/Procedural_generation). It has been used in a lot of games, like The Elder Scrolls (most of them), Age of Empire, The Binding of Isaac, No Man's Sky, or the well known Minecraft.

## The boilerplate architecture
You can find at the root of the repository three folders.
- [`assets`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/assets) basic assets that you can use to quickly bootstrap you generator
- [`example`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/example) example project
- [`src`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/src) you already know ;)

### Launch the generator
To launch the generator, you obviously need to have [lua](https://www.tecmint.com/install-lua-in-centos-ubuntu-linux) and [LÖVE2D](https://love2d.org) installed. Then you can run love in the root of this repository with `love .` and you can even give a specific [seed](https://en.wikipedia.org/wiki/Random_seed) to your generator with `love . 8436`

### The src folder
In the src folder, you can found the `terrain.lua` file, it's in this file that you're expected to code. But feel free to look at the other files, you could learn some interesting stuff, like how [chunks](https://minecraft.gamepedia.com/Chunk) works ;)

`game.lua` contains the main loop and handle rendering using the `terrain:render` function. `utils.lua` contains some functions that you could find useful.

## Make some noise !

### What is perlin noise ?

### Perlin how to
// how to generate a perlin noise and show it with utils functions + contrast

## Get down to business

### Hawaii
// create island with pixelFromTexture and mergePixels

### Improvements
// temperature generation
// humidity generation
// biomes
