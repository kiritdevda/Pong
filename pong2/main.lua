push = require 'push'

WINDOW_WIDTH = 1028
WINDOW_HEIGHT = 786

--VIRTUAL_WIDTH = 1028
--VIRTUAL_HEIGHT = 786
 VIRTUAL_WIDTH = 432
 VIRTUAL_HEIGHT = 243

color1 = 67;
color2 = 0;
color = 32;
colourChangeInterval = 0

function love.load()

-- below code will diaplay window with normal look and feel
 
--[[
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
    })
]]

    love.graphics.setDefaultFilter('nearest', 'nearest')

-- Below window will give retro feel this happen when we do rendering on lower resolution 
-- trick here is to use Virtual_height and VIRTUAL_WEDITH to be remerder on larger WINDOW_WIDTH and WINDOW_HEIGHT
-- This can be achieved by module/library called push

    smallFont = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
     fullscreen = false,
     resizable = false,
     vsync = true
    })

 --   love.graphics.setColor(54,215,215)
    print("In function Load")
end

function changeColour()
 --[[
    if color == color1 then
        print("setting colour red")
        love.graphics.setColor(185,0,0)
        color = color2
    elseif color == color2 then
        print("setting colour blue")
        love.graphics.setColor(0,0,235)
        color = color1
    else
        love.graphics.setColor(255,0,0)
        color=color1
    end
    ]]
end

function love.update(dt)
    print("In function update")
 --[[   colourChangeInterval = colourChangeInterval + dt
    if colourChangeInterval > 3 then
        colourChangeInterval = 0
        changeColour()
    end
    ]]
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end


function love.draw()
    push:apply('start')
    print("In function draw")
    
    --[[
        love.graphics.rectangle(mode, x, y, width, height)
        mode - mode can be fill or line
        love.graphics.printf("Hello World",0, VIRTUAL_HEIGHT / 2 - 6 , VIRTUAL_WIDTH, 'center')
    ]]
    
    
    love.graphics.clear(162/255, 217/255, 206/255,255/255)
    love.graphics.setColor(131/255, 145/255, 146/255, 255/255)
    love.graphics.printf("PONG",0,20,VIRTUAL_WIDTH,'center')

    love.graphics.setColor(211/255, 84/255, 0/255, 255/255)
    love.graphics.rectangle('fill',10,30,5,20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 25,5 ,20 )
    love.graphics.rectangle('fill',VIRTUAL_WIDTH / 2 ,VIRTUAL_HEIGHT / 2 ,5 ,5)

    push:apply('end')
    --love.graphics.setColor(color2,color2,color2) 
end