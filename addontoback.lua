local RunService = game:GetService("RunService")

-- Global frame counter
i = 1
local d = 0.054925309
local elapsed = 0

local clickDetector = workspace:WaitForChild("MyClickablePart"):WaitForChild("ClickDetector")

local function resetAndStart(player)
    print(player.Name .. " clicked the part! Resetting Bad Apple...")

    -- Reset frame counter
    i = 1
    elapsed = 0

    -- Pause so you can start your recorder

    -- Resume playback loop
    RunService.Heartbeat:Connect(function(dt)
        elapsed += dt
        if elapsed >= d then
            elapsed -= d
            if frames[i] then
                frames[i](fb)
                i += 1
            else
                print("Done!")
            end
        end
    end)
end

-- Connect the click event
clickDetector.MouseClick:Connect(resetAndStart)
