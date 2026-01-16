-- File: main.lua
-- Import scripts
local pipe = require "src.Scripts.pipe"

-- Deactivate 3D mode
love.graphics.set3D(false)

-- Initialize variables
local gameState = "pause"
local score = 0
local playcount = 0
local highscore = 0
local player = {
    x = 0,
    y = 0,
    speed = 0,
    maxSpeed = 200,
    size = 0
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
    if gameState == "play" then
        player.speed = -100
    end
    if gameState ~= "gameOver" then
        gameState = "play"
    end
end

-- Deal with touch release
function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

-- Function to initialize the game
function love.load()
    player.x = widthTop / 4
    player.y = heightTop / 2
    player.size = (widthTop / 40)
end

-- Function to update the player's position
local function movePlayer(dt)
    player.y = player.y + player.speed * dt
    if player.y < player.size then
        player.y = player.size
    elseif player.y > heightTop - player.size then
        player.y = heightTop - player.size
    end
    player.speed = player.speed + 200 * dt
    if player.speed > player.maxSpeed then
        player.speed = player.maxSpeed
    end
end

-- Function to draw the player
local function drawPlayer()
    love.graphics.rectangle("fill", player.x - player.size, player.y - player.size, (player.size * 2),
        (player.size * 2), 10, 10)
end

-- Function to handle pipes
local function handlePipes(dt)
    if lastPipe == 0 then
        table.insert(pipes, pipe.newPipe(widthTop, heightTop))
        lastPipe = lastPipe + dt
    else
        lastPipe = lastPipe + dt
        if lastPipe >= 2.5 then
            lastPipe = 0
        end
    end
    local pipesToRemove = {}
    for i, p in ipairs(pipes) do
        pipe.movePipe(p, dt)
        if pipe.isPipeColliding(player.x, player.y, player.size, p) then
            gameState = "gameOver"
        end
        if pipe.shouldDestroy(p) then
            table.insert(pipesToRemove, (i))
        end
    end
    for i, id in ipairs(pipesToRemove) do
        table.remove(pipes, id)
    end
end

-- Function to calculate each frame
function love.update(dt)
    if gameState ~= "pause" then
        movePlayer(dt)
    end
    if gameState == "play" then
        handlePipes(dt)
    end
end

-- Function to draw the calculated frame
function love.draw(screen)
    -- Draw on top screen
    if screen ~= "bottom" then
        drawPlayer()
        for i, p in ipairs(pipes) do
            pipe.drawPipe(p)
        end
    end

    -- Draw on bottom screen
    if screen ~= "top" then
        love.graphics.print("Press Start to quit.", 0, 0)
        love.graphics.print("Press Select to pause.", 0, 20)
    end
end

-- Function to check for input
function love.gamepadpressed(joystick, button)
    if button == "start" then
        love.event.quit()
    end
    if button == "back" and gameState ~= "gameOver" then
        gameState = "pause"
    end
end
