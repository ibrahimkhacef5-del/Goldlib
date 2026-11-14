--[[
    ═══════════════════════════════════════════════════════════════════
    🏆 GoldLib v1.0 — Ultimate Edition
    ================================================================
    ✨ 12 Themes + 5 Boot Screens + Key System
    🎨 Live Color Editor
    🎯 15+ Elements (Slider, Toggle, Dropdown, Keybind...)
    💾 Save/Load Config
    🔔 Notifications
    ═══════════════════════════════════════════════════════════════════
]]

local GoldLib = {}
GoldLib.__index = GoldLib

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local HttpService      = game:GetService("HttpService")
local LocalPlayer      = Players.LocalPlayer

GoldLib.Elements = {}
GoldLib.Flags = {}
GoldLib.Windows = {}
GoldLib.Version = "1.0"

-- ═══════════════════════════════════════════════════════════════════
--                     🎨 Themes
-- ═══════════════════════════════════════════════════════════════════
GoldLib.Themes = {
    Gold = {
        Background = Color3.fromRGB(20, 18, 12),
        Sidebar = Color3.fromRGB(15, 13, 8),
        Card = Color3.fromRGB(30, 27, 18),
        Element = Color3.fromRGB(40, 36, 24),
        Hover = Color3.fromRGB(55, 50, 32),
        Accent = Color3.fromRGB(255, 200, 60),
        AccentAlt = Color3.fromRGB(200, 150, 30),
        Text = Color3.fromRGB(250, 245, 230),
        SubText = Color3.fromRGB(180, 160, 110),
        Stroke = Color3.fromRGB(80, 70, 40),
        CornerRadius = 8,
    },
    Default = {
        Background = Color3.fromRGB(20, 20, 26),
        Sidebar = Color3.fromRGB(15, 15, 20),
        Card = Color3.fromRGB(30, 30, 38),
        Element = Color3.fromRGB(38, 38, 48),
        Hover = Color3.fromRGB(48, 48, 60),
        Accent = Color3.fromRGB(138, 43, 226),
        AccentAlt = Color3.fromRGB(90, 30, 180),
        Text = Color3.fromRGB(240, 240, 245),
        SubText = Color3.fromRGB(150, 150, 170),
        Stroke = Color3.fromRGB(50, 50, 65),
        CornerRadius = 8,
    },
    iOSGlass = {
        Background = Color3.fromRGB(245, 245, 250),
        Sidebar = Color3.fromRGB(230, 230, 240),
        Card = Color3.fromRGB(255, 255, 255),
        Element = Color3.fromRGB(240, 240, 250),
        Hover = Color3.fromRGB(220, 220, 240),
        Accent = Color3.fromRGB(0, 122, 255),
        AccentAlt = Color3.fromRGB(100, 180, 255),
        Text = Color3.fromRGB(20, 20, 30),
        SubText = Color3.fromRGB(100, 100, 120),
        Stroke = Color3.fromRGB(200, 200, 220),
        CornerRadius = 14,
    },
    BlackShine = {
        Background = Color3.fromRGB(10, 10, 12),
        Sidebar = Color3.fromRGB(5, 5, 8),
        Card = Color3.fromRGB(20, 20, 24),
        Element = Color3.fromRGB(28, 28, 34),
        Hover = Color3.fromRGB(40, 40, 48),
        Accent = Color3.fromRGB(255, 255, 255),
        AccentAlt = Color3.fromRGB(180, 180, 180),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(140, 140, 140),
        Stroke = Color3.fromRGB(60, 60, 70),
        CornerRadius = 10,
    },
    RedWhite = {
        Background = Color3.fromRGB(245, 245, 245),
        Sidebar = Color3.fromRGB(220, 50, 60),
        Card = Color3.fromRGB(255, 255, 255),
        Element = Color3.fromRGB(240, 240, 240),
        Hover = Color3.fromRGB(230, 230, 230),
        Accent = Color3.fromRGB(220, 50, 60),
        AccentAlt = Color3.fromRGB(180, 30, 40),
        Text = Color3.fromRGB(30, 30, 40),
        SubText = Color3.fromRGB(120, 120, 130),
        Stroke = Color3.fromRGB(220, 50, 60),
        CornerRadius = 8,
    },
    PurpleDream = {
        Background = Color3.fromRGB(30, 15, 50),
        Sidebar = Color3.fromRGB(20, 10, 35),
        Card = Color3.fromRGB(45, 25, 70),
        Element = Color3.fromRGB(55, 35, 85),
        Hover = Color3.fromRGB(70, 45, 105),
        Accent = Color3.fromRGB(200, 100, 255),
        AccentAlt = Color3.fromRGB(150, 50, 200),
        Text = Color3.fromRGB(250, 240, 255),
        SubText = Color3.fromRGB(180, 150, 210),
        Stroke = Color3.fromRGB(100, 60, 150),
        CornerRadius = 12,
    },
    Halloween = {
        Background = Color3.fromRGB(20, 10, 5),
        Sidebar = Color3.fromRGB(15, 5, 2),
        Card = Color3.fromRGB(35, 15, 5),
        Element = Color3.fromRGB(50, 20, 10),
        Hover = Color3.fromRGB(70, 30, 15),
        Accent = Color3.fromRGB(255, 120, 0),
        AccentAlt = Color3.fromRGB(180, 80, 0),
        Text = Color3.fromRGB(255, 230, 200),
        SubText = Color3.fromRGB(200, 150, 100),
        Stroke = Color3.fromRGB(100, 50, 20),
        CornerRadius = 10,
    },
    Cyberpunk = {
        Background = Color3.fromRGB(10, 5, 25),
        Sidebar = Color3.fromRGB(5, 2, 15),
        Card = Color3.fromRGB(20, 10, 40),
        Element = Color3.fromRGB(30, 15, 55),
        Hover = Color3.fromRGB(45, 25, 75),
        Accent = Color3.fromRGB(0, 255, 200),
        AccentAlt = Color3.fromRGB(255, 0, 150),
        Text = Color3.fromRGB(220, 255, 255),
        SubText = Color3.fromRGB(150, 200, 220),
        Stroke = Color3.fromRGB(0, 200, 180),
        CornerRadius = 4,
    },
    Ocean = {
        Background = Color3.fromRGB(10, 25, 40),
        Sidebar = Color3.fromRGB(5, 15, 25),
        Card = Color3.fromRGB(20, 40, 60),
        Element = Color3.fromRGB(30, 55, 80),
        Hover = Color3.fromRGB(45, 75, 105),
        Accent = Color3.fromRGB(0, 200, 255),
        AccentAlt = Color3.fromRGB(0, 120, 180),
        Text = Color3.fromRGB(220, 240, 255),
        SubText = Color3.fromRGB(130, 180, 220),
        Stroke = Color3.fromRGB(30, 80, 120),
        CornerRadius = 12,
    },
    Forest = {
        Background = Color3.fromRGB(15, 25, 15),
        Sidebar = Color3.fromRGB(8, 15, 8),
        Card = Color3.fromRGB(25, 40, 25),
        Element = Color3.fromRGB(35, 55, 35),
        Hover = Color3.fromRGB(45, 70, 45),
        Accent = Color3.fromRGB(80, 200, 100),
        AccentAlt = Color3.fromRGB(50, 150, 70),
        Text = Color3.fromRGB(220, 255, 220),
        SubText = Color3.fromRGB(150, 190, 150),
        Stroke = Color3.fromRGB(50, 80, 50),
        CornerRadius = 10,
    },
    Sunset = {
        Background = Color3.fromRGB(40, 15, 30),
        Sidebar = Color3.fromRGB(25, 8, 20),
        Card = Color3.fromRGB(60, 25, 45),
        Element = Color3.fromRGB(80, 35, 60),
        Hover = Color3.fromRGB(105, 50, 80),
        Accent = Color3.fromRGB(255, 100, 150),
        AccentAlt = Color3.fromRGB(200, 60, 100),
        Text = Color3.fromRGB(255, 230, 240),
        SubText = Color3.fromRGB(220, 160, 190),
        Stroke = Color3.fromRGB(120, 50, 80),
        CornerRadius = 10,
    },
    Candy = {
        Background = Color3.fromRGB(255, 240, 250),
        Sidebar = Color3.fromRGB(255, 200, 230),
        Card = Color3.fromRGB(255, 255, 255),
        Element = Color3.fromRGB(255, 230, 245),
        Hover = Color3.fromRGB(255, 200, 230),
        Accent = Color3.fromRGB(255, 100, 180),
        AccentAlt = Color3.fromRGB(200, 60, 140),
        Text = Color3.fromRGB(80, 20, 50),
        SubText = Color3.fromRGB(150, 100, 130),
        Stroke = Color3.fromRGB(255, 150, 200),
        CornerRadius = 16,
    },
    Midnight = {
        Background = Color3.fromRGB(8, 12, 24),
        Sidebar = Color3.fromRGB(4, 6, 15),
        Card = Color3.fromRGB(15, 20, 35),
        Element = Color3.fromRGB(22, 28, 48),
        Hover = Color3.fromRGB(35, 45, 70),
        Accent = Color3.fromRGB(100, 150, 255),
        AccentAlt = Color3.fromRGB(60, 100, 200),
        Text = Color3.fromRGB(220, 230, 255),
        SubText = Color3.fromRGB(130, 150, 200),
        Stroke = Color3.fromRGB(40, 55, 100),
        CornerRadius = 12,
    },
}

