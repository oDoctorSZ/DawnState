
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("Kick")

local TweenService = game:GetService("TweenService")

Event.OnServerEvent:Connect(function(player)
	
	local char = player.Character or player.CharacterAdded:Wait()
	local Root = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	
	local Effect = RS:WaitForChild("EffectTest"):Clone()
	
	local Animator = hum:WaitForChild("Animator")
	
	local weld = Instance.new("WeldConstraint", char)
	
	local folder = Instance.new("Folder", char)
	
	local model = RS:WaitForChild("ModelSlash"):Clone()
	
	Animator:LoadAnimation(script.Animation):Play()
	
	model.Parent = folder
	weld.Parent = folder
	
	weld.Part0 = Root
	weld.Part1 = model.PrimaryPart
	
	weld.Enabled = false
	
	model:PivotTo(Root.CFrame + (Root.CFrame.LookVector * Vector3.new(1.4,0,1.4)))
	
	
	local Info = TweenInfo.new(.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	
	for _, mesh in pairs(model:GetChildren()) do
		
		TweenService:Create(mesh, Info, {Size = Vector3.new(18, .041, 10) ,Transparency = 0}):Play()
		
		
	end	
	
	
end)