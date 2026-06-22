-- Name: ErYx on Top
-- Execution: Run inside your environment executor (e.g., Delta)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

-- Clean up any duplicate UI elements
if game:GetService("CoreGui"):FindFirstChild("ErYxOnTopUI") then
    game:GetService("CoreGui").ErYxOnTopUI:Destroy()
end

-- --- UI CONFIGURATION (Curved Modern Design) ---
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "ErYxOnTopUI"
gui.ResetOnSpawn = false

local BACK_COLOR = Color3.fromRGB(10, 10, 10)
local PURPLE_ACCENT = Color3.fromRGB(140, 50, 255)

-- Main Frame (Curved Focus)
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.fromOffset(460, 360) 
mainFrame.Position = UDim2.new(0.5, -230, 0.5, -180)
mainFrame.BackgroundColor3 = BACK_COLOR
mainFrame.BorderSizePixel = 0
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = PURPLE_ACCENT
mainStroke.Thickness = 2
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- --- EXTENDER PANEL SETUP ---
local extenderFrame = Instance.new("Frame", mainFrame)
extenderFrame.Size = UDim2.fromOffset(200, 360)
extenderFrame.Position = UDim2.fromOffset(460, 0) -- Hides right behind the main frame natively
extenderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
extenderFrame.BorderSizePixel = 0
extenderFrame.ZIndex = 0 -- Sits under the border frame layer
local extCorner = Instance.new("UICorner", extenderFrame)
extCorner.CornerRadius = UDim.new(0, 12)

local extStroke = Instance.new("UIStroke", extenderFrame)
extStroke.Color = PURPLE_ACCENT
extStroke.Thickness = 2

local extTitle = Instance.new("TextLabel", extenderFrame)
extTitle.Size = UDim2.new(1, 0, 0, 35)
extTitle.BackgroundTransparency = 1
extTitle.Text = "Multi-Target Slots"
extTitle.TextColor3 = Color3.new(1, 1, 1)
extTitle.Font = Enum.Font.SourceSansBold
extTitle.TextSize = 13

-- Create 5 Slots inside Extender Frame
local extenderBoxes = {}
for i = 1, 5 do
    local boxContainer = Instance.new("Frame", extenderFrame)
    boxContainer.Size = UDim2.new(1, -20, 0, 30)
    boxContainer.Position = UDim2.fromOffset(10, 35 + (i * 38))
    boxContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    boxContainer.BorderSizePixel = 0
    Instance.new("UICorner", boxContainer).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", boxContainer).Color = Color3.fromRGB(45, 45, 45)

    local tBox = Instance.new("TextBox", boxContainer)
    tBox.Size = UDim2.new(1, -35, 1, 0)
    tBox.Position = UDim2.fromOffset(5, 0)
    tBox.BackgroundTransparency = 1
    tBox.TextColor3 = Color3.new(1, 1, 1)
    tBox.PlaceholderText = "Slot " .. i .. ": Empty"
    tBox.Text = ""
    tBox.Font = Enum.Font.SourceSans
    tBox.TextSize = 12
    tBox.TextXAlignment = Enum.TextXAlignment.Left

    local clearBtn = Instance.new("TextButton", boxContainer)
    clearBtn.Size = UDim2.fromOffset(22, 22)
    clearBtn.Position = UDim2.new(1, -26, 0.5, -11)
    clearBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40) -- Red color
    clearBtn.Text = "X"
    clearBtn.TextColor3 = Color3.new(1, 1, 1)
    clearBtn.Font = Enum.Font.SourceSansBold
    clearBtn.TextSize = 11
    Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 4)

    clearBtn.MouseButton1Click:Connect(function()
        tBox.Text = ""
    end)

    extenderBoxes[i] = tBox
end

-- Top Header Window
local header = Instance.new("Frame", mainFrame)
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
header.BorderSizePixel = 0
local headerCorner = Instance.new("UICorner", header)
headerCorner.CornerRadius = UDim.new(0, 12)