GoldLib.Theme = {}
for k, v in pairs(GoldLib.Themes.Gold) do GoldLib.Theme[k] = v end

-- ═══════════════════════════════════════════════════════════════════
--                     Helpers
-- ═══════════════════════════════════════════════════════════════════
local function create(c, p)
    local i = Instance.new(c)
    for k, v in pairs(p or {}) do i[k] = v end
    return i
end

local function corner(p, r)
    return create("UICorner", { CornerRadius = UDim.new(0, r or GoldLib.Theme.CornerRadius), Parent = p })
end

local function stroke(p, c, t)
    return create("UIStroke", {
        Color = c or GoldLib.Theme.Stroke,
        Thickness = t or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = p
    })
end

local function tween(o, t, p, s)
    return TweenService:Create(o, TweenInfo.new(t or 0.2, s or Enum.EasingStyle.Quart), p)
end

local function round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- ═══════════════════════════════════════════════════════════════════
--                     SetTheme
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:SetTheme(themeName)
    if not GoldLib.Themes[themeName] then return false end
    for k, v in pairs(GoldLib.Themes[themeName]) do
        GoldLib.Theme[k] = v
    end
    for _, win in ipairs(GoldLib.Windows) do
        if win.UpdateTheme then pcall(function() win:UpdateTheme() end) end
    end
    return true
