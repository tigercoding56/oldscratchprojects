function love.load()
  map = {}
  map.x = {}
  map.y = {}
  map.z = {}
   for i=1,1000 do
    table.insert(map.x, love.math.random(-1000 , 1000 ))
    table.insert(map.y,love.math.random(-1000 , 1000 ) )
    table.insert(map.z, love.math.random(-1000 , 1000 ))
    
   
       
    end
end
-- thx to  https://scratch.mit.edu/projects/41444922/ for 3d equation  

function love.draw()
    love.graphics.rectangle("fill", 100, 50, 200, 150)
end





function convert3dto2d(local_x, local_y, local_z) 


end