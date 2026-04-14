-- @ScriptType: Script
--// BatArchiTechMan

local DB = script.Parent.Parent.DB

local Players = game.Players

script.Parent.Touched:Connect(function(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		if Hit.Parent.Parent.Name ~= "SCPs" then
			if Players:GetPlayerFromCharacter(Hit.Parent) then
				if Hit.Parent.Humanoid.Health == 0 then
					if not Hit.Parent.Head:FindFirstChild("Killer") then
						local KilledBy = Instance.new("StringValue")
						KilledBy.Name = "Killer"
						KilledBy.Value = "[" .. script.Parent.Parent.Name .."]"
						KilledBy.Parent = Hit.Parent.Head
					end
					if not workspace:FindFirstChild("SCP-049-2") then
						local InstanceSCP = game.ServerStorage:WaitForChild("SCP-049-2"):Clone()
						InstanceSCP.Parent = workspace
						InstanceSCP:WaitForChild("UpperTorso").CFrame = script.Parent.CFrame
					end
				end
				if not Players:GetPlayerFromCharacter(Hit.Parent).Backpack:FindFirstChild("SCP-714") and not Hit.Parent:FindFirstChild("SCP-714") then
		 			if DB.Value then
						DB.Value = false
						Hit.Parent.Humanoid.Sit = true
						Hit.Parent.Humanoid:TakeDamage(55)
						script.Parent.Parent.Head.Kill:Play()
						wait(0.6)
						DB.Value = true
					end
				end
			end
		end
	end
end)