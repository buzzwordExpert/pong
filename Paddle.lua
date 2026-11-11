Paddle = Class{}

function Paddle:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
end

function Paddle:update(dt)

    -- restricting the paddles to stay inside game window
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

-- to be called in our main function in 'love.draw', ideally. Uses Love2D's 
-- 'rectangle' function, which takes in a draw mode as the first argument
-- as well as the position and dimensions for the rectanglel. To change
-- the color, one must call 'love.graphics.setColor'. Can draw rounded rectangles
-- aswell with the newest version of Love2D

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end