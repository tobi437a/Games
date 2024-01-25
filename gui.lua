local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Tobi's Click a Rock Script. discord.gg/vd2Sxr4scr", "DarkTheme")

_G.autotap = false
_G.autogem = false
_G.autolevel = false

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Farm")
MainSection:NewToggle("Auto rock click", "ToggleInfo", function(state)
    if state then
		_G.autotap = true
		while _G.autotap == true do
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RockClick"):FireServer()
			wait()
		end
	else
        _G.autotap = false
    end
end)

MainSection:NewToggle("Auto gem", "ToggleInfo", function(state)
    if state then
        _G.autogem = true
		while _G.autogem == true do
			local args = {
				[1] = false
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GemEarned"):FireServer(unpack(args))
			wait()
		end
    else
        _G.autogem = false
    end
end)

MainSection:NewToggle("Auto level up", "ToggleInfo", function(state)
    if state then
        _G.autolevel = true
		while _G.autolevel == true do
			local args = {
				[1] = "MainLevel"
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("StatModule"):WaitForChild("RemoteEventU"):FireServer(unpack(args))
			wait()
		end
    else
        _G.autolevel = false
    end
end)