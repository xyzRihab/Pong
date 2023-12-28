push = require 'push'
Class = require 'class'
require 'Paddle'
require 'Ball'

collisions = require "collisions"
scoring = require "scoring"
playerControls = require "playerControls"

display = require "display"

WINDOW_WIDTH = 700
WINDOW_HEIGHT = 600

VIRTUAL_WIDTH = 300
VIRTUAL_HEIGHT = 257

PADDLE_SPEED = 200

function love.load()

    love.window.setTitle('Pong')
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 24)
    fonts = {smallFont, scoreFont}

    math.randomseed(os.time())

    love.graphics.setFont(fonts[1])

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    player1Score = 0
    player2Score = 0

    player1 = Paddle(10, 30, 5, 30)
    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 30)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    gameState = 'start'

end

function love.update(dt)

    if gameState == 'play' then

        handleBallCollisions(dt)
        handleBallBoundaryCollisions()
        updateScores()
        Player1Movement()
        Player2Movement()

        ball:update(dt)

    end

    player1:update(dt)
    player2:update(dt)

end

function love.keypressed(key)

    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ball:reset()
        end
    end

end

function love.draw()

    push:apply('start')
    love.graphics.clear(57 / 255, 134 / 255, 238 / 255, 255 / 255)

    love.graphics.setFont(fonts[1])

    displayState(gameState)

    displayScore(player1Score, player2Score)

    player1:render()
    player2:render()

    ball:render()

    push:apply('end')

    displayFPS()

end
