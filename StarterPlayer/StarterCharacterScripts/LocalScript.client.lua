
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("Kick")

local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local UserInput = game:GetService("UserInputService")

UserInput.InputBegan:Connect(function(Input, chat)
	if chat then return else
		
		if Input.UserInputType == Enum.UserInputType.Keyboard then
			
			if Input.KeyCode == Enum.KeyCode.R then
				
				Event:FireServer()
				
			end
			
		end
		
	end
	
end)

