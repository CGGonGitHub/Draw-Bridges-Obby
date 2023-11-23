local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
task.wait(3)

local velocity = workspace.CAMERAPART.LinearVelocity.VectorVelocity
local speed = 20
-- variables
local camera = workspace.CurrentCamera
local cameramode = false

local velocityChangeAmount = {
	["W"] = Vector3.new(0, 0, speed),
	["A"] = Vector3.new(speed, 0, 0),
	["S"] = Vector3.new(0, 0, -speed),
	["D"] = Vector3.new(-speed, 0, 0)
}


UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode then -- keyboard
		
		
		-- camera mode add velocity
		if cameramode and velocityChangeAmount[UIS:GetStringForKeyCode(input.KeyCode)] then
			workspace.CAMERAPART.LinearVelocity.VectorVelocity += velocityChangeAmount[UIS:GetStringForKeyCode(input.KeyCode)]
		end
	end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode then -- keyboard
		if input.KeyCode == Enum.KeyCode.F then -- toggle camera mode
			cameramode = not cameramode
			print("Camera Mode Changed: ", cameramode)
		end
		
		-- camera mode substract velocity
		if cameramode and velocityChangeAmount[UIS:GetStringForKeyCode(input.KeyCode)] then
			workspace.CAMERAPART.LinearVelocity.VectorVelocity -= velocityChangeAmount[UIS:GetStringForKeyCode(input.KeyCode)]
		end
	end
end)


RunService.RenderStepped:Connect(function()
	if cameramode then
		workspace.CurrentCamera.CFrame = workspace.CAMERAPART.CFrame
	end
end)
