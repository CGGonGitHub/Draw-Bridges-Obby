local START = workspace.START
local END = workspace.END
local TESTPART = workspace.TESTPART


local distance = (START.Position - END.Position).Magnitude
-- (Vector3.new(0, 0, 0) - Vector3.new(0, 0, 20)).Magnitude

local midpoint = (START.Position + END.Position) / 2
-- (Vector3.new(0, 0, 0) + Vector3.new(0, 0, 20)) / 2

local size = Vector3.new(1, 3, distance)

local cframe = CFrame.lookAt(midpoint, END.Position)


print(distance)
print(midpoint)
task.wait(5)
TESTPART.Position = midpoint
task.wait(5)
TESTPART.Size = size
task.wait(5)
TESTPART.CFrame = cframe
