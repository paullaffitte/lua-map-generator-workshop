# Lua Map Generator [WORKSHOP]

This workshop will introduce you to 2D map generation in [lua](https://www.lua.org) language, with the help of [LÖVE2D](https://love2d.org).

Here is an example of what you could obtain.
![island](https://github.com/paullaffitte/lua-map-generator-workshop/blob/master/example/island.png)

## What is map generation ?
Map generation is a powerful technique used in many games to create map or parts of a map with algorithms. The method of creating data from algorithms is named [procedural generation](https://en.wikipedia.org/wiki/Procedural_generation). It has been used in a lot of games, like The Elder Scrolls (most of them), Age of Empire, The Binding of Isaac, No Man's Sky, or the well known Minecraft.

## The boilerplate architecture
You can find at the root of the repository three folders.
- [`assets`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/assets) basic assets to quickly bootstrap you generator
- [`example`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/example) example project
- [`src`](https://github.com/paullaffitte/lua-map-generator-workshop/tree/master/src) you already know ;)

### Launch the generator
To launch the generator, you obviously need to have [lua](https://www.tecmint.com/install-lua-in-centos-ubuntu-linux) and [LÖVE2D](https://love2d.org) installed. Then you can run love in the root of this repository with `love .` and you can even give a specific [seed](https://en.wikipedia.org/wiki/Random_seed) to your generator with `love . 8436`

### The src folder
In the src folder, you can found the `terrain.lua` file, it's in this file that you're expected to code. But feel free to look at the other files, you could learn some interesting stuff, like how [chunks](https://minecraft.gamepedia.com/Chunk) works.

`game.lua` contains the main loop and handle rendering using the `terrain:render` function. `utils.lua` contains some functions that you could find useful.

## Make some noise !

### What is perlin noise ?
[Perlin noise](https://en.wikipedia.org/wiki/Perlin_noise) is a algorithm that generate noise with a pseudo-random appearance, yet all of its visual details are the same size. It can be use in any dimensions. This function is only pseudo-random and not random, therefore it can be represented in a mathematical way since for an input A, it will always return an output B, thus f(A) = B.

![perlin noise](https://upload.wikimedia.org/wikipedia/commons/d/da/Perlin_noise.jpg)

### Perlin how to
You can find a function `utils.noise(x, y)` in `utils.lua`, this function wrap a 3D perlin noise from LÖVE2D, the third dimension being used as a seed. The function takes two parameters which are the coordinates of the point to generate from the perlin noise. It can easily be used in `terrain:render(x, y)`, since they share the same prototype.

Now that we know how to generate noise, it's time to render it! You just have to return the color that you want at the position `(x, y)` in `terrain:render`, just like that `return 0, 0.7, 0.3`. The values should stay between 0 and 1.

A pretty easy way to debug your values is to use the function `utils.valueToPixel(value, min, max)`. It takes a `value` and return a pixel in gray scale with black being `min` and white being `max`.

## Get down to business

### Hawaii
Let's generate an island! To do so, let's imagine that the noise that we are generating correspond to the altitude of our map, with the sea level being 0.75, so 75% of our map will be water, the remaning 25% being earth.

You can use the fonction `utils.pixelFromTexture(x, y, texture)` to get a pixel from a texture of `terrain.assets`. Try to render either water or grass depending on the altitude. You can also merge easily two textures with `utils.mergeTextures(x, y, t1, t2, ratio)`

### Tweak parameters
You should get a pretty wierd result for now but as you can see, there is water and grass. But maybe you would like something looking more like islands. First of all, you could use several noises with different scales as described [here](https://flafla2.github.io/2014/08/09/perlinnoise.html). You can combine them in several ways depending on what you are trying to do, by sum, by average, by multiplication.

![perlin noises 1D](https://flafla2.github.io/img/2014-08-09-perlinnoise/octave01.png)

![combined perlin noises 1D](https://flafla2.github.io/img/2014-08-09-perlinnoise/octave02.png)

You can also apply modifications on noises, maybe adjusting the contrast with `utils.contrast(value, factor)`, it's a mathematical function represented as `contrast(value, factor) = (value - 0.5) * factor + 0.5`.

![contrast(value, factor) = (value - 0.5) * factor + 0.5](https://github.com/paullaffitte/lua-map-generator-workshop/blob/master/example/contrast.gif)

### Going further
Once you got fine results, you may want to add some more details. You could try to use one more noise to generate temperature, that you can use to adjust colors consequently with a blue shift when it's cold, and a red shift when it's hot. You could also generate some snow on montains or icebergs in the ocean. On the same model, why not trying to generate humidity ?

And what about biomes ? Now that you have temperature and humidity, you could try to define conditions on those both parameters to determine in what biome you are ! Let's imagine that we have two axis, the temperature is on the X axis and the humidity on the Y one. You can define a surface on the graph that describe a [biome](https://en.wikipedia.org/wiki/Biome) like on this one from wikipedia.
![Climate_influence_on_terrestrial_biome](https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Climate_influence_on_terrestrial_biome.svg/617px-Climate_influence_on_terrestrial_biome.svg.png)

Well, it's now up to you to continue to tweak your generator, add new rules, and maybe even trying to [generate maps in 3 dimensions](https://www.redblobgames.com/maps/terrain-from-noise/) ?

### Some links
#### Perlin
- [Understanding perlin noise](https://flafla2.github.io/2014/08/09/perlinnoise.html)
- [Making maps with noise functions](https://www.redblobgames.com/maps/terrain-from-noise/)
- [The book of shaders: Noise](https://thebookofshaders.com/11) (available in many languages including french)

#### Vornoi
- [Fantasy map generator](https://azgaar.github.io/Fantasy-Map-Generator/) - a webapp that help you creating map for fantasy worlds
- [Procedural Terrain Generation With Voronoi Diagrams](https://squeakyspacebar.github.io/2017/07/12/Procedural-Map-Generation-With-Voronoi-Diagrams.html)
- [The book of shaders: More noise](https://thebookofshaders.com/12) (available in many languages including french)