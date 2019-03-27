local utils = {
	seed = love.math.random(0, 1000000)
}

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

function utils.valueToPixel(value, min, max)
	max = max - min
	value = math.min(max, math.max(0, value - min)) / max
	return value, value, value
end

function utils.contrast(value, factor)
	return math.tanh(factor * value - (factor / 2)) + 0.5
end

function utils.noise(x, y, scale)
	return love.math.noise(x / scale, y / scale, utils.seed)
end

return utils