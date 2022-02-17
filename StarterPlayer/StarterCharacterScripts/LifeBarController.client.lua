
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild'Humanoid'

hum.HealthChanged:Connect(function()

	local healthChange = hum.Health/hum.MaxHealth	

	local Bar = script.Parent
	Bar:TweenSize(UDim2.new(healthChange, 1,0,0), Enum.EasingDirection.In, Enum.EasingStyle.Linear ,.2)
	
	if hum.Health <= 0 then
		Bar.Size = UDim2.new(0,0,0,0)
	end

end)
