
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("HookEvent")

local TweenService = game:GetService("TweenService")

local function Hook(player)

	local char = player.Character or player.CharacterAdded:Wait()
	local RootPart = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	
	local RightArm = char:WaitForChild("Right Arm")
	
	local folder = Instance.new("Folder", char)
	folder.Name = "Temp"

	hum:LoadAnimation(script.Animation):Play()
	
	local Hook = RS:WaitForChild("HookEffect"):Clone()
	Hook.CFrame = RightArm.CFrame
	Hook.Parent = folder
	
	local weld = Instance.new("WeldConstraint", folder)
	weld.Part0 = RightArm
	weld.Part1 = Hook
	
	local HandEffect = RS:WaitForChild("HookHandEffect"):Clone()
	HandEffect.CFrame = (RightArm.CFrame + Vector3.new(0, -1, 0))
	HandEffect.Parent = folder
	
	local weld3 = Instance.new("WeldConstraint", folder)
	weld3.Part0 = RightArm
	weld3.Part1 = HandEffect
	
	wait(.25)
	
	local HookBlast = RS:WaitForChild("HookBlast"):Clone()
	HookBlast.CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(2.4, 0 ,2.4)) * CFrame.Angles(math.rad(-45.17), math.rad(45), math.rad(-56.77))
	HookBlast.Parent = folder
	
	TweenService:Create(HookBlast, TweenInfo.new(1), { CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(2.4, 3, 2.4)) * CFrame.Angles(math.rad(-45.17), math.rad(45), math.rad(-56.77)), Transparency = 1 }):Play()	
	
	local weld2 = Instance.new("WeldConstraint", folder)
	weld2.Part0 = RootPart
	weld2.Part1 = HookBlast
	
	game:GetService("Debris"):AddItem(folder, 1.2)

end


Event.OnServerEvent:Connect(Hook)