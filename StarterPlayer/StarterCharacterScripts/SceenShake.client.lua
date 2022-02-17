
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("ScreenShake")

local player = game:GetService("Players").LocalPlayer

Event.OnClientEvent:Connect(function(Action)
	local Hum = player.Character:WaitForChild("Humanoid")
	if Action == "Last" then
		for i = 1, 12 do
			local x = math.random(-20,20)/100
			local y = math.random(-20,20)/100
			local z = math.random(-20,20)/100

			Hum.CameraOffset = Vector3.new(x,y,z)
			wait()
		end
		Hum.CameraOffset = Vector3.new(0,0,0)
	else
		for i = 1, 5 do
			local x = math.random(-15,15)/100
			local y = math.random(-15,15)/100
			local z = math.random(-15,15)/100

			Hum.CameraOffset = Vector3.new(x,y,z)
			wait()
		end

		Hum.CameraOffset = Vector3.new(0,0,0)
	end	
end)