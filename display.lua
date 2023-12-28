function displayState(gameState)
    if gameState == 'start' then
        love.graphics.printf('Start State!', 0, 20, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('Play State!', 0, 20, VIRTUAL_WIDTH, 'center')
    end
end

function displayFPS()
    love.graphics.setFont(fonts[1])
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end

function displayScore(player1Score, player2Score)
    love.graphics.setFont(fonts[2])
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 80, 10)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 60, 10)
end
