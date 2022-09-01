function love.load()
    score = 0
 paddle = {}
    paddle.x = 100
    paddle.y = 500
    paddle.width = 120
    paddle.height = 20
ball = {}
   ball.x = 200
   ball.y = 300
   ball.height = 20
   ball.width = 20
   ball.angle = 380
   touching = 0
end



function love.draw()
     love.graphics.setColor(1, 1, 1)
     love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
         love.graphics.setColor(0, 4, 0)
     love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)

     input()
     ballmovement()
     if checkCollision(ball , paddle) then
        if ball.touching  then
         ball.angle = ball.angle / 10 + 180  + love.math.random(-10, 10)

         ballmovement()
         score = score + 1
         ball.touching = 1
        end
     else
        ball.touching = 0
     end
     love.graphics.setColor(2, 2, 0)
     love.graphics.print("score:")
     love.graphics.print(score , 35 ,0 )
end

function input()
if love.keyboard.isDown("right") then
    paddle.x = paddle.x + 10 
end
if love.keyboard.isDown("left") then
    paddle.x = paddle.x + -10 
end
end






--thx to https://sheepolution.com/learn/book/13 for this script other than this the script is under cc0 contact me on scratch 
function checkCollision(a, b)
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end
function outofboundscheck()
 if ball.x < 1 then 
    ball.x = 800

 end
 if ball.x > 800 then 
    ball.x = 1
 end
 if ball.y < 1 then 
    ball.angle = ball.angle + 180 + love.math.random(-10, 10)
    ball.y = 1
 end
 if ball.y > 800 then 
    ball.y = 1
    ball.angle = ball.angle + love.math.random(-10, 10)

 end

end
function ballmovement()
   ball.y = ball.y + math.sin(ball.angle) * 10
   ball.x = ball.x + math.cos(ball.angle) * 10
   outofboundscheck()
   if ball.angle  > 360 then 
     ball.angle = ball.angle % 360
   end
   if ball.angle  < 1 then 
     ball.angle = ball.angle % 360
   end
  

end
