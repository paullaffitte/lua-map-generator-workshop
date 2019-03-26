local utils = {}

function utils.worldToTexPosition(x, y, texture)
	return x % texture:getWidth(), y % texture:getHeight()
end

function utils.pixelFromTexture(x, y, texture)
	x, y = utils.worldToTexPosition(x, y, texture)
	return texture:getPixel(x, y)
end

local noiseSeed = {
	x = love.math.random(),
	y = love.math.random()
}

function utils.noise(x, y)
	return love.math.noise(x + noiseSeed.x, y + noiseSeed.y)
end

return utils