-- @ScriptType: Script
--- Tool give

local interaction = script.Parent.ProximityPrompt -- the actual interaction

interaction.Triggered:Connect(function(plr) -- when the interaction is clicked
	if plr.Backpack:FindFirstChild("Trust Blade") then
		return -- no duplicates
	end
	local tool = game.ServerStorage["Trust Blade"]:Clone() -- you can set this to any tool you would like.. Clone() makes a copy of the tool.. Put this Tool to Server Storage your tool.. and put name your tool
	tool.Parent = plr.Backpack
	script.grab.Playing=true
	-- puts this copy inside the players BackPack
end)