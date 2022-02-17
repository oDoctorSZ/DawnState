
local RS = game:GetService("ReplicatedStorage")
local Event = RS:WaitForChild("RemovalEvent")

local function Removal(player)

	local char = player.Character or player.CharacterAdded:Wait()
	local RootPart = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	
	local TweenService = game:GetService("TweenService")
	
	local folder = Instance.new("Folder", char)
	folder.Name = "Temp"
	
	hum:LoadAnimation(script.Animation):Play()
	
	local GroundEffect = RS:WaitForChild("Ground Effect 2"):Clone()
	GroundEffect.CFrame = (RootPart.CFrame + Vector3.new(0,-2,0)) * CFrame.Angles(math.rad(90), 0, 0)
	GroundEffect.Parent = folder
	
	local weld = Instance.new("WeldConstraint", folder)
	weld.Part0 = RootPart
	weld.Part1 = GroundEffect
	
	GroundEffect.Attachment.ParticleEmitter:Emit(100)
	wait(.1)
	GroundEffect.Attachment.ParticleEmitter:Emit(100)
	
	local RemovalAwa = RS:WaitForChild("Removal Awakening"):Clone()
	RemovalAwa.CFrame = RootPart.CFrame
	RemovalAwa.Parent = folder

	local weld2 = Instance.new("WeldConstraint", folder)
	weld2.Part0 = RootPart
	weld2.Part1 = RemovalAwa

	for _, v in pairs(RemovalAwa:GetDescendants()) do

		if v:IsA("ParticleEmitter") then			
			v:Emit(100)
			wait(.2)
			v:Emit(100)
		end

	end
	
	local BodyModel = RS:WaitForChild("BodyModel"):Clone()
	BodyModel:PivotTo(RootPart.CFrame)
	BodyModel.Parent = folder	
				
	wait(.6) 	
	
	for _, v in pairs(char:GetDescendants()) do

		if v.Name == "face" then
			v.Transparency = 1	
		end

	end
	
	for _, v in pairs(char:GetChildren()) do
		
		if v:IsA("Part") then
			
			local Effect = RS:WaitForChild("RemovalParticle"):Clone()
			Effect.Parent = v
			
		end

		if v.Name == "Head" then

			local FaceModel = RS:WaitForChild("FaceModel"):Clone()
			FaceModel:PivotTo(v.CFrame)
			FaceModel.Parent = v

			local weld = Instance.new("WeldConstraint", v)
			weld.Part0 = FaceModel.PrimaryPart
			weld.Part1 = v

		end
		
	end
	
	for i = 1, 5 do

		local array = { 1,2,3,4,5 }		
		local sorted = array[math.random(#array)]	

		if sorted == 1 then

			local P1 = RS:WaitForChild("P1"):Clone()
			P1.CFrame = char:WaitForChild("Torso").CFrame * CFrame.Angles(0, 0, math.rad(90))
			P1.Parent = folder

			P1.Transparency = 0.5		
			TweenService:Create(BodyModel.P1, TweenInfo.new(1), { Transparency = 1 }):Play()

			local weld = Instance.new("WeldConstraint", folder)
			weld.Part0 = char:WaitForChild("Torso")
			weld.Part1 = P1			

			table.remove(array, sorted)

		elseif sorted == 2 then

			local P2 = RS:WaitForChild("P2"):Clone()
			P2.CFrame = char:WaitForChild("Left Leg").CFrame * CFrame.Angles(0, 0, math.rad(90))
			P2.Parent = folder

			P2.Transparency = 0.5		
			TweenService:Create(P2, TweenInfo.new(1), { Transparency = 1 }):Play()

			local weld = Instance.new("WeldConstraint", folder)
			weld.Part0 = char:WaitForChild("Left Leg")
			weld.Part1 = P2

			table.remove(array, sorted)

		elseif sorted == 3 then

			local P3 = RS:WaitForChild("P3"):Clone()
			P3.CFrame = char:WaitForChild("Left Arm").CFrame * CFrame.Angles(0, 0, math.rad(90))
			P3.Parent = folder

			P3.Transparency = 0.5		
			TweenService:Create(P3, TweenInfo.new(1), { Transparency = 1 }):Play()

			local weld = Instance.new("WeldConstraint", folder)
			weld.Part0 = char:WaitForChild("Left Arm")
			weld.Part1 = P3

			table.remove(array, sorted)

		elseif sorted == 4 then

			local P4 = RS:WaitForChild("P4"):Clone()
			P4.CFrame = char:WaitForChild("Right Arm").CFrame * CFrame.Angles(0, 0, math.rad(90))
			P4.Parent = folder

			P4.Transparency = 0.5		
			TweenService:Create(P4, TweenInfo.new(1), { Transparency = 1 }):Play()

			local weld = Instance.new("WeldConstraint", folder)
			weld.Part0 = char:WaitForChild("Right Arm")
			weld.Part1 = P4

			table.remove(array, sorted)

		elseif sorted == 5 then

			local P5 = RS:WaitForChild("P5"):Clone()
			P5.CFrame = char:WaitForChild("Right Leg").CFrame * CFrame.Angles(0, 0, math.rad(90))
			P5.Parent = folder

			P5.Transparency = 0.5		
			TweenService:Create(P5, TweenInfo.new(1), { Transparency = 1 }):Play()

			local weld = Instance.new("WeldConstraint", folder)
			weld.Part0 = char:WaitForChild("Right Leg")
			weld.Part1 = P5

			table.remove(array, sorted)

		end		

		wait(1)	
	end

	game:GetService("Debris"):AddItem(folder, .8)

end


Event.OnServerEvent:Connect(Removal)