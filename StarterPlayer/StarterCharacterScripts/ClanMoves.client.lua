
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local RS = game:GetService("ReplicatedStorage")
local UserInput = game:GetService("UserInputService")

local Handler = require(RS:WaitForChild("CombatHandler"))

UserInput.InputBegan:Connect(function(Input, chat)
	if chat then return else
		if Input.UserInputType == Enum.UserInputType.Keyboard then
			
			for k, v in pairs(Handler.ClansMoves) do
				
				print(k)
				
				for k, v in pairs(v) do
					
					if Input.KeyCode == v.key then
						
						v.event:FireServer()
						
					end
					
				end
				
			end			
			
		end
	end
end)