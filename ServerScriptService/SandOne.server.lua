
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("RemoteEvent")

local Debris = game:GetService("Debris")

local function SandAtk(player)
	
	local char = player.Character or player.CharacterAdded:Wait()
	local RootPart = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	
	local Folder = Instance.new("Folder", char)
	Folder.Name = "Atks"
	
	local WaveModel = RS:WaitForChild("SandWaveModel"):Clone()
	WaveModel.Parent = Folder
	
	WaveModel:PivotTo(RootPart.CFrame + (RootPart.CFrame.LookVector))
	
	for _, part in pairs(WaveModel:GetChildren()) do
		
		local vel = Instance.new("BodyVelocity", part)
		vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		vel.Velocity = 80 * RootPart.CFrame.LookVector
		
		Debris:AddItem(vel, 3)
		
	end
	
	Debris:AddItem(WaveModel, 3)
	
end

Event.OnServerEvent:Connect(SandAtk)