-- File: main.lua
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

local width_top, height_top = love.graphics.getDimensions("top")
local width_bottom, height_bottom = love.graphics.getDimensions("bottom")

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
    player.x = width_top / 2
    player.y = height_top / 2
end

-- Function to update the player's position
function movePlayer(dt)
    player.y = player.y + player.speed * dt
    if player.y < (width_top / 20) then
        player.y = (width_top / 20)
    elseif player.y > height_top - (width_top / 20) then
        player.y = height_top - (width_top / 20)
    end
    player.speed = player.speed + 100 * dt
    if player.speed > player.maxSpeed then
        player.speed = player.maxSpeed
    end
end

-- Function to draw the player
function drawPlayer()
    love.graphics.rectangle("fill", player.x - width_top / 20, player.y - width_top / 20, width_top / 10,
        width_top / 10, 10, 10)
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