end

-- ═══════════════════════════════════════════════════════════════════
--                     🎨 Live Theme Editor
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:OpenThemeEditor()
    local editorGui = create("ScreenGui", {
        Name = "GoldThemeEditor_" .. math.random(10000, 99999),
        ResetOnSpawn = false,
        DisplayOrder = 2147483647,
        IgnoreGuiInset = true,
        Parent = LocalPlayer:WaitForChild("PlayerGui")
    })

    local panel = create("Frame", {
        Size = UDim2.new(0, 190, 0, 340),
        Position = UDim2.new(0.5, -95, 0.5, -170),
        BackgroundColor3 = GoldLib.Theme.Background,
        BorderSizePixel = 0,
        Active = true,
        Parent = editorGui
    })
    corner(panel, 10)
    stroke(panel, GoldLib.Theme.Accent, 1.5)

    local header = create("Frame", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundTransparency = 1,
        Active = true,
        Parent = panel
    })

    create("TextLabel", {
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "🎨 Theme Editor",
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })

    local closeBtn = create("TextButton", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(1, -22, 0.5, -8),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "✕",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = header
    })
    corner(closeBtn, 8)
    closeBtn.Activated:Connect(function() editorGui:Destroy() end)

    local dragging, dragStart, startPos = false, nil, nil
    header.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = inp.Position
            startPos = panel.Position
        end
    end)
    header.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
        or inp.UserInputType == Enum.UserInputType.Touch) then
            local d = inp.Position - dragStart
            panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                       startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)

    local scroll = create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, -100),
        Position = UDim2.new(0, 4, 0, 26),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = GoldLib.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = panel
    })

    create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
        Parent = scroll
    })

    local themeKeys = {"Background", "Sidebar", "Card", "Element", "Hover",
                       "Accent", "AccentAlt", "Text", "SubText", "Stroke"}

    local activePicker, activePickerBtn = nil, nil
    local pickerFrame = create("Frame", {
        Size = UDim2.new(1, -8, 0, 0),
        Position = UDim2.new(0, 4, 1, -76),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 5,
        Parent = panel
    })
    corner(pickerFrame, 6)
    stroke(pickerFrame, GoldLib.Theme.Accent, 1)

    local pickerTitle = create("TextLabel", {
        Size = UDim2.new(1, -6, 0, 10),
        Position = UDim2.new(0, 4, 0, 2),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 8,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = pickerFrame
    })

    local rgbSliders = {}
    for idx, chName in ipairs({"R", "G", "B"}) do
        local rowY = (idx - 1) * 10 + 12
        create("TextLabel", {
            Size = UDim2.new(0, 10, 0, 8),
            Position = UDim2.new(0, 4, 0, rowY + 1),
            BackgroundTransparency = 1,
            Text = chName,
            TextColor3 = GoldLib.Theme.Text,
            TextSize = 8,
            Font = Enum.Font.GothamBold,
            Parent = pickerFrame
        })

        local barBg = create("Frame", {
            Size = UDim2.new(1, -22, 0, 6),
            Position = UDim2.new(0, 16, 0, rowY + 2),
            BackgroundColor3 = GoldLib.Theme.Element,
            BorderSizePixel = 0,
            Parent = pickerFrame
        })
        corner(barBg, 3)

        local fill = create("Frame", {
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundColor3 = GoldLib.Theme.Accent,
            BorderSizePixel = 0,
            Parent = barBg
        })
        corner(fill, 3)

        local hit = create("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = barBg
        })

        rgbSliders[chName] = { bar = barBg, fill = fill, value = 0 }

        local isDragging = false
        local function updateFromX(absX)
            local rel = math.clamp((absX - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1)
            rgbSliders[chName].value = rel
            fill.Size = UDim2.new(rel, 0, 1, 0)
            if activePicker then
                GoldLib.Theme[activePicker] = Color3.new(
                    rgbSliders.R.value, rgbSliders.G.value, rgbSliders.B.value
                )
                if activePickerBtn then
                    activePickerBtn.BackgroundColor3 = GoldLib.Theme[activePicker]
                end
                for _, win in ipairs(GoldLib.Windows) do
                    if win.UpdateTheme then pcall(function() win:UpdateTheme() end) end
                end
            end
        end

        hit.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
                updateFromX(inp.Position.X)
            end
        end)
        UserInputService.InputChanged:Connect(function(inp)
            if isDragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
            or inp.UserInputType == Enum.UserInputType.Touch) then
                updateFromX(inp.Position.X)
            end
        end)
        UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch then
                isDragging = false
            end
        end)
    end

    local applyBtn = create("TextButton", {
        Size = UDim2.new(0.33, -3, 0, 14),
        Position = UDim2.new(0, 2, 1, -16),
        BackgroundColor3 = GoldLib.Theme.Accent,
        Text = "✓ Apply",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = pickerFrame
    })
    corner(applyBtn, 4)
    applyBtn.Activated:Connect(function()
        for _, win in ipairs(GoldLib.Windows) do
            if win.UpdateTheme then pcall(function() win:UpdateTheme() end) end
        end
        pickerFrame.Visible = false
        pickerFrame.Size = UDim2.new(1, -8, 0, 0)
        activePicker, activePickerBtn = nil, nil
    end)

    local copyHexBtn = create("TextButton", {
        Size = UDim2.new(0.33, -3, 0, 14),
        Position = UDim2.new(0.33, 1, 1, -16),
        BackgroundColor3 = GoldLib.Theme.Element,
        Text = "📋 Hex",
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = pickerFrame
    })
    corner(copyHexBtn, 4)
    copyHexBtn.Activated:Connect(function()
        if activePicker and setclipboard then
            local c = GoldLib.Theme[activePicker]
            local hex = string.format("#%02X%02X%02X",
                math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
            setclipboard(hex)
            copyHexBtn.Text = "✓ Copied"
            task.wait(0.8)
            copyHexBtn.Text = "📋 Hex"
        end
    end)

    local resetBtn = create("TextButton", {
        Size = UDim2.new(0.33, -3, 0, 14),
        Position = UDim2.new(0.66, 0, 1, -16),
        BackgroundColor3 = GoldLib.Theme.Element,
        Text = "↺ Reset",
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = pickerFrame
    })
    corner(resetBtn, 4)
    resetBtn.Activated:Connect(function()
        if activePicker then
            GoldLib.Theme[activePicker] = GoldLib.Themes.Gold[activePicker]
            if activePickerBtn then
                activePickerBtn.BackgroundColor3 = GoldLib.Theme[activePicker]
            end
            for _, win in ipairs(GoldLib.Windows) do
                if win.UpdateTheme then pcall(function() win:UpdateTheme() end) end
            end
        end
    end)

    for _, key in ipairs(themeKeys) do
        local row = create("Frame", {
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundColor3 = GoldLib.Theme.Card,
            BorderSizePixel = 0,
            Parent = scroll
        })
        corner(row, 4)

        create("TextLabel", {
            Size = UDim2.new(0.6, -6, 1, 0),
            Position = UDim2.new(0, 6, 0, 0),
            BackgroundTransparency = 1,
            Text = key,
            TextColor3 = GoldLib.Theme.Text,
            TextSize = 9,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = row
        })

        local colorPreview = create("TextButton", {
            Size = UDim2.new(0, 40, 0, 14),
            Position = UDim2.new(1, -46, 0.5, -7),
            BackgroundColor3 = GoldLib.Theme[key],
            Text = "",
            BorderSizePixel = 0,
            Parent = row
        })
        corner(colorPreview, 3)
        stroke(colorPreview, GoldLib.Theme.Stroke, 1)

        colorPreview.Activated:Connect(function()
            activePicker = key
            activePickerBtn = colorPreview
            pickerTitle.Text = "▸ " .. key
            local c = GoldLib.Theme[key]
            rgbSliders.R.value = c.R
            rgbSliders.G.value = c.G
            rgbSliders.B.value = c.B
            rgbSliders.R.fill.Size = UDim2.new(c.R, 0, 1, 0)
            rgbSliders.G.fill.Size = UDim2.new(c.G, 0, 1, 0)
            rgbSliders.B.fill.Size = UDim2.new(c.B, 0, 1, 0)
            pickerFrame.Visible = true
            pickerFrame.Size = UDim2.new(1, -8, 0, 0)
            tween(pickerFrame, 0.15, { Size = UDim2.new(1, -8, 0, 58) }):Play()
        end)
    end

    return editorGui
end

-- ═══════════════════════════════════════════════════════════════════
--                     🔔 Notification
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:Notify(cfg)
    cfg = cfg or {}
    local gui = create("ScreenGui", {
        Name = "GoldNotif_" .. math.random(1000, 9999),
        ResetOnSpawn = false,
        DisplayOrder = 2147483647,
        IgnoreGuiInset = true,
        Parent = LocalPlayer:WaitForChild("PlayerGui")
    })

    local frame = create("Frame", {
        Size = UDim2.new(0, 320, 0, 80),
        Position = UDim2.new(1, 20, 0, 100),
        BackgroundColor3 = GoldLib.Theme.Background,
        BorderSizePixel = 0,
        Parent = gui
    })
    corner(frame, 12)
    stroke(frame, cfg.Color or GoldLib.Theme.Accent, 1.5)

    create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 15, 0, 12),
        BackgroundTransparency = 1,
        Text = cfg.Title or "Notification",
        TextColor3 = cfg.Color or GoldLib.Theme.Accent,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame
    })

    create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 40),
        Position = UDim2.new(0, 15, 0, 32),
        BackgroundTransparency = 1,
        Text = cfg.Content or "",
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Parent = frame
    })

    tween(frame, 0.4, { Position = UDim2.new(1, -340, 0, 100) }, Enum.EasingStyle.Back):Play()

    task.delay(cfg.Duration or 5, function()
        tween(frame, 0.4, { Position = UDim2.new(1, 20, 0, 100) }):Play()
        task.wait(0.4)
        gui:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════════════
--                     💾 Save/Load Config
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:SaveConfig(fileName)
    if not writefile then return end
    fileName = fileName or "GoldConfig.json"
    local data = HttpService:JSONEncode(GoldLib.Flags)
    pcall(function() writefile(fileName, data) end)
    self:Notify({ Title = "💾 Saved", Content = "✅ Config saved", Duration = 3 })
end

function GoldLib:LoadConfig(fileName)
    if not (readfile and isfile) then return end
    fileName = fileName or "GoldConfig.json"
    if not isfile(fileName) then return end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(fileName)) end)
    if not ok or type(data) ~= "table" then return end
    for _, el in ipairs(GoldLib.Elements) do
        if el.flag and data[el.flag] ~= nil and el.Set then
            pcall(el.Set, data[el.flag])
        end
    end
    self:Notify({ Title = "📂 Loaded", Content = "✅ Config loaded", Duration = 3 })
