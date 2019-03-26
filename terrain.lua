local utils = require "utils"

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
	contientAltitude = math.tanh(utils.noise(x, y, 500) * 3 - 1.5) * 1.5
	altitude = (contientAltitude * utils.noise(x, y, 70) * 300 - 90) * utils.noise(x, y, 30) + 5
	if altitude > 60 then
		return utils.pixelFromTexture(x, y, self.assets.snow)
	end
	if altitude > 30 then
		return utils.pixelFromTexture(x, y, self.assets.stone)
	end
	if altitude > 3 then
		return utils.pixelFromTexture(x, y, self.assets.grass)
	end
	if altitude > 0 then
		return utils.pixelFromTexture(x, y, self.assets.sand)
	end


	local r1,g1,b1 = utils.pixelFromTexture(x, y, self.assets.water)
	local r2,g2,b2 = utils.pixelFromTexture(x, y, self.assets.sand)
	return utils.mergePixels(r1,g1,b1, r2,g2,b2, (altitude + 10) / 25)
end

return terrain
