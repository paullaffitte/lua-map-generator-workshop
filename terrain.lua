local utils = require "utils"

local terrain = {}

function terrain:load()
	self.assets = {
		dirt = love.image.newImageData("assets/dirt.png"),
		grass = love.image.newImageData("assets/grass.png"),
		sand = love.image.newImageData("assets/sand.png"),
		snow = love.image.newImageData("assets/snow.png"),
		water = love.image.newImageData("assets/water.png")
	}
end

function terrain:render(x, y)
	if utils.noise(x, y, 30) > 0.5 then
		return utils.pixelFromTexture(x, y, self.assets.water)
	end
	return utils.pixelFromTexture(x, y, self.assets.sand)
end

function terrain:nearestBiome(temperature, humidity, biomes)
	return "dirt"
end

return terrain