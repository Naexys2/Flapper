function love.draw(screen)
    local width, height = love.graphics.getDimensions(screen)
    love.graphics.print("Hello World!", width / 2, height / 2)
end

function love.gamepadpressed(joystick, button)
    love.event.quit()
end