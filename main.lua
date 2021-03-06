function love.load()
    love.graphics.setBackgroundColor(92,217,255)
    
    playerLeft=love.graphics.newImage("jiggy02.jpg")
    playerRight=love.graphics.newImage("jiggy.jpg")
    player={}
    player.image=playerRight
    player.x=400
    player.y=303
    player.speed=200
    player.y_velocity=303
    gravity=600
    jumpHeight=-200
    
end
-------------------
--- LOVE.UPDATE ---
-------------------
function love.update(dt)

    if (player.x>735) then

        if (love.keyboard.isDown('left') or love.keyboard.isDown('a') or love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
            player.x=player.x-(player.speed*dt)
        end

    elseif (player.x<-10) then

        if (love.keyboard.isDown('left') or love.keyboard.isDown('a') or love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
            player.x=player.x+(player.speed*dt)
        end

    else

        if (love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
            player.image=playerRight
            player.x=player.x+(player.speed*dt)
        elseif (love.keyboard.isDown('left') or love.keyboard.isDown('a')) then
            player.image=playerLeft
            player.x=player.x-(player.speed*dt)
        else
            player.image=playerIdle
            player.x=player.x
        end

    end

    if (player.y_velocity ~= 303) then
        player.y = player.y + player.y_velocity * dt
        player.y_velocity = player.y_velocity - gravity * dt

        if (player.y < 303) then
            player.y_velocity = 303
            player.y = 303
        end

    end


end
-----------------------
--- LOVE.KEYPRESSED ---
-----------------------
function love.keypressed(key)

    if (key == " ") then

        if (player.y_velocity == 303) then
            player.y_velocity = jumpHeight
        end

    end

end
-----------------
--- LOVE.DRAW ---
-----------------
function love.draw()
love.graphics.draw("jiggy.jpg", player.x, player.y)
end