end

-- ═══════════════════════════════════════════════════════════════════
--                     🪟 Window
-- ═══════════════════════════════════════════════════════════════════
function GoldLib.new(cfg)
    cfg = cfg or {}
    local self = setmetatable({}, GoldLib)
    self.Title = cfg.Title or "GoldLib"
    self.Subtitle = cfg.Subtitle or "v1.0"
    self.Icon = cfg.Icon or "🏆"
    self.Size = cfg.Size or UDim2.new(0, 580, 0, 420)
    self.ToggleKey = cfg.ToggleKey or Enum.KeyCode.RightShift
    self.IsOpen = false
    self.Tabs = {}
    self.CurrentTab = nil

    self.ScreenGui = create("ScreenGui", {
        Name = "GoldUI_" .. math.random(10000, 99999),
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true,
        DisplayOrder = 2147483647,
        Parent = LocalPlayer:WaitForChild("PlayerGui")
    })

    self:_buildWindow()
    self:_buildToggle()
    self:_bindHotkey()
    table.insert(GoldLib.Windows, self)
    return self
end

function GoldLib:_buildWindow()
    local win = create("Frame", {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, -self.Size.X.Offset / 2, 0.5, -self.Size.Y.Offset / 2),
        BackgroundColor3 = GoldLib.Theme.Background,
        BorderSizePixel = 0,
        Visible = false,
        Active = true,
        ClipsDescendants = true,
        Parent = self.ScreenGui
    })
    corner(win, GoldLib.Theme.CornerRadius)
    stroke(win, GoldLib.Theme.Accent, 1.5)
    self.Window = win

    local sidebar = create("Frame", {
        Size = UDim2.new(0, 155, 1, 0),
        BackgroundColor3 = GoldLib.Theme.Sidebar,
        BorderSizePixel = 0,
        Parent = win
    })
    corner(sidebar, GoldLib.Theme.CornerRadius)

    local header = create("Frame", {
        Size = UDim2.new(1, 0, 0, 65),
        BackgroundTransparency = 1,
        Active = true,
        Parent = sidebar
    })

    create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        Position = UDim2.new(0, 14, 0, 12),
        BackgroundTransparency = 1,
        Text = self.Icon .. " " .. self.Title,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })

    create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 14, 0, 34),
        BackgroundTransparency = 1,
        Text = self.Subtitle,
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })

    local tabs = create("ScrollingFrame", {
        Size = UDim2.new(1, -12, 1, -75),
        Position = UDim2.new(0, 6, 0, 68),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Active = true,
        Parent = sidebar
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = tabs })
    self.TabHolder = tabs

    local content = create("ScrollingFrame", {
        Size = UDim2.new(1, -165, 1, -20),
        Position = UDim2.new(0, 159, 0, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = GoldLib.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Active = true,
        Parent = win
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), Parent = content })
    self.Content = content

    local closeBtn = create("TextButton", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(1, -28, 0, 8),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "✕",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Active = true,
        Parent = win
    })
    corner(closeBtn, 11)
    closeBtn.Activated:Connect(function() self:Close() end)

    local dragging, dragStart, startPos = false, nil, nil
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = win.Position
        end
    end)
    header.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local d = input.Position - dragStart
            win.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                     startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

