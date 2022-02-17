
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("BlastCoreEvent")

local TweenService = game:GetService("TweenService")

local function Core(player)

	local char = player.Character or player.CharacterAdded:Wait()
	local RootPart = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")

	local RightArm = char:WaitForChild("Right Arm")

	local folder = Instance.new("Folder", char)
	folder.Name = "Temp"

	hum:LoadAnimation(script.Animation):Play()

	local HandEffect = RS:WaitForChild("Blastcore Hand"):Clone()
	HandEffect.CFrame = (RightArm.CFrame + Vector3.new(0, -1, 0))
	HandEffect.Parent = folder

	local weld = Instance.new("WeldConstraint", folder)
	weld.Part0 = RightArm
	weld.Part1 = HandEffect

	task.wait(.25)
	
	local WaveOne = RS:WaitForChild("WaveOne"):Clone()
	WaveOne.CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(1.5, 0, 1.5)) * CFrame.Angles(math.rad(90), 0, 0)
	WaveOne.Parent = folder
	
	local BlowEffect = RS:WaitForChild("Blastcore Blow"):Clone()
	BlowEffect.CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(1.2, 0, 1.2))
	BlowEffect.Parent = folder

	BlowEffect.Attachment.ParticleEmitter:Emit(100)	
	ChangeTransparencyRK(BlowEffect.Attachment.ParticleEmitter, 2, 0, .15)
	
	local waves = { WaveOne, BlowEffect }

	for i = 1, #waves do

		local weld5 = Instance.new("WeldConstraint", folder)
		weld5.Part0 = RootPart
		weld5.Part1 = waves[i]

	end
	
	wait(.15)

	local BlastCore = RS:WaitForChild("BlastCore"):Clone()
	BlastCore.CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(4, 0, 4))
	BlastCore.Parent = folder

	--local weld2 = Instance.new("WeldConstraint", folder)
	--weld2.Part0 = RootPart
	--weld2.Part1 = BlastCore
	
	local Mesh = RS:WaitForChild("MeshForBullet"):Clone()
	Mesh.CFrame = BlastCore.CFrame * CFrame.Angles(math.rad(90), 0, 0)
	Mesh.Parent = folder
	
	--local weld4 = Instance.new("WeldConstraint", folder)
	--weld4.Part0 = BlastCore
	--weld4.Part1 = Mesh
	
	local WaveMiniOne = RS:WaitForChild("WaveMiniOne"):Clone()
	WaveMiniOne.CFrame = (RootPart.CFrame + RootPart.CFrame.LookVector * Vector3.new(6, 0, 6)) * CFrame.Angles(math.rad(90), 0, 0)
	WaveMiniOne.Parent = folder
	
	local AddVelocity = { BlastCore, Mesh }
	
	for i = 1, #AddVelocity do
		
		local vel = Instance.new("BodyVelocity", AddVelocity[i])
		vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		vel.Velocity = 35 * RootPart.CFrame.LookVector

		game:GetService("Debris"):AddItem(vel, 1.5)

	end
	
	local weld4 = Instance.new("WeldConstraint", folder)
	weld4.Part0 = RootPart
	weld4.Part1 = WaveMiniOne
	
	local TweenModelsList = { Mesh, BlastCore, WaveMiniOne, WaveOne }
	
	for i = 1, #TweenModelsList do
		
		TweenService:Create(TweenModelsList[i], TweenInfo.new(1), { Transparency = 1 }):Play()
		
	end
	
	game:GetService("Debris"):AddItem(folder, 1.2)

end

function ChangeTransparencyRK(emitter, START, END, TIMER)

	local RunService = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")

	local connection

	local kpValue = Instance.new("NumberValue")
	kpValue.Value = START
	kpValue.Parent = emitter

	local Tween = TweenService:Create(kpValue, TweenInfo.new(TIMER), { Value = END })

	local function HeartBeat(step)

		emitter.Lifetime = NumberRange.new(kpValue.Value)

		Tween.Completed:Connect(function()
			kpValue:Destroy()
			connection:Disconnect()

		end)

	end

	connection = RunService.Heartbeat:Connect(HeartBeat)

	Tween:Play()

end

Event.OnServerEvent:Connect(Core)