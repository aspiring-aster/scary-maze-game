--[[
This is a simple move player function that uses vim key binds
h = left, j = down, k = up, l = left
Pass in a player object that has a x, y, speed, animation, and movement field
At it's core this function just checks a key and then adds speed to the key direction that it moves in
There is isMoving bool that when false uses the animation to stay at the standing still frame
--]]
function MovePlayer(player)

    local isMoving = false

    -- simple key checks and x/y movement while animation is being set
    if love.keyboard.isDown('l') then -- right
        player.x = player.x + player.speed
        player.an = player.movement.right
        isMoving = true
    end
    if love.keyboard.isDown('h') then -- left
        player.x = player.x - player.speed
        player.an = player.movement.left
        isMoving = true
    end
    if love.keyboard.isDown('k') then --up
        player.y = player.y - player.speed
        player.an = player.movement.up
        isMoving = true
    end
    if love.keyboard.isDown('j') then --down
        player.y = player.y + player.speed
        player.an = player.movement.down
        isMoving = true
    end

    --set to still frame if you are not moving
    if isMoving == false then
        player.an:gotoFrame(2)
    end
end
