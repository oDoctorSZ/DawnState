local atk = {}

atk.ClansMoves = {
	Kure = {
		move1 = { key = Enum.KeyCode.B, event = game:GetService("ReplicatedStorage"):WaitForChild("MoveEvent") },
		move2 = { key = Enum.KeyCode.K, event = game:GetService("ReplicatedStorage"):WaitForChild("BiteEvent") },
		move3 = { key = Enum.KeyCode.M, event = game:GetService("ReplicatedStorage"):WaitForChild("HookEvent") },
		move4 = { key = Enum.KeyCode.P, event = game:GetService("ReplicatedStorage"):WaitForChild("SpinCharge") },
		move5 = { key = Enum.KeyCode.Z, event = game:GetService("ReplicatedStorage"):WaitForChild("BlastCoreEvent") },
		move6 = { key = Enum.KeyCode.X, event = game:GetService("ReplicatedStorage"):WaitForChild("StompBarrageEvent") },
		move7 = { key = Enum.KeyCode.C, event = game:GetService("ReplicatedStorage"):WaitForChild("JabRushEvent") },
		form = { key = Enum.KeyCode.N, event = game:GetService("ReplicatedStorage"):WaitForChild("RemovalEvent") },
		form2 = { key = Enum.KeyCode.V, event = game:GetService("ReplicatedStorage"):WaitForChild("DeviationEvent") }
	}
}

return atk
