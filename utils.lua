local utils = {}

function utils.worldToTexPosition(x, y, texture)
	return x % texture:getWidth(), y % texture:getHeight()
end

function utils.pixelFromTexture(x, y, texture)
	local x,y = utils.worldToTexPosition(x, y, texture)
	return texture:getPixel(x, y)
end

function utils.mergePixels(r1,g1,b1, r2,g2,b2, ratio)
	ratio = math.min(1, math.max(0, ratio))
	return r1 * (1 - ratio) + r2 * ratio, g1 * (1 - ratio) + g2 * ratio, b1 * (1 - ratio) + b2 * ratio
end

local seed = love.math.random(0, 10000)
function utils.noise(x, y, scale)
	return love.math.noise(x / scale, y / scale, seed)
end

return utils