--!version 0.12c
local version = "1.2c beta"
local camera = workspace.CurrentCamera
function changeFov(fov)
    camera.FieldOfView = fov
end
local focus = nil
local VelocityBuff = false
spawn(function ()
    while task.wait() do
        local players = game.Players:GetPlayers()
        for i,v in pairs(players) do
            if v ~= game.Players.LocalPlayer and focus ~= nil then
                pcall(function ()
                    v.Character:SetPrimaryPartCFrame(focus)
                end)
            elseif v == game.Players.LocalPlayer then
                if VelocityBuff then
                    pcall(function()
                        v.Character.HumanoidRootPart.movementVelocity.P = 450;
                    end)
                elseif not VelocityBuff then
                    pcall(function()
                        v.Character.HumanoidRootPart.movementVelocity.P = 150;
                    end)
                end
            end
        end
    end
end)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = string.format("RAGE CLIENT | #FUCKSTANDBLOX %s", version),
    LoadingTitle = "#FUCKSTANDBLOX",
    LoadingSubtitle = "i hate standblox ;)",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 local Rage = Window:CreateTab("RAGE", 4483362458) -- Title, Image
 local Visual = Window:CreateTab("Visual", 4483362458) -- Title, Image
 local FOVS = Visual:CreateSlider({
    Name = "FOV",
    Range = {1, 120},
    Increment = 1,
    Suffix = "",
    CurrentValue = camera.FieldOfView,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    changeFov(Value)
    end,
 })
 local Section = Rage:CreateSection("RAGE MAIN")
 local RS = Rage:CreateButton({
    Name = "RAGE START",
    Callback = function()
        focus = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end,
 })
 local RR = Rage:CreateButton({
    Name = "RAGE RESET",
    Callback = function()
        focus = nil
    end,
 })
 local Section2 = Rage:CreateSection("VELOCITY BUFF")
 local VB = Rage:CreateToggle({
    Name = "Velocity Buff",
    CurrentValue = false,
    Flag = "VBuff", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        VelocityBuff = Value
    end,
 })
 function ggg()
    for i,v in pairs(workspace:GetDescendants()) do
        pcall(function()
            v.Material = Enum.Material.SmoothPlastic
        end)
        pcall(function()
            v.Texture = ""
        end)
        pcall(function()
            v.Image = ""
        end)
        pcall(function()
            v.TextureID = ""
        end)
        pcall(function()
            v.TextureId = ""
        end)
    end
 end
 local Potato = Visual:CreateButton({
    Name = "POTATO MODE",
    Callback = function()
        ggg()
    end,
})
