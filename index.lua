local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/BoostCC/CustomLibary/refs/heads/main/index.lua'))()

-- // Window \\ --
local window = library.new('My Cool Script', 'configs')

-- // Tabs \\ -- 
-- Now using format: window.new_tab(icon_id, display_name)
local main_tab = window.new_tab('rbxassetid://4483345998', 'Combat')
local visuals_tab = window.new_tab('rbxassetid://4483345998', 'Visuals')
local misc_tab = window.new_tab('rbxassetid://4483345998', 'Misc')

-- // Sections \\ --
local combat_section = main_tab.new_section('Combat')
local esp_section = visuals_tab.new_section('ESP')

-- // Sectors \\ --
local aimbot_sector = combat_section.new_sector('Aimbot', 'Left')
local esp_settings = esp_section.new_sector('Settings', 'Right')

-- // Elements \\ --
local aimbot_toggle = aimbot_sector.element('Toggle', 'Enable Aimbot', {default = false}, function(value)
    print("Aimbot:", value.Toggle)
end)

-- Color picker with rounded display
aimbot_toggle:add_color({Color = Color3.fromRGB(255, 50, 50)}, true, function(value)
    print("Aimbot Color:", value.Color)
end)

-- Dropdown with rounded corners and animations
local aim_target = aimbot_sector.element('Dropdown', 'Target Selection', {
    default = "Head",
    options = {'Head', 'Torso', 'Closest'}
}, function(value)
    print("Aim Target:", value.Dropdown)  
end)

-- Slider with rounded design
local aim_smoothing = aimbot_sector.element('Slider', 'Smoothing', {
    default = {min = 1, max = 100, default = 20}
}, function(value) 
    print("Smoothing:", value.Slider)
end)

-- ESP settings
local esp_enabled = esp_settings.element('Toggle', 'Enable ESP', {default = false}, function(value)
    print("ESP:", value.Toggle)
end)

local esp_settings_combo = esp_settings.element('Combo', 'ESP Elements', {
    options = {'Names', 'Boxes', 'Health', 'Distance', 'Tracers'}
}, function(value)
    print("ESP Features:", table.concat(value.Combo, ", "))
end)
