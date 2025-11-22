-- import
local RGOP = require(game.ReplicatedStorage.RGOP) -- or whatever it is

-- Initialise buffer - creates the screen as well
local fb = RGOP.RGOP_init(96, 72, 0, 0, false, 1)

print("Screen width: " .. tostring(RGOP.getx(fb)))
print("Screen height: " .. tostring(RGOP.gety(fb)))

-- draw a pixel
PlotPixel(fb, 1, 1, Color3.fromRGB(0, 0, 255)) -- fill pixel at 1,1 with blue
