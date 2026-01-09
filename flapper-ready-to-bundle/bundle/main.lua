
love.graphics.set3D(false)

function love.load()
    local caca = 0
end

function love.draw(screen)
    if screen ~= "bottom" then
        local width, height = love.graphics.getDimensions(screen)
        love.graphics.print("Hello World!", width / 2, height / 2)
    end
end

function love.gamepadpressed(joystick, button)
    love.event.quit()
end