function GoldLib:_buildToggle()
    local btn = create("TextButton", {
        Size = UDim2.new(0, 58, 0, 58),
        Position = UDim2.new(0, 20, 0.5, -29),
        BackgroundColor3 = GoldLib.Theme.Background,
        Text = "",
        AutoButtonColor = false,
        Active = true,
        BorderSizePixel = 0,
        Parent = self.ScreenGui
    })
    corner(btn, 29)
    stroke(btn, GoldLib.Theme.Accent, 2)

    local icon = create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = self.Icon,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 26,
        Font = Enum.Font.GothamBold,
        Parent = btn
    })

    task.spawn(function()
        while btn.Parent do
            tween(icon, 1.4, { TextTransparency = 0.35 }):Play()
            task.wait(1.4)
            if not btn.Parent then break end
            tween(icon, 1.4, { TextTransparency = 0 }):Play()
            task.wait(1.4)
        end
    end)

    local dragging, moved = false, false
    local dragStart, startPos
    local THRESHOLD = 8

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            moved = false
            dragStart = input.Position
            startPos = btn.Position
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            if not moved then self:Toggle() end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local d = input.Position - dragStart
            if math.abs(d.X) > THRESHOLD or math.abs(d.Y) > THRESHOLD then
                moved = true
            end
            if moved then
                btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                         startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end
    end)
    self.ToggleBtn = btn
