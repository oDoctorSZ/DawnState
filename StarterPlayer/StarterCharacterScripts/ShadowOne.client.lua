
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("RemoteShadow")

local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local UserInput = game:GetService("UserInputService")
local Mouse = player:GetMouse()


UserInput.InputBegan:Connect(function(Input, chat)
	if chat then return else
		
		if Input.UserInputType == Enum.UserInputType.Keyboard then
			if Input.KeyCode == Enum.KeyCode.F then
				
				Event:FireServer(Mouse.Hit)
				
			end
		end
		
	end
end)