if game.PlaceId == 583507031 then
    local SpreadApplied = 2
    local ShotgunShotsApplied = 1
    local MaxRangeApplied = 1500

    local TweenOption = "Tween"
    local TweenSpeed = 1

    local SelectedPlayer = game.Players.LocalPlayer.Name
    local SelectedPlayer2 = "hp_undetected"

    local SelectedTeam = "Admissions"

    getgenv().ToggledKillAll = false
    getgenv().ToggledKillTarget = false
    getgenv().ToggleTeamTarget = false

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    -- @ Library Creation
    local Window = Library.CreateLib("Papers Please [Chapter 2] 1.0", "BloodTheme")

    -- @ Tab Creation
    local MainTab = Window:NewTab("Main")
    local WeaponsTab = Window:NewTab("Weapons")
    local OnlineEventsTab = Window:NewTab("Online Events")
    local TeamsTab = Window:NewTab("Teams")
    local TeleportsTab = Window:NewTab("Teleports")

    --  @ Section Creation || MAIN_TAB
    local MainTabSection_Player = MainTab:NewSection("Character Properties")
    MainTabSection_Player:NewLabel("Undetected by AntiCheat")

    MainTabSection_Player:NewSlider("WalkSpeed", "Redefine your WalkSpeed", 32, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    MainTabSection_Player:NewButton("Remove Nametag", "ServerSide", function()
        game:GetService("Players").LocalPlayer.Character.Head.nameTag:Destroy()
    end)

    MainTabSection_Player:NewLabel("Tool Giver [CLIENT]")

    MainTabSection_Player:NewButton("F3X", "Get F3X tools!", function()
        loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)

    MainTabSection_Player:NewLabel("Script Hubs")
    
    MainTabSection_Player:NewButton("Infinite Yield", "Load Infinite Yield!", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    MainTabSection_Player:NewButton("DEX Explorer", "Load DEX Explorer", function()
        loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z"))()
    end)
    -- @ Section Creation || WEAPONS_TAB
    local WeaponsTabSection_ModsUniversal = WeaponsTab:NewSection("Weapon Mods")

    function refreshPlayerlist()
        local Table = {}
        local Players = game.Players:GetChildren()
        
        for i, v in pairs(Players) do
            table.insert(Table,v.Name)
        end
        return Table
    end

    local firstResult = refreshPlayerlist()

    WeaponsTabSection_ModsUniversal:NewSlider("Spread", "Redefine the Weapon Spread", 100,0, function (s)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).Inacuracy = s
                SpreadApplied = s
            end
        end
    end)
    


    WeaponsTabSection_ModsUniversal:NewSlider("Shots", "Redefine the Shots per Second", 1000,1, function (s)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = s
                ShotgunShotsApplied = s
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewSlider("Bullet Range", "Redefine the Weapon Maximum Shooting Range.", 5000,1, function (s)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).Range = s
                MaxRangeApplied = s
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewDropdown("FireMode", "Select a FireMode", {"Semi", "Auto"}, function(currentOption)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).FireMode = currentOption
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewLabel("Modification Presets")
    WeaponsTabSection_ModsUniversal:NewButton("Shotgun Preset", "Good Settings", function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = 200
                require(v.Settings).Inacuracy = 12
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewButton("OneShot Preset", "Good Settings", function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = 200
                require(v.Settings).Inacuracy = 0
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewButton("No Spread Preset", "Good Settings", function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = 1
                require(v.Settings).Inacuracy = 0
            end
        end
    end)

    
    WeaponsTabSection_ModsUniversal:NewButton("Lag Preset", "Good Settings", function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = 1500
                require(v.Settings).Inacuracy = 50
            end
        end
    end)

    WeaponsTabSection_ModsUniversal:NewLabel("Modification Fixes")
    WeaponsTabSection_ModsUniversal:NewButton("Apply Mods", "reApply if you have died with your Mods.", function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        wait()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Settings") then
                require(v.Settings).ShotgunShots = ShotgunShotsApplied
                require(v.Settings).Inacuracy = SpreadApplied
            end
        end
    end)


    -- @ Section Creation | ONLINE_EVENTS
    local OnlineTabPlayers = OnlineEventsTab:NewSection("Online Events")


    OnlineTabPlayers:NewToggle("Kill Everybody", "Teleports everbody infront of you!", function(state)
        if state then
            getgenv().ToggledKillAll = true
        else
            getgenv().ToggledKillAll = false
        end
    end)

    OnlineTabPlayers:NewLabel("Kill Target")

    local SelectPlayerDropdown2 = OnlineTabPlayers:NewDropdown("Target Player", "Select a Player to Loop Kill", firstResult, function(currentOption)
        SelectedPlayer2 = currentOption
    end)

    OnlineTabPlayers:NewToggle("Kill Target", "Teleports Target infront of you!", function(state)
        if state then
            getgenv().ToggledKillTarget = true
        else
            getgenv().ToggledKillTarget = false
        end
    end)
    
    OnlineTabPlayers:NewLabel("Kill Team")
    local Teams = game.Teams:GetChildren()

    local TeamsSelectDropdown = OnlineTabPlayers:NewDropdown("Target Team", "Select a Team to Loop Kill", Teams.Name, function(currentOption)
        SelectedTeam = currentOption
    end)

    OnlineTabPlayers:NewToggle("Kill Team", "Teleports Team infront of you!", function(state)
        if state then
            getgenv().ToggleTeamTarget = true
        else
            getgenv().ToggleTeamTarget = false
        end
    end)
    
--    OnlineTabPlayers:NewButton("AutoRob Bank", "Rob the Bank without any Problems.", function()
        
 --   end)

    local QuickTeamsTab = TeamsTab:NewSection("Quick Change")
    -- @ Section Creation | TEAMS
    for i, v in pairs(game.Teams:GetChildren()) do
        QuickTeamsTab:NewButton(v.Name, "Change your Team to "..v.Name.." if you are Ranked correctly.", function()
            -- Script generated by SimpleSpy - credits to exx#9394
            local args = {
                [1] = {
                    [1] = v.Name
                }
            }

            game:GetService("ReplicatedStorage").Events:FindFirstChild("f974d3c0-5072-4383-8040-ccada1d3be02"):InvokeServer(unpack(args))
        end)
    end

    MainTabSection_Player:NewLabel("Others")

    MainTabSection_Player:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.F, function()
        Library:ToggleUI()
    end)

    local TeleportsTabSection = TeleportsTab:NewSection("Teleports")
    TeleportsTabSection:NewLabel("Teleport Options")

    TeleportsTabSection:NewDropdown("Methode", "Select a Teleport Methode", {"Tween (SAFE)", "Teleport (SAFE)"}, function(currentOption)
        if currentOption == "Tween (SAFE)" then
            TweenOption = "Tween"
        else
            TweenOption = "Teleport"
        end
    end)

    TeleportsTabSection:NewSlider("Teleport Speed", "Define", 100, 1, function(s)
        TweenSpeed = 5 / s
    end)
    
    TeleportsTabSection:NewLabel("Teleport to Player")

    local SelectPlayerDropdown = TeleportsTabSection:NewDropdown("Player", "Select a Player to Teleport", firstResult, function(currentOption)
        SelectedPlayer = currentOption
    end)

   game.Players.ChildAdded:Connect(function(child)
       local result = refreshPlayerlist()
       SelectPlayerDropdown:Refresh(result)
       SelectPlayerDropdown2:Refresh(result)
   end)

    game.Players.ChildRemoved:Connect(function(child)
        local result = refreshPlayerlist()
       SelectPlayerDropdown:Refresh(result)
       SelectPlayerDropdown2:Refresh(result)
   end)
    

    TeleportsTabSection:NewButton("Teleport", "Teleport to assigned Player instance.", function()
        if TweenOption == "Tween" then
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TweenSpeed),{CFrame = game.Players:FindFirstChild(SelectedPlayer).Character.HumanoidRootPart.CFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(SelectedPlayer).Character.HumanoidRootPart.CFrame
        end
    end)


    TeleportsTabSection:NewLabel("Spawn Locations")


    for i, v in pairs(game:GetService("ReplicatedStorage")["Resources_Client"].Spawns:GetChildren()) do
        TeleportsTabSection:NewButton(v.Name, "Teleports you !"..v.Name.." spawn!", function()
            local Position = v.CFrame
            if TweenOption == "Tween" then
                game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TweenSpeed),{CFrame = Position}):Play()
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
            end
        end)
    end

    while wait() do
        if getgenv().ToggledKillAll == true then
            for i, v in pairs(game.Players:GetChildren()) do
                if v.Team == game.Teams.Military or v.Team == game.Teams.Admissions then
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if  v.Character:FindFirstChild("ForceField") then
                        else
                            v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                        end
                    end
                end
            end
        end
        if getgenv().ToggledKillTarget == true then
            for i, v in pairs(game.Players:GetChildren()) do
                if v.Name == SelectedPlayer2 then
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if  v.Character:FindFirstChild("ForceField") then
                        else
                            v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                        end
                    end
                end
            end
        end
        if getgenv().ToggleTeamTarget == true then
            for i, v in pairs(game.Players:GetChildren()) do
                if v.Team == game.Teams:FindFirstChild(SelectedTeam) then
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if  v.Character:FindFirstChild("ForceField") then
                        else
                            v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                        end
                    end
                end
            end
        end
    end
end
