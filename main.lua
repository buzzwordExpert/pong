-- library initializations
push = require 'push'
Class = require 'class'


-- size of our actual window
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- size of the window we will emulated with push
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load() 

    -- setting love's default filter to "nearest-neighbour filtering"
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- title of the application window
    love.window.setTitle('Pong')

    -- initialize text fonts
    smallFont = love.graphics.newFont('font.ttf', 8)
    largeFont = love.graphics.newFont('font.ttf', 16)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    -- initializing window
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = false,
        fullscreen = false,
        vsync = false
    })

    -- initialize our virtual resolution, which will be rendered within
    -- our actual window no matter its dimensions
    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })

end


function love.draw()
    -- begin drawing with push, in our virtual resolution
    push.start()

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.printf('Hello, Pong!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')

    -- end our drawing to push
    push.finish()
end