end

function GoldLib:_bindHotkey()
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == self.ToggleKey then self:Toggle() end
    end)
end

function GoldLib:Open()
    self.IsOpen = true
    self.Window.Visible = true
    self.Window.Size = UDim2.new(0, 0, 0, 0)
    tween(self.Window, 0.3, { Size = self.Size }, Enum.EasingStyle.Back):Play()
end

function GoldLib:Close()
    self.IsOpen = false
    tween(self.Window, 0.2, { Size = UDim2.new(0, 0, 0, 0) }):Play()
    task.delay(0.2, function() self.Window.Visible = false end)
end

function GoldLib:Toggle()
    if self.IsOpen then self:Close() else self:Open() end
end

function GoldLib:UpdateTheme()
    if not self.Window then return end
    tween(self.Window, 0.3, {
        BackgroundColor3 = GoldLib.Theme.Background,
    }):Play()
end

-- ═══════════════════════════════════════════════════════════════════
--                     📑 Tabs
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:AddTab(name, icon)
    local tab = { Name = name, Elements = {}, Enabled = true }

    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = GoldLib.Theme.Element,
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Active = true,
        Parent = self.TabHolder
    })
    corner(btn, GoldLib.Theme.CornerRadius)

    local indicator = create("Frame", {
        Size = UDim2.new(0, 3, 0, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = GoldLib.Theme.Accent,
        BorderSizePixel = 0,
        Parent = btn
    })
    corner(indicator, 2)

    local iconLbl = create("TextLabel", {
        Size = UDim2.new(0, 18, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = icon or "",
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        Parent = btn
    })

    local lbl = create("TextLabel", {
        Size = UDim2.new(1, -36, 1, 0),
        Position = UDim2.new(0, 32, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = btn
    })

    tab.Button, tab.Label, tab.Icon, tab.Indicator = btn, lbl, iconLbl, indicator

    local page = create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = self.Content
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), Parent = page })
    tab.Page = page

    btn.MouseEnter:Connect(function()
        if self.CurrentTab ~= tab then tween(btn, 0.15, { BackgroundTransparency = 0.5 }):Play() end
    end)
    btn.MouseLeave:Connect(function()
        if self.CurrentTab ~= tab then tween(btn, 0.15, { BackgroundTransparency = 1 }):Play() end
    end)
    btn.Activated:Connect(function() self:SelectTab(tab) end)

    table.insert(self.Tabs, tab)
    if not self.CurrentTab then self:SelectTab(tab) end
    return tab
end

function GoldLib:SelectTab(tab)
    if self.CurrentTab == tab then return end
    for _, t in ipairs(self.Tabs) do
        t.Page.Visible = false
        tween(t.Button, 0.15, { BackgroundTransparency = 1 }):Play()
        tween(t.Label, 0.15, { TextColor3 = GoldLib.Theme.SubText }):Play()
        tween(t.Icon, 0.15, { TextColor3 = GoldLib.Theme.SubText }):Play()
        tween(t.Indicator, 0.15, { Size = UDim2.new(0, 3, 0, 0) }):Play()
    end
    tab.Page.Visible = true
    tween(tab.Button, 0.15, { BackgroundTransparency = 0 }):Play()
    tab.Button.BackgroundColor3 = GoldLib.Theme.Element
    tween(tab.Label, 0.15, { TextColor3 = GoldLib.Theme.Text }):Play()
    tween(tab.Icon, 0.15, { TextColor3 = GoldLib.Theme.Accent }):Play()
    tween(tab.Indicator, 0.15, { Size = UDim2.new(0, 3, 0, 18) }):Play()
    self.CurrentTab = tab
end

-- ═══════════════════════════════════════════════════════════════════
--                     🧩 Elements
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:AddSection(tab, text)
    return create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = "▸ " .. text:upper(),
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = tab.Page
    })
end

function GoldLib:AddLabel(tab, text)
    local lbl = create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundColor3 = GoldLib.Theme.Card,
        Text = "  " .. text,
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Parent = tab.Page
    })
    corner(lbl, GoldLib.Theme.CornerRadius)
    return lbl
end

