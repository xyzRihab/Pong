function handleBallCollisions(dt)

    if ball:collides(player1) then
        bounceBallOffPaddle(player1)
    end

    if ball:collides(player2) then
        bounceBallOffPaddle(player2)
    end

end

function bounceBallOffPaddle(player)

    ball.dx = -ball.dx * 1.03
    ball.x = player.x + (player == player1 and 5 or -4)

    if ball.dy < 0 then
        ball.dy = -math.random(10, 150)
    else
        ball.dy = math.random(10, 150)
    end

end

function handleBallBoundaryCollisions()

    if ball.y <= 0 then
        ball.y = 0
        ball.dy = -ball.dy
    end

    if ball.y >= VIRTUAL_HEIGHT - 4 then
        ball.y = VIRTUAL_HEIGHT - 4
        ball.dy = -ball.dy
    end

end
