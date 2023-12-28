function updateScores()

    if ball.x < 0 then
        player2Score = player2Score + 1
        ball:reset()
        gameState = 'start'
    end

    if ball.x > VIRTUAL_WIDTH then
        player1Score = player1Score + 1
        ball:reset()
        gameState = 'start'
    end

end
