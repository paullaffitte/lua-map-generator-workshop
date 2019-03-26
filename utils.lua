local utils = {}

function utils.worldToTexPosition(x, y, texture)
	return x % texture:getWidth(), y % texture:getHeight()
end

function utils.pixelFromTexture(x, y, texture)
	x, y = utils.worldToTexPosition(x, y, texture)
	return texture:getPixel(x, y)
end

local seed = love.math.random(0, 10000)
function utils.noise(x, y, scale)
	return love.math.noise(x / scale, y / scale, seed)
end

return utils