local headerTitle = Instance.new("TextLabel", header)
headerTitle.Size = UDim2.new(1, -120, 1, 0)
headerTitle.Position = UDim2.fromOffset(12, 0)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = "ErYx on Top | " .. lp.Name
headerTitle.TextColor3 = Color3.new(1, 1, 1)
headerTitle.Font = Enum.Font.SourceSansBold
headerTitle.TextSize = 14
headerTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Hide Button
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.fromOffset(25, 25)
closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
closeBtn.Text = "—"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.SourceSansBold
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 6)
local closeStroke = Instance.new("UIStroke", closeBtn)
closeStroke.Color = PURPLE_ACCENT
closeStroke.Thickness = 1

-- Open Crown Display Trigger
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.fromOffset(50, 50)
openBtn.Position = UDim2.new(0, -65, 0.5, -25)
openBtn.BackgroundColor3 = BACK_COLOR
openBtn.Text = "👑"
openBtn.TextSize = 22
openBtn.Visible = false
local openCorner = Instance.new("UICorner", openBtn)
openCorner.CornerRadius = UDim.new(0, 12)
local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = PURPLE_ACCENT
openStroke.Thickness = 2

-- Left Layout Configuration
local leftContainer = Instance.new("Frame", mainFrame)
leftContainer.Size = UDim2.new(0.55, -12, 1, -50)
leftContainer.Position = UDim2.fromOffset(12, 42)
leftContainer.BackgroundTransparency = 1

local listFrame = Instance.new("ScrollingFrame", leftContainer)
listFrame.Size = UDim2.new(1, 0, 1, 0)
listFrame.BackgroundTransparency = 1
listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
listFrame.ScrollBarThickness = 2

local listLayout = Instance.new("UIListLayout", listFrame)
listLayout.Padding = UDim.new(0, 8)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Right Layout Configuration
local rightContainer = Instance.new("Frame", mainFrame)
rightContainer.Size = UDim2.new(0.44, -12, 1, -50)
rightContainer.Position = UDim2.new(0.56, 0, 0, 42)
rightContainer.BackgroundTransparency = 1

local playerListStroke = Instance.new("UIStroke", rightContainer)
playerListStroke.Color = Color3.fromRGB(35, 35, 35)
playerListStroke.Thickness = 1

local playerScroll = Instance.new("ScrollingFrame", rightContainer)
playerScroll.Size = UDim2.new(1, -10, 1, -10)
playerScroll.Position = UDim2.fromOffset(5, 5)
playerScroll.BackgroundTransparency = 1
playerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
playerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
playerScroll.ScrollBarThickness = 2

local playerListLayout = Instance.new("UIListLayout", playerScroll)
playerListLayout.Padding = UDim.new(0, 4)
playerListLayout.SortOrder = Enum.SortOrder.Name

-- --- PANEL DRAG ANIMATION LOGIC ---
local function makeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    handle.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end
makeDraggable(mainFrame, header)

-- --- VISIBILITY SLIDE TWEENS ---
local originalMainPos = mainFrame.Position
local crownOnScreenPos = UDim2.new(0, 20, 0.5, -25)
local crownOffScreenPos = UDim2.new(0, -65, 0.5, -25)

openBtn.Position = crownOffScreenPos

local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local shrinkInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

