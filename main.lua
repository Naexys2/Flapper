-- File: main.lua
-- Import scripts
local pipe = require "src.Scripts.pipe"

-- Deactivate 3D mode
love.graphics.set3D(false)

-- Initialize variables
local score = 0
local playcount = 0
local highscore = 0
local player = {
    x = 0,
    y = 0,
    speed = 0,
    maxSpeed = 100
}
local pipes = {}
local lastPipe = 0

local widthTop, heightTop = love.graphics.getDimensions("top")
local widthBottom, heightBottom = love.graphics.getDimensions("bottom")

-- Array to keep track of touches data
local touches = {}

-- Deal with touch input
function love.touchpressed(id, x, y, dx, dy, pressure)
    touches[id] = {
        x = x,
        y = y
    }
    player.speed = -100
end

-- Deal with touch release
function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

-- Function to initialize the game
function love.load()
    player.x = widthTop / 2
    player.y = heightTop / 2
end

-- Function to update the player's position
function movePlayer(dt)
    player.y = player.y + player.speed * dt
    if player.y < (widthTop / 20) then
        player.y = (widthTop / 20)
    elseif player.y > heightTop - (widthTop / 20) then
        player.y = heightTop - (widthTop / 20)
    end
    player.speed = player.speed + 100 * dt
    if player.speed > player.maxSpeed then
        player.speed = player.maxSpeed
    end
end

-- Function to draw the player
function drawPlayer()
    love.graphics.rectangle("fill", player.x - widthTop / 20, player.y - widthTop / 20, widthTop / 10,
        widthTop / 10, 10, 10)
end

-- Function to calculate each frame
function love.update(dt)
    movePlayer(dt)
end

-- Function to draw the calculated frame
function love.draw(screen)
    -- Draw on top screen
    if screen ~= "bottom" then
        drawPlayer()
    end

    -- Draw on bottom screen
    if screen ~= "top" then
        love.graphics.print("Press Start to quit.", 0, 0)
    end
end

-- Function to check for input
function love.gamepadpressed(joystick, button)
    if button == "start" then
        love.event.quit()
    end
end
