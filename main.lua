local terrain = require "terrain"

local size = { height = 300, width = 300 }
love.window.setMode(size.width, size.height, {})

function love.load()
	outputData 	= love.image.newImageData(size.width, size.height)
	output 		= love.graphics.newImage(outputData)
	terrain:load()
end

function renderTerrain(x, y, w, h)
	for i = x,x+w-1 do
		for j = y,y+h-1 do
			r,g,b = terrain:render(i, j)
			outputData:setPixel(i, j, r, g, b, 1)
		end
	end
end

function love.update()
	renderTerrain(0, 0, size.width, size.height)
	output:replacePixels(outputData)
end

function love.draw()
	love.graphics.draw(output)
end