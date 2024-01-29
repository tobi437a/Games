local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Tobi's BGH Script. discord.gg/vd2Sxr4scr", "DarkTheme")

_G.autoblow = false
_G.autoegg = false
_G.autochest = false
_G.autosell = false

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Farm")
MainSection:NewToggle("Auto Blow", "ToggleInfo", function(state)
    if state then
		_G.autoblow = true
		while _G.autoblow == true do
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Core"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer("BlowBubble")
			wait()
		end
	else
        _G.autoblow = false
    end
end)

MainSection:NewToggle("Auto Chaos Egg", "ToggleInfo", function(state)
    if state then
        _G.autoegg = true
		while _G.autoegg == true do
			local args = {
				[1] = "HatchEgg",
				[2] = "Chaos Egg",
				[3] = 3
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Core"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
			wait()
		end
    else
        _G.autoegg = false
    end
end)

MainSection:NewToggle("Auto sell", "ToggleInfo", function(state)
    if state then
        _G.autosell = true
		while _G.autosell == true do
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Core"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("SellBubble")
			wait()
		end
    else
        _G.autosell = false
    end
end)

MainSection:NewToggle("Auto Chest", "ToggleInfo", function(state)
    if state then
        _G.autochest = true
		while _G.autochest == true do
			local args = {
				[1] = "CollectChest",
				[2] = "Star Temple"
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Core"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
			wait()
			local args = {
				[1] = "CollectChest",
				[2] = "Void"
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Core"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
			wait()
		end
    else
        _G.autochest = false
    end
end)