

Powerup = Class{}

function Powerup:init(skin)

    self.width =16
    self.height = 16
    self.y=   -20
    self.x = math.random(16, VIRTUAL_WIDTH -16)
    self.dy = 40
    self.skin =  skin
    self.inPlay = true

end    

 
function Powerup:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    self.inPlay = false
    return true
end

function Powerup:update(dt)
    if self.inPlay then
    self.y = self.y + self.dy * dt
    end
end


function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'],gFrames['powerups'][self.skin],self.x,  self.y)
    end
end
