local utils = require "src.utils"

local terrain = {}

function terrain:load()
	self.assets = {
		dirt  = love.image.newImageData("assets/dirt.png"),
		grass = love.image.newImageData("assets/grass.png"),
		sand  = love.image.newImageData("assets/sand.png"),
		snow  = love.image.newImageData("assets/snow.png"),
		stone = love.image.newImageData("assets/stone.png"),
		water = love.image.newImageData("assets/water.png")
	}
end

local yMax = 0
function terrain:render(x, y)
	if y > yMax then
		yMax = y
	end

	return 	x / yMax,		-- red
			y / yMax,		-- green
			(x + y) / yMax	-- blue
end

return terrain
