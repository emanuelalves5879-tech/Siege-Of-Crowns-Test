-- @ScriptType: Script
script.Parent.Changed:Connect(function()
	if script.Parent.Sit then
		script.Parent.Jump = true
		script.Parent.Sit = false
	end
end)