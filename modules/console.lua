local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local Output = {}
Output.__index = Output

function Output:ChangeColor()
	return RunService.Heartbeat:Connect(function()
		local d = CoreGui:FindFirstChild("DevConsoleMaster")
		if not d then
			return
		end

		for _,v in d:GetDescendants() do
			if v:IsA("TextLabel") then
				v.RichText = true
			end
		end
	end)
end

function Output:print(color, text, size)
	local s = '<font color="rgb(' .. color .. ')"'

	if size then
		s = s .. ' size="' .. tostring(size) .. '"'
	end

	s = s .. ">" .. tostring(text) .. "</font>"

	print(s)
end

Output:ChangeColor()

return Output
