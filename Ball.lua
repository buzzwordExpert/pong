Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- variables for keeping track of our velocity on both X and Y axis
    self.dy = 0
    self.dx = 0
end

--[[
    Expects a paddle as an argument and returns true or false, depening
    on whether their rectangles overlap
    
]]
function Ball:collides(paddle)

    -- check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x >= paddle.x + paddle.width or paddle.x >= self.x + self.width then
        return false
    end
    
    -- check to see if the bottom edge of either is higher than the top edge of the other
    if self.y >= paddle.y + paddle.height or paddle.y >- self.y + self.height then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true
end

--[[
    Places the ball in the middle of the screen, with no movement
]]
function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dx = 0
    self.dy = 0
end

--[[
    Updating Ball Position
]]
function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

-- for rendering the ball as a rectangle
function Ball:rendered()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end