function GoldLib:AddDivider(tab)
    return create("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = GoldLib.Theme.Stroke,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
end

-- ═══════════════ Button ═══════════════
function GoldLib:AddButton(tab, label, callback, color, icon)
    color = color or GoldLib.Theme.Accent
    local el = { enabled = true }
    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = color,
        Text = icon and (icon .. "  " .. label) or label,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Active = true,
        AutoButtonColor = false,
        Parent = tab.Page
    })
    corner(btn, GoldLib.Theme.CornerRadius)

    btn.MouseEnter:Connect(function()
        tween(btn, 0.15, { BackgroundColor3 = color:Lerp(Color3.new(1, 1, 1), 0.2) }):Play()
    end)
    btn.MouseLeave:Connect(function()
        tween(btn, 0.15, { BackgroundColor3 = color }):Play()
    end)
    btn.Activated:Connect(function()
        if not el.enabled then return end
        if callback then pcall(callback) end
    end)

    el.SetEnabled = function(s)
        el.enabled = s
        btn.BackgroundTransparency = s and 0 or 0.5
    end
    el.SetColor = function(c)
        color = c
        btn.BackgroundColor3 = c
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Toggle ═══════════════
function GoldLib:AddToggle(tab, label, default, flag, callback)
    local state = default or false
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    -- Toggle switch
    local switch = create("Frame", {
        Size = UDim2.new(0, 38, 0, 20),
        Position = UDim2.new(1, -50, 0.5, -10),
        BackgroundColor3 = state and GoldLib.Theme.Accent or GoldLib.Theme.Element,
        BorderSizePixel = 0,
        Parent = c
    })
    corner(switch, 10)
    local swStroke = stroke(switch, state and GoldLib.Theme.Accent or GoldLib.Theme.Stroke, 1)

    local knob = create("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = state and UDim2.new(0, 20, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = switch
    })
    corner(knob, 8)

    local hit = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        Parent = c
    })

    local function setState(v)
        state = v
        tween(switch, 0.2, {
            BackgroundColor3 = state and GoldLib.Theme.Accent or GoldLib.Theme.Element
        }):Play()
        tween(knob, 0.2, {
            Position = state and UDim2.new(0, 20, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }):Play()
        if flag then GoldLib.Flags[flag] = state end
        if callback then pcall(callback, state) end
    end

    hit.Activated:Connect(function()
        if not el.enabled then return end
        setState(not state)
    end)

    el.Set = setState
    el.Get = function() return state end
    el.SetEnabled = function(s)
        el.enabled = s
        c.BackgroundTransparency = s and 0 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ SLIDER (مثل الصورة) ═══════════════
function GoldLib:AddSlider(tab, label, min, max, default, flag, callback)
    min = min or 0
    max = max or 100
    default = default or min
    local state = default
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 0, 18),
        Position = UDim2.new(0, 12, 0, 6),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local valueLbl = create("TextLabel", {
        Size = UDim2.new(0, 60, 0, 18),
        Position = UDim2.new(1, -72, 0, 6),
        BackgroundTransparency = 1,
        Text = tostring(state),
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = c
    })

    -- ✅ Slider Bar (بالضبط مثل الصورة)
    local barBg = create("Frame", {
        Size = UDim2.new(1, -24, 0, 16),
        Position = UDim2.new(0, 12, 0, 26),
        BackgroundColor3 = Color3.fromRGB(30, 40, 40),
        BorderSizePixel = 0,
        Parent = c
    })
    corner(barBg, 8)

    -- Fill (أخضر داكن)
    local fill = create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = GoldLib.Theme.Accent,
        BorderSizePixel = 0,
        Parent = barBg
    })
    corner(fill, 8)

    -- Knob (أبيض بيضاوي)
    local knob = create("Frame", {
        Size = UDim2.new(0, 26, 0, 16),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = barBg
    })
    corner(knob, 8)

    local hit = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        ZIndex = 3,
        Parent = barBg
    })

    local function updateFromX(absX)
        local rel = math.clamp((absX - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1)
        local val = round(min + (max - min) * rel, 2)
        state = val
        local pos = UDim2.new(rel, -13, 0, 0)
        local fsize = UDim2.new(rel, 0, 1, 0)
        tween(fill, 0.05, { Size = fsize }):Play()
        tween(knob, 0.05, { Position = pos }):Play()
        valueLbl.Text = tostring(val)
        if flag then GoldLib.Flags[flag] = val end
        if callback then pcall(callback, val) end
    end

    local dragging = false
    hit.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            if not el.enabled then return end
            dragging = true
            updateFromX(inp.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
        or inp.UserInputType == Enum.UserInputType.Touch) then
            updateFromX(inp.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    local function setValue(v)
        v = math.clamp(v, min, max)
        local rel = (v - min) / (max - min)
        state = v
        fill.Size = UDim2.new(rel, 0, 1, 0)
        knob.Position = UDim2.new(rel, -13, 0, 0)
        valueLbl.Text = tostring(v)
        if flag then GoldLib.Flags[flag] = v end
        if callback then pcall(callback, v) end
    end

    setValue(default)

    el.Set = setValue
    el.Get = function() return state end
    el.SetEnabled = function(s)
        el.enabled = s
        c.BackgroundTransparency = s and 0 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Dropdown ═══════════════
function GoldLib:AddDropdown(tab, label, options, default, flag, callback)
    options = options or {}
    local selected = default or options[1]
    local el = { enabled = true, flag = flag, value = selected }
    local isOpen = false

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    local header = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        Parent = c
    })

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })

    local selLbl = create("TextLabel", {
        Size = UDim2.new(0, 100, 1, 0),
        Position = UDim2.new(1, -112, 0, 0),
        BackgroundTransparency = 1,
        Text = selected,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = header
    })

    local arrow = create("TextLabel", {
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -20, 0, 0),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        Parent = header
    })

    local list = create("ScrollingFrame", {
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.new(0, 10, 0, 34),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = c
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = list })

    local function refresh()
        for _, ch in ipairs(list:GetChildren()) do
            if ch:IsA("TextButton") then ch:Destroy() end
        end
        for _, opt in ipairs(options) do
            local btn = create("TextButton", {
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = opt == selected and GoldLib.Theme.Accent or GoldLib.Theme.Element,
                Text = opt,
                TextColor3 = opt == selected and Color3.new(1, 1, 1) or GoldLib.Theme.Text,
                TextSize = 11,
                Font = Enum.Font.Gotham,
                BorderSizePixel = 0,
                Parent = list
            })
            corner(btn, 4)
            btn.Activated:Connect(function()
                selected = opt
                el.value = opt
                selLbl.Text = opt
                if flag then GoldLib.Flags[flag] = opt end
                if callback then pcall(callback, opt) end
                refresh()
            end)
        end
    end
    refresh()

    header.Activated:Connect(function()
        if not el.enabled then return end
        isOpen = not isOpen
        arrow.Text = isOpen and "▲" or "▼"
        local targetHeight = isOpen and (34 + math.min(#options * 26, 120)) or 34
        tween(c, 0.2, { Size = UDim2.new(1, 0, 0, targetHeight) }):Play()
    end)

    el.Set = function(v)
        selected = v
        el.value = v
        selLbl.Text = v
        if flag then GoldLib.Flags[flag] = v end
        if callback then pcall(callback, v) end
        refresh()
    end
    el.Get = function() return selected end
    el.SetEnabled = function(s)
        el.enabled = s
        header.BackgroundTransparency = s and 1 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Textbox ═══════════════
function GoldLib:AddTextbox(tab, label, placeholder, default, flag, callback)
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    create("TextLabel", {
        Size = UDim2.new(1, -24, 0, 16),
        Position = UDim2.new(0, 12, 0, 4),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.SubText,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local box = create("TextBox", {
        Size = UDim2.new(1, -24, 0, 24),
        Position = UDim2.new(0, 12, 0, 22),
        BackgroundColor3 = GoldLib.Theme.Element,
        Text = default or "",
        PlaceholderText = placeholder or "",
        PlaceholderColor3 = GoldLib.Theme.SubText,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        Parent = c
    })
    corner(box, 4)
    stroke(box, GoldLib.Theme.Stroke, 1)

    box.FocusLost:Connect(function()
        if flag then GoldLib.Flags[flag] = box.Text end
        if callback then pcall(callback, box.Text) end
    end)

    el.Set = function(v)
        box.Text = tostring(v)
        if flag then GoldLib.Flags[flag] = v end
        if callback then pcall(callback, v) end
    end
    el.Get = function() return box.Text end
    el.SetEnabled = function(s)
        el.enabled = s
        box.TextEditable = s
        box.BackgroundTransparency = s and 0 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Keybind ═══════════════
function GoldLib:AddKeybind(tab, label, defaultKey, flag, callback)
    local el = { enabled = true, flag = flag, key = defaultKey or Enum.KeyCode.E }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    create("TextLabel", {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local keyBtn = create("TextButton", {
        Size = UDim2.new(0, 100, 0, 24),
        Position = UDim2.new(1, -112, 0.5, -12),
        BackgroundColor3 = GoldLib.Theme.Element,
        Text = el.key.Name,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = c
    })
    corner(keyBtn, 4)
    stroke(keyBtn, GoldLib.Theme.Stroke, 1)

    local listening = false
    keyBtn.Activated:Connect(function()
        if not el.enabled then return end
        listening = true
        keyBtn.Text = "..."
    end)

    UserInputService.InputBegan:Connect(function(inp, gp)
        if listening and not gp then
            if inp.UserInputType == Enum.UserInputType.Keyboard then
                el.key = inp.KeyCode
                keyBtn.Text = inp.KeyCode.Name
                listening = false
                if flag then GoldLib.Flags[flag] = inp.KeyCode.Name end
            end
        elseif inp.KeyCode == el.key and not gp and el.enabled then
            if callback then pcall(callback) end
        end
    end)

    el.Set = function(k)
        el.key = k
        keyBtn.Text = k.Name
        if flag then GoldLib.Flags[flag] = k.Name end
    end
    el.Get = function() return el.key end
    el.SetEnabled = function(s)
        el.enabled = s
        c.BackgroundTransparency = s and 0 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Color Picker (Element) ═══════════════
function GoldLib:AddColorPicker(tab, label, defaultColor, flag, callback)
    local state = defaultColor or Color3.new(1, 1, 1)
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.CornerRadius)

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local preview = create("TextButton", {
        Size = UDim2.new(0, 60, 0, 20),
        Position = UDim2.new(1, -72, 0.5, -10),
        BackgroundColor3 = state,
        Text = "",
        BorderSizePixel = 0,
        Parent = c
    })
    corner(preview, 4)
    stroke(preview, GoldLib.Theme.Stroke, 1)

    preview.Activated:Connect(function()
        if not el.enabled then return end
        GoldLib:OpenThemeEditor()
    end)

    el.Set = function(color)
        state = color
        preview.BackgroundColor3 = color
        if flag then GoldLib.Flags[flag] = tostring(color) end
        if callback then pcall(callback, color) end
    end
    el.Get = function() return state end
    el.SetEnabled = function(s)
        el.enabled = s
        c.BackgroundTransparency = s and 0 or 0.5
    end
    table.insert(GoldLib.Elements, el)
    return el
end

return GoldLib
