-- @ScriptType: Script
-- AutoWeld.server.lua
-- Automatically welds a model using qPerfectionWeld module
-- Place this script inside the model you want to weld
-- Parts should be anchored before the script runs

local RunService = game:GetService("RunService")

-- Do not disable
-- This ensures motors and hinges work properly
local DOUBLE_WELD = true

-- Only run if not in Studio
-- Studio has auto joint creation on PlayTest
if RunService:IsStudio() then
	return
end

-- Get the qPerfectionWeld module
-- Adjust this path to where your module is located
local PerfectionWeld = require(script:WaitForChild("qPerfectionWeldModule"))

-- Get the model this script is parented to
local model = script.Parent

-- Ensure we have a valid model
if not model then
	warn("AutoWeld: Script has no parent!")
	return
end

-- Regular model weld
if DOUBLE_WELD then
	local weld1, weld2, part1, part2 = PerfectionWeld.doubleWeldTogether(model, {
		neverBreakJoints = false,
		jointType = "Weld",
		doNotUnanchor = false
	})
	
	PerfectionWeld.weldParts({weld1, weld2, part1, part2}, part1, weld1)
else
	PerfectionWeld.weldModel(model, {
		neverBreakJoints = false,
		jointType = "Weld",
		doNotUnanchor = false
	})
end