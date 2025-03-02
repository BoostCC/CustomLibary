local UILibrary = {}
local TweenService = game:GetService("TweenService")

-- Utility Functions
local function CreateGradient(frame, color1, color2)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    })
    gradient.Rotation = 45
    gradient.Parent = frame
    return gradient
end

-- Modern Toggle
function UILibrary.CreateToggle(parent, text, defaultState, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = text .. "Toggle"
    toggleFrame.Size = UDim2.new(0, 120, 0, 24)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = parent

    local toggleButton = Instance.new("Frame")
    toggleButton.Size = UDim2.new(0, 36, 0, 16)
    toggleButton.Position = UDim2.new(0, 0, 0.5, -8)
    toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleFrame

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = toggleButton

    local sliderButton = Instance.new("Frame")
    sliderButton.Size = UDim2.new(0, 12, 0, 12)
    sliderButton.Position = UDim2.new(0, 2, 0.5, -6)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Parent = toggleButton

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(1, 0)
    sliderCorner.Parent = sliderButton

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(0, 80, 1, 0)
    toggleLabel.Position = UDim2.new(0, 44, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = text
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextSize = 12
    toggleLabel.Parent = toggleFrame

    local enabled = defaultState or false
    local function updateVisual(animate)
        local pos = enabled and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        local color = enabled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(30, 30, 30)
        
        if animate then
            TweenService:Create(sliderButton, TweenInfo.new(0.2), {Position = pos}):Play()
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
        else
            sliderButton.Position = pos
            toggleButton.BackgroundColor3 = color
        end
    end

    toggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            enabled = not enabled
            updateVisual(true)
            if callback then callback(enabled) end
        end
    end)

    updateVisual(false)
    return toggleFrame
end

-- Modern Dropdown
function UILibrary.CreateDropdown(parent, text, options, callback)
    local dropFrame = Instance.new("Frame")
    dropFrame.Name = text .. "Dropdown"
    dropFrame.Size = UDim2.new(0, 140, 0, 30)
    dropFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    dropFrame.BorderSizePixel = 0
    dropFrame.Parent = parent

    CreateGradient(dropFrame, 
        Color3.fromRGB(30, 30, 30),
        Color3.fromRGB(20, 20, 20)
    )

    local dropButton = Instance.new("TextButton")
    dropButton.Size = UDim2.new(1, 0, 1, 0)
    dropButton.BackgroundTransparency = 1
    dropButton.Text = text
    dropButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropButton.Font = Enum.Font.Gotham
    dropButton.TextSize = 12
    dropButton.Parent = dropFrame

    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, 0, 0, #options * 25)
    optionsFrame.Position = UDim2.new(0, 0, 1, 2)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    optionsFrame.BorderSizePixel = 0
    optionsFrame.Visible = false
    optionsFrame.ZIndex = 5
    optionsFrame.Parent = dropFrame

    CreateGradient(optionsFrame,
        Color3.fromRGB(30, 30, 30),
        Color3.fromRGB(20, 20, 20)
    )

    -- Add options...
    -- ...existing dropdown code but with updated styling...

    return dropFrame
end

-- Modern Color Picker
function UILibrary.CreateColorPicker(parent, text, defaultColor, callback)
    local pickerFrame = Instance.new("Frame")
    -- ...create modern color picker with gradient styling...
    -- Add color history system
    -- Add color save feature
    -- Add better HSV selector
    -- Make window separate from main UI

    local ColorButton = library:create("TextButton", {
        Name = "ColorButton",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 28, 28),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 265, 0.5, 0),
        Size = UDim2.new(0, 12, 0, 12), -- Made much smaller (12x12)
        AutoButtonColor = false,
        Font = Enum.Font.Ubuntu,
        Text = "",
        TextXAlignment = Enum.TextXAlignment.Right,
    }, parent)

    local UICorner = library:create("UICorner", {
        CornerRadius = UDim.new(1, 0) -- Full circle
    }, ColorButton)

    local ColorFrame = library:create("Frame", {
        Name = "ColorFrame",
        Parent = ColorButton,
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, 5, 0, 0),
        Size = UDim2.new(0, 130, 0, 130), -- Made picker smaller
        Visible = false,
        ZIndex = 2,
    }, ColorButton)

    -- ...rest of existing code...

    return pickerFrame
end

return UILibrary
