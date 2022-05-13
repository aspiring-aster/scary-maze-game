--[[
The load function is needed to load in libs,sprites, and make player object
--]]
function love.load()

    -- load libs/scripts
    Anim8 = require "libs/anim8"
    Player = require "scripts/player"
    Sti = require "libs/sti"
    -- Winfield = require "libs/Windfield"
    Camera = require "libs/camera"

    --load any needed graphics
    Map1 = Sti('maps/map1.lua')
    love.graphics.setDefaultFilter('nearest',"nearest")
    PlayerSprite = love.graphics.newImage('sprites/DW_OMORI.png')


    P = {} -- player table with
    P.x = 0
    P.y = 0
    P.speed = 1
    P.spriteSheet = PlayerSprite
    P.grid = Anim8.newGrid(32,32,P.spriteSheet:getWidth(),P.spriteSheet:getHeight())

    P.movement = {} -- player move object to swap animation depending from spritesheet that is turned into a grid above
    P.movement.down = Anim8.newAnimation(P.grid('1-3',1),0.3)
    P.movement.up = Anim8.newAnimation(P.grid('1-3',4),0.3)
    P.movement.right = Anim8.newAnimation(P.grid('1-3',3),0.3)
    P.movement.left = Anim8.newAnimation(P.grid('1-3',2),0.3)
    P.an = P.movement.down --global to switch animation in the MovePlayer function

end




--[[
For most runtime behavior
--]]
function love.update(dt)

    MovePlayer(P)
    P.an:update(dt)
end



--[[
draw sprites on screen and works like a stack
--]]
function love.draw()

    Map1:draw()
    P.an:draw(P.spriteSheet,P.x,P.y,nil,2)
end
