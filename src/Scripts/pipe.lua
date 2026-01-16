-- File: pipe.lua
-- Function to create and return a pipe object
function newPipe(screenWidth, screenHeight)
    local pipeObject = {
        x1 = 0,
        y1 = 0,
        width1 = 0,
        height1 = 0,
        x2 = 0,
        y2 = 0,
        width2 = 0,
        height2 = 0
    }
    local pipeWidth = screenWidth / 10
    local pipeHeight = math.random(screenHeight / 10, (screenHeight / 10) * 6)
    pipeObject.x1 = screenWidth
    pipeObject.x2 = screenWidth
    pipeObject.y1 = 0
    pipeObject.y2 = pipeHeight + ((screenHeight / 10) * 3)
    pipeObject.width1 = pipeWidth
    pipeObject.width2 = pipeWidth
    pipeObject.height1 = pipeHeight
    pipeObject.height2 = screenHeight - pipeObject.y2
    return pipeObject
end

-- Function to return new pipe coordinates after movement
function movePipe(pipeObject, dt)
    local pipeSpeed = 100
    x1 = pipeObject.x1 + (100 * dt)
    x2 = pipeObject.x2 + (100 * dt)
    return x1, x2
end

-- Function to draw the given pipe
function drawPipe(pipeObject)
    love.graphics.rectangle("fill", pipeObject.x1, pipeObject.y1, pipeObject.width1, pipeObject.height1, 5, 5)
    love.graphics.rectangle("fill", pipeObject.x2, pipeObject.y2, pipeObject.width2, pipeObject.height2, 5, 5)
end

-- Function to check if a point is in a rectangle
local function isIn(xPoint, yPoint, xRect, yRect, width, height)
    if xRect <= xPoint and xPoint <= (xRect + width) then
        if xRect <= yPoint and yPoint <= (yRect + height) then
            return true
        end
    end
    return false
end

-- Function to check for collision between the player and the given pipe
function isPipeColliding(x, y, screenHeight, pipeObject)
    local playerSize = (screenHeight / 20)
    local playerCorners = {{
        x = x - playerSize,
        y = y - playerSize
    }, {
        x = x - playerSize,
        y = y + playerSize
    }, {
        x = x + playerSize,
        y = y - playerSize
    }, {
        x = x + playerSize,
        y = y + playerSize
    }}
    for i, corner in ipairs(playerCorners) do
        if isIn(unpack(corner), pipeObject.x1, pipeObject.y1, pipeObject.width1, pipeObject.height1) then
            return true
        end
        if isIn(unpack(corner), pipeObject.x2, pipeObject.y2, pipeObject.width2, pipeObject.height2) then
            return true
        end
    end
    return false
end

function shouldDestroy(pipeObject)
    if pipeObject.x1 < (0 - pipeObject.width1) or pipeObject.x2 < (0 - pipeObject.width2) then
        return true
    end
    return false
end
