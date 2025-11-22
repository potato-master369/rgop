-- RGOP: Roblox Graphics Output Protocol

-- This script is Free and Open Source software, licensed under Apache V2.
-- You are free to use, and contribute to this script in future.

-- Initialise screen

local RGOP = {}

-- basic: RGOP.RGOP_init(96, 72, 0, 0, false, 1)
function RGOP.RGOP_init(maxx, maxy, relx, rely, isz, pxsize)
   local fb = {}
   local row = {}
   -- Create screen
   for x = 1, maxx do
      row = {}
      for y = 1, maxy do
         local p = Instance.new("Part")
         p.Anchored = true
         p.Size = Vector3.new(pxsize, pxsize, pxsize)
         if isz then
            p.Position = Vector3.new(0, rely + (y * pxsize), relx + (x * pxsize))
         else
            p.Position = Vector3.new(relx + (x * pxsize), rely + (y * pxsize), 0)
         end
         p.Color = Color3.fromRGB(0, 0, 0)
         p.Parent = workspace
         row[#row + 1] = p
         p.CastShadow = false
         p.Material = Enum.Material.SmoothPlastic
      end
      table.insert(fb, 1, row) -- flip so the video is NOT upside-down!
   end

   return fb
end

function RGOP.PlotPixel(fb, x, y, col)
   -- require col to be of type Color3!
   fb[x][y].Color = col
end

function RGOP.getx(fb)
   return #fb
end

function RGOP.gety(fb)
   return #fb[1]
end

-- END OF FUNCTION
return RGOP