closeBtn.MouseButton1Click:Connect(function()
    local t1 = TweenService:Create(mainFrame, shrinkInfo, {Size = UDim2.fromOffset(0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
    t1:Play()
    t1.Completed:Connect(function()
        mainFrame.Visible = false
        openBtn.Visible = true
        TweenService:Create(openBtn, tweenInfo, {Position = crownOnScreenPos}):Play()
    end)
end)

openBtn.MouseButton1Click:Connect(function()
    local t1 = TweenService:Create(openBtn, shrinkInfo, {Position = crownOffScreenPos})
    t1:Play()
    t1.Completed:Connect(function()
        openBtn.Visible = false
        mainFrame.Visible = true
        mainFrame.Size = UDim2.fromOffset(460, 360)
        mainFrame.Position = UDim2.new(0.5, -230, 0.5, -180)
        TweenService:Create(mainFrame, tweenInfo, {Position = originalMainPos}):Play()
    end)
end)

-- --- SLIDER SYSTEM BUILDER ---
local function createSlider(parent, name, min, max, defaultVal, isFloat, order)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -5, 0, 40)
    container.BackgroundTransparency = 1
    container.LayoutOrder = order

    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(1, 0, 0, 14)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = name .. ": " .. tostring(defaultVal)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderBg = Instance.new("TextButton", container)
    sliderBg.Size = UDim2.new(1, 0, 0, 6)
    sliderBg.Position = UDim2.new(0, 0, 0, 18)
    sliderBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sliderBg.Text = ""
    sliderBg.AutoButtonColor = false
    local sliderBgCorner = Instance.new("UICorner", sliderBg)
    sliderBgCorner.CornerRadius = UDim.new(0, 3)

    local sliderFill = Instance.new("Frame", sliderBg)
    sliderFill.Size = UDim2.new((defaultVal - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = PURPLE_ACCENT
    sliderFill.BorderSizePixel = 0
    local sliderFillCorner = Instance.new("UICorner", sliderFill)
    sliderFillCorner.CornerRadius = UDim.new(0, 3)

    local value = defaultVal
    local dragging = false

    local function update(input)
        local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        sliderFill.Size = UDim2.new(pos, 0, 1, 0)
        local rawValue = min + pos * (max - min)
        value = isFloat and math.floor(rawValue * 100) / 100 or math.floor(rawValue)
        label.Text = name .. ": " .. tostring(value)
    end

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; update(input)
        end
    end)
    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)

    return function() return value end
end

-- --- CONSTRUCT FUNCTIONAL ELEMENTS ---

-- 1. Input Box
local targetBox = Instance.new("TextBox", listFrame)
targetBox.Size = UDim2.new(1, -5, 0, 30)
targetBox.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
targetBox.TextColor3 = Color3.new(1, 1, 1)
targetBox.PlaceholderText = "Target Username..."
targetBox.Text = ""
targetBox.Font = Enum.Font.SourceSans
targetBox.TextSize = 13
targetBox.LayoutOrder = 1
local boxCorner = Instance.new("UICorner", targetBox)
boxCorner.CornerRadius = UDim.new(0, 6)
local boxStroke = Instance.new("UIStroke", targetBox)
boxStroke.Color = Color3.fromRGB(45, 45, 45)

-- 1b. Global Everyone Override Button
local everyoneBtn = Instance.new("TextButton", listFrame)
everyoneBtn.Size = UDim2.new(1, -5, 0, 26)
everyoneBtn.BackgroundColor3 = Color3.fromRGB(40, 15, 80)
everyoneBtn.Text = "[ EVERYONE ]"
everyoneBtn.TextColor3 = Color3.new(1, 1, 1)
everyoneBtn.Font = Enum.Font.SourceSansBold
everyoneBtn.TextSize = 12
everyoneBtn.LayoutOrder = 2
local evCorner = Instance.new("UICorner", everyoneBtn)
evCorner.CornerRadius = UDim.new(0, 6)
local evStroke = Instance.new("UIStroke", everyoneBtn)
evStroke.Color = PURPLE_ACCENT

everyoneBtn.MouseButton1Click:Connect(function()
    targetBox.Text = "Everyone"
    for _, btn in ipairs(playerScroll:GetChildren()) do
        if btn:IsA("TextButton") then btn.UIStroke.Color = Color3.fromRGB(35, 35, 35) end
    end
end)

-- 1c. Extender Visibility Toggle Button
local extToggleBtn = Instance.new("TextButton", listFrame)
extToggleBtn.Size = UDim2.new(1, -5, 0, 26)
extToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
extToggleBtn.Text = "Toggle Extender Panel"
extToggleBtn.TextColor3 = Color3.fromRGB(200, 160, 255)
extToggleBtn.Font = Enum.Font.SourceSansBold
extToggleBtn.TextSize = 12
extToggleBtn.LayoutOrder = 3
Instance.new("UICorner", extToggleBtn).CornerRadius = UDim.new(0, 6)
local toggleStroke = Instance.new("UIStroke", extToggleBtn)
toggleStroke.Color = Color3.fromRGB(60, 60, 60)

local extOpen = false
extToggleBtn.MouseButton1Click:Connect(function()
    extOpen = not extOpen
    local targetPos = extOpen and UDim2.fromOffset(455, 0) or UDim2.fromOffset(460, 0)
    local targetSize = extOpen and UDim2.fromOffset(200, 360) or UDim2.fromOffset(0, 360)
    
    TweenService:Create(extenderFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = targetPos,
        Size = targetSize
    }):Play()
    
    toggleStroke.Color = extOpen and PURPLE_ACCENT or Color3.fromRGB(60, 60, 60)
end)

-- 2. Length/Distance Slider
local getLength = createSlider(listFrame, "Action Distance", 1, 25, 3, false, 4)

-- 3. Speed Frequency Slider
local getSpeed = createSlider(listFrame, "Oscillation Speed", 5, 100, 30, false, 5)

-- 4. Mode Button Setup (Back / Front toggle layout)
local modeBtn = Instance.new("TextButton", listFrame)
modeBtn.Size = UDim2.new(1, -5, 0, 28)
modeBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
modeBtn.Text = "Mode: BACK"
modeBtn.TextColor3 = Color3.new(1, 1, 1)
modeBtn.Font = Enum.Font.SourceSansBold
modeBtn.TextSize = 12
modeBtn.LayoutOrder = 6
local modeCorner = Instance.new("UICorner", modeBtn)
modeCorner.CornerRadius = UDim.new(0, 6)
local modeStroke = Instance.new("UIStroke", modeBtn)
modeStroke.Color = Color3.fromRGB(50, 50, 50)

local direction = 1 -- 1 = Back, -1 = Front
modeBtn.MouseButton1Click:Connect(function()
    direction = direction == 1 and -1 or 1
    modeBtn.Text = direction == 1 and "Mode: BACK" or "Mode: FRONT"
end)

-- 5. Execution Buttons
local toggleContainer = Instance.new("Frame", listFrame)
toggleContainer.Size = UDim2.new(1, -5, 0, 32)
toggleContainer.BackgroundTransparency = 1
toggleContainer.LayoutOrder = 7

local onBtn = Instance.new("TextButton", toggleContainer)
onBtn.Size = UDim2.new(0.48, 0, 1, 0)
onBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
onBtn.Text = "START"
onBtn.TextColor3 = Color3.fromRGB(80, 220, 120)
onBtn.Font = Enum.Font.SourceSansBold
local onCorner = Instance.new("UICorner", onBtn)
onCorner.CornerRadius = UDim.new(0, 6)
local onStroke = Instance.new("UIStroke", onBtn)
onStroke.Color = Color3.fromRGB(80, 220, 120)

local offBtn = Instance.new("TextButton", toggleContainer)
offBtn.Size = UDim2.new(0.48, 0, 1, 0)
offBtn.Position = UDim2.new(0.52, 0, 0, 0)
offBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
offBtn.Text = "STOP"
offBtn.TextColor3 = Color3.fromRGB(220, 80, 80)
offBtn.Font = Enum.Font.SourceSansBold
local offCorner = Instance.new("UICorner", offBtn)
offCorner.CornerRadius = UDim.new(0, 6)
local offStroke = Instance.new("UIStroke", offBtn)
offStroke.Color = Color3.fromRGB(220, 80, 80)

-- --- SERVER LIST SYNC & SEQUENTIAL SLOT FILLING ---
local function updatePlayerList()
    for _, child in ipairs(playerScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton", playerScroll)
        pBtn.Size = UDim2.new(1, -5, 0, 26)
        pBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        pBtn.Text = "  " .. player.DisplayName .. " (@" .. player.Name .. ")"
        pBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
        pBtn.Font = Enum.Font.SourceSans
        pBtn.TextSize = 12
        pBtn.TextXAlignment = Enum.TextXAlignment.Left
        pBtn.Name = player.Name
        local pBtnCorner = Instance.new("UICorner", pBtn)
        pBtnCorner.CornerRadius = UDim.new(0, 4)
        
        local btnStroke = Instance.new("UIStroke", pBtn)
        btnStroke.Color = Color3.fromRGB(35, 35, 35)
        
        pBtn.MouseButton1Click:Connect(function()
            -- Main Box Assignment
            targetBox.Text = player.Name
            for _, btn in ipairs(playerScroll:GetChildren()) do
                if btn:IsA("TextButton") then btn.UIStroke.Color = Color3.fromRGB(35, 35, 35) end
            end
            btnStroke.Color = PURPLE_ACCENT

            -- Sequential Extender Assignment (1st click -> Slot 1, 2nd click -> Slot 2, etc.)
            for i = 1, 5 do
                if extenderBoxes[i].Text == "" or extenderBoxes[i].Text == player.Name then
                    extenderBoxes[i].Text = player.Name
                    break
                end
            end
        end)
    end
end

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
updatePlayerList()

local function findTargetMatch(text)
    local query = string.lower(text)
    if query == "" then return nil end
    if query == "everyone" then return "Everyone" end
    for _, player in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(player.Name), query, 1, true) or string.find(string.lower(player.DisplayName), query, 1, true) then
            return player
        end
    end
    return nil
end

-- --- BROOKHAVEN ROLEPLAY NAME MODIFIER ---
local function changeRoleplayName(newName)
    pcall(function()
        local avatarRemote = ReplicatedStorage:FindFirstChild("AvatarEvent")
        if avatarRemote and avatarRemote:IsA("RemoteEvent") then
            avatarRemote:FireServer("Bio", "Name", newName)
        end
    end)
end

-- --- TRANSMISSION CONTROLLER ENGINE ---
local isActive = false

onBtn.MouseButton1Click:Connect(function()
    if isActive then return end
    
    isActive = true
    onBtn.Text = "RUNNING"
    
    -- Automatic Roleplay Identity Update
    changeRoleplayName("ErYx" .. lp.Name)

    task.spawn(function()
        while isActive do
            local dt = RunService.RenderStepped:Wait()
            
            -- Find all your owned network props
            local props = {}
            local trafficCones = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
            if trafficCones then
                for _, v in pairs(trafficCones:GetChildren()) do
                    if string.find(v.Name, "Prop" .. lp.Name) then
                        local remote = v:FindFirstChild("SetCurrentCFrame")
                        if remote then table.insert(props, remote) end
                    end
                end
            end

            if #props > 0 then
                local length = getLength()
                local speed = getSpeed()
                local frequency = tick() * (speed * 0.5)
                local backAndForthOffset = math.sin(frequency) * length

                -- Target Determination Array Builder
                local targetRoots = {}
                
                -- Check if Extender Multi-Slots contain entries
                local hasExtenderTargets = false
                for i = 1, 5 do
                    if extenderBoxes[i].Text ~= "" then
                        local extPlr = findTargetMatch(extenderBoxes[i].Text)
                        if extPlr and extPlr ~= "Everyone" and extPlr.Character and extPlr.Character:FindFirstChild("HumanoidRootPart") then
                            table.insert(targetRoots, extPlr.Character.HumanoidRootPart)
                            hasExtenderTargets = true
                        end
                    end
                end

                -- Fallback to standard input parameters if extender is completely empty
                if not hasExtenderTargets then
                    local target = findTargetMatch(targetBox.Text)
                    if target == "Everyone" then
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                table.insert(targetRoots, player.Character.HumanoidRootPart)
                            end
                        end
                    elseif target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        table.insert(targetRoots, target.Character.HumanoidRootPart)
                    end
                end

                -- Mapping Strategy: Distribute 1 Prop per 1 target player root
                if #targetRoots > 0 then
                    for index, remote in ipairs(props) do
                        local targetIndex = ((index - 1) % #targetRoots) + 1
                        local tRoot = targetRoots[targetIndex]
                        
                        if tRoot then
                            local targetPos = tRoot.CFrame * CFrame.new(0, 0, (direction * length) + backAndForthOffset)
                            task.spawn(function()
                                pcall(function() remote:InvokeServer(targetPos) end)
                            end)
                        end
                    end
                end
            end
        end
        isActive = false
        onBtn.Text = "START"
    end)
end)

offBtn.MouseButton1Click:Connect(function()
    isActive = false
    onBtn.Text = "START"
end)

