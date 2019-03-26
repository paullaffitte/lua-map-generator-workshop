local terrain = require "terrain"

local size = { height = 300, width = 300 }
local position = { x = 0, y = 0}
love.window.setMode(size.width, size.height, {})

function love.load()
	outputData 	= love.image.newImageData(size.width, size.height)
	output 		= love.graphics.newImage(outputData)
	terrain:load()
end

function renderTerrain(x, y, w, h)
	for i = 0,w-1 do
		for j = 0,h-1 do
			r,g,b = terrain:render(i + x, j + y)
			outputData:setPixel(i, j, r, g, b, 1)
		end
	end
end

function updateView()
	speed = 200
	if love.keyboard.isDown("left") then
		position.x = position.x - speed * love.timer.getDelta()
	end
	if love.keyboard.isDown("right") then
		position.x = position.x + speed * love.timer.getDelta()
	end
	if love.keyboard.isDown("up") then
		position.y = position.y - speed * love.timer.getDelta()
	end
	if love.keyboard.isDown("down") then
		position.y = position.y + speed * love.timer.getDelta()
	end
end

function love.update()
	renderTerrain(position.x, position.y, size.width, size.height)
	output:replacePixels(outputData)
	updateView()
end

function love.draw()
	love.graphics.draw(output)
end
