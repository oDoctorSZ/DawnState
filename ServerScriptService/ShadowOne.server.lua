
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("RemoteShadow")

local Debris = game:GetService("Debris")

local function SandAtk(player, target)
	
	local char = player.Character or player.CharacterAdded:Wait()
	local RootPart = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	
	local Folder = Instance.new("Folder", char)
	Folder.Name = "Atks"
	
	local BeamModel = RS:WaitForChild("BeamModel"):Clone()
	BeamModel.Parent = Folder
	
	BeamModel:PivotTo(RootPart.CFrame + (RootPart.CFrame.LookVector))
	
	local Atk = BeamModel:WaitForChild("Atk")
		
	local vel = Instance.new("BodyVelocity", Atk)
	vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	vel.Velocity = 110 * (target.LookVector * Vector3.new(1,1,1))
		
	Debris:AddItem(vel, 3)	
	Debris:AddItem(BeamModel, 3)	
	
end

Event.OnServerEvent:Connect(SandAtk)