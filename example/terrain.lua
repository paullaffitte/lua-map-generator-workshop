local utils = require "src.utils"

local terrain = {}

function terrain:load()
	self.assets = {
		dirt = love.image.newImageData("assets/dirt.png"),
		grass = love.image.newImageData("assets/grass.png"),
		sand = love.image.newImageData("assets/sand.png"),
		snow = love.image.newImageData("assets/snow.png"),
		stone = love.image.newImageData("assets/stone.png"),
		water = love.image.newImageData("assets/water.png")
	}
end

function terrain:render(x, y)
	contientAltitude = utils.contrast(utils.noise(x, y, 500) - 0.15, 3.8)
	noise1 = utils.contrast(utils.noise(x, y, 70), 0.7)
	noise2 = utils.contrast(utils.noise(x, y, 30), 0.4)
	altitude = (contientAltitude * noise1 - 0.35) * noise2
	altitude = altitude * 320

	if altitude > 60 then
		return utils.mergeTextures(x, y, self.assets.stone, self.assets.snow, (altitude - 55) / 15)
	end
	if altitude > 30 then
		return utils.pixelFromTexture(x, y, self.assets.stone)
	end
	if altitude > 4 then
		return utils.pixelFromTexture(x, y, self.assets.grass)
	end
	if altitude > 0 then
		return utils.mergeTextures(x, y, self.assets.sand, self.assets.grass, (altitude - 2) / 2)
	end

	return utils.mergeTextures(x, y, self.assets.water, self.assets.sand, (altitude + 10) / 25)
end

return terrain
