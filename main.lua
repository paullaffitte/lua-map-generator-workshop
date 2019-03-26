local terrain = require "terrain"

local size = { height = 720, width = 1280 }
local chunkSize = 128
local position = { x = 1, y = 1}
love.window.setMode(size.width, size.height, {})

function love.load()
	outputData 	= {}
	output 		= {}

	terrain:load()
end

function toChunkPosition(x, y)
	return math.floor(x / chunkSize), math.floor(y / chunkSize)
end

function renderChunk(x, y)
	for i = 0, chunkSize - 1 do
		for j = 0, chunkSize - 1 do
			r,g,b = terrain:render(i + x * chunkSize, j + y * chunkSize)

			outputData[x][y]:setPixel(i, j, r, g, b, 1)
		end
	end
	output[x][y]:replacePixels(outputData[x][y])
end

function renderTerrain(x, y, w, h)
	for i = -1, w / chunkSize do
		for j = -1, h / chunkSize do
			chunkX, chunkY = toChunkPosition(x, y)
			chunkX, chunkY = chunkX + i, chunkY + j

			if outputData[chunkX] == nil then
				outputData[chunkX] = {}
				output[chunkX] = {}
			end

			if outputData[chunkX][chunkY] == nil then
				outputData[chunkX][chunkY] = love.image.newImageData(chunkSize, chunkSize)
				output[chunkX][chunkY] = love.graphics.newImage(outputData[chunkX][chunkY])
				renderChunk(chunkX, chunkY)
				return
			end
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
	updateView()
end

function love.draw()
	for i = -1, size.width / chunkSize do
		for j = -1, size.height / chunkSize do
			chunkX, chunkY = toChunkPosition(position.x, position.y)
			if output[chunkX + i] ~= nil then
				local outputChunk = output[chunkX + i][chunkY + j]
				if outputChunk ~= nil then
					love.graphics.draw(outputChunk, -position.x % chunkSize + i * chunkSize, -position.y % chunkSize + j * chunkSize)
				end
			end
		end
	end
end

function love.keypressed(k)
   if k == 'escape' then
      love.event.quit()
   end
end
