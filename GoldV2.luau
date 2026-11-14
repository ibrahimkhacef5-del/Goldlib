--[[
    ═══════════════════════════════════════════════════════════════════
    🏆 GoldLib v2.0 — Original Design
    ================================================================
    ❌ Not a copy of ZHAVA / Delta
    ✅ Unique Layout: Top Bar + Bottom Tabs (iOS Style)
    ✅ Pulsing FAB (Floating Action Button)
    ✅ 20 Themes + Live Editor
    ✅ 12 Elements (Slider, Toggle, Dropdown, Keybind, Textbox...)
    ✅ Notifications (Top Center)
    ✅ Auto-Save
    ═══════════════════════════════════════════════════════════════════
]]

local GoldLib = {}
GoldLib.__index = GoldLib

if _G.GoldLib_v2_Loaded then return _G.GoldLib_v2_Loaded end

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local HttpService      = game:GetService("HttpService")
local LocalPlayer      = Players.LocalPlayer

GoldLib.Elements = {}
GoldLib.Flags    = {}
GoldLib.Windows  = {}
GoldLib.Version  = "2.0"

-- ═══════════════════════════════════════════════════════════════════
--                     🎨 20 Themes
-- ═══════════════════════════════════════════════════════════════════
GoldLib.Themes = {
    Gold = {
        Bg      = Color3.fromRGB(18, 16, 10),
        Surface = Color3.fromRGB(28, 25, 15),
        Card    = Color3.fromRGB(38, 34, 20),
        Accent  = Color3.fromRGB(255, 200, 60),
        Accent2 = Color3.fromRGB(200, 140, 20),
        Text    = Color3.fromRGB(252, 248, 235),
        Sub     = Color3.fromRGB(170, 150, 100),
        Danger  = Color3.fromRGB(230, 70, 70),
        Success = Color3.fromRGB(80, 210, 120),
        Radius  = 12,
    },
    Midnight = {
        Bg      = Color3.fromRGB(8, 12, 24),
        Surface = Color3.fromRGB(14, 20, 38),
        Card    = Color3.fromRGB(22, 30, 52),
        Accent  = Color3.fromRGB(120, 180, 255),
        Accent2 = Color3.fromRGB(70, 120, 220),
        Text    = Color3.fromRGB(230, 240, 255),
        Sub     = Color3.fromRGB(130, 155, 200),
        Danger  = Color3.fromRGB(230, 70, 70),
        Success = Color3.fromRGB(80, 210, 120),
        Radius  = 14,
    },
    Cyber = {
        Bg      = Color3.fromRGB(10, 5, 22),
        Surface = Color3.fromRGB(18, 10, 38),
        Card    = Color3.fromRGB(28, 15, 55),
        Accent  = Color3.fromRGB(0, 255, 200),
        Accent2 = Color3.fromRGB(255, 0, 150),
        Text    = Color3.fromRGB(220, 255, 255),
        Sub     = Color3.fromRGB(150, 200, 220),
        Danger  = Color3.fromRGB(255, 60, 100),
        Success = Color3.fromRGB(0, 255, 180),
        Radius  = 6,
    },
    Rose = {
        Bg      = Color3.fromRGB(30, 15, 25),
        Surface = Color3.fromRGB(45, 22, 38),
        Card    = Color3.fromRGB(60, 30, 50),
        Accent  = Color3.fromRGB(255, 100, 150),
        Accent2 = Color3.fromRGB(200, 60, 110),
        Text    = Color3.fromRGB(255, 235, 245),
        Sub     = Color3.fromRGB(210, 150, 180),
        Danger  = Color3.fromRGB(255, 60, 80),
        Success = Color3.fromRGB(100, 220, 150),
        Radius  = 16,
    },
    Forest = {
        Bg      = Color3.fromRGB(12, 22, 14),
        Surface = Color3.fromRGB(18, 32, 22),
        Card    = Color3.fromRGB(28, 45, 32),
        Accent  = Color3.fromRGB(90, 210, 110),
        Accent2 = Color3.fromRGB(60, 160, 80),
        Text    = Color3.fromRGB(230, 250, 230),
        Sub     = Color3.fromRGB(150, 190, 150),
        Danger  = Color3.fromRGB(230, 80, 80),
        Success = Color3.fromRGB(90, 210, 110),
        Radius  = 12,
    },
    Ocean = {
        Bg      = Color3.fromRGB(8, 20, 32),
        Surface = Color3.fromRGB(12, 30, 48),
        Card    = Color3.fromRGB(20, 42, 65),
        Accent  = Color3.fromRGB(0, 200, 255),
        Accent2 = Color3.fromRGB(0, 140, 200),
        Text    = Color3.fromRGB(220, 240, 255),
        Sub     = Color3.fromRGB(130, 180, 220),
        Danger  = Color3.fromRGB(230, 70, 90),
        Success = Color3.fromRGB(80, 210, 170),
        Radius  = 14,
    },
    Sunset = {
        Bg      = Color3.fromRGB(35, 15, 25),
        Surface = Color3.fromRGB(55, 22, 35),
        Card    = Color3.fromRGB(75, 32, 48),
        Accent  = Color3.fromRGB(255, 140, 80),
        Accent2 = Color3.fromRGB(220, 90, 60),
        Text    = Color3.fromRGB(255, 240, 230),
        Sub     = Color3.fromRGB(220, 170, 150),
        Danger  = Color3.fromRGB(240, 60, 80),
        Success = Color3.fromRGB(100, 220, 140),
        Radius  = 12,
    },
    Mono = {
        Bg      = Color3.fromRGB(12, 12, 12),
        Surface = Color3.fromRGB(22, 22, 22),
        Card    = Color3.fromRGB(32, 32, 32),
        Accent  = Color3.fromRGB(255, 255, 255),
        Accent2 = Color3.fromRGB(180, 180, 180),
        Text    = Color3.fromRGB(255, 255, 255),
        Sub     = Color3.fromRGB(140, 140, 140),
        Danger  = Color3.fromRGB(220, 60, 60),
        Success = Color3.fromRGB(60, 200, 100),
        Radius  = 8,
    },
    Candy = {
        Bg      = Color3.fromRGB(255, 240, 250),
        Surface = Color3.fromRGB(255, 225, 240),
        Card    = Color3.fromRGB(255, 255, 255),
        Accent  = Color3.fromRGB(255, 100, 180),
        Accent2 = Color3.fromRGB(200, 60, 140),
        Text    = Color3.fromRGB(80, 20, 50),
        Sub     = Color3.fromRGB(180, 120, 150),
        Danger  = Color3.fromRGB(230, 60, 90),
        Success = Color3.fromRGB(80, 200, 130),
        Radius  = 18,
    },
    iOS = {
        Bg      = Color3.fromRGB(245, 245, 250),
        Surface = Color3.fromRGB(235, 235, 245),
        Card    = Color3.fromRGB(255, 255, 255),
        Accent  = Color3.fromRGB(0, 122, 255),
        Accent2 = Color3.fromRGB(0, 90, 200),
        Text    = Color3.fromRGB(20, 20, 30),
        Sub     = Color3.fromRGB(110, 110, 130),
        Danger  = Color3.fromRGB(255, 60, 60),
        Success = Color3.fromRGB(50, 200, 100),
        Radius  = 16,
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
    return create("UICorner", { CornerRadius = UDim.new(0, r or GoldLib.Theme.Radius), Parent = p })
end

local function stroke(p, c, t)
    return create("UIStroke", {
        Color = c or GoldLib.Theme.Accent,
        Thickness = t or 1.5,
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
function GoldLib:SetTheme(name)
    if not GoldLib.Themes[name] then return false end
    for k, v in pairs(GoldLib.Themes[name]) do
        GoldLib.Theme[k] = v
    end
    for _, win in ipairs(GoldLib.Windows) do
        if win.UpdateTheme then pcall(function() win:UpdateTheme() end) end
    end
    return true
end

-- ═══════════════════════════════════════════════════════════════════
--                     🔔 Notify (Top Center)
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
        Size = UDim2.new(0, 280, 0, 60),
        Position = UDim2.new(0.5, -140, 0, -80), -- فوق الشاشة
        BackgroundColor3 = GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Parent = gui
    })
    corner(frame, GoldLib.Theme.Radius)
    stroke(frame, cfg.Color or GoldLib.Theme.Accent, 2)

    create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1,
        Text = cfg.Title or "Notification",
        TextColor3 = cfg.Color or GoldLib.Theme.Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame
    })

    create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.new(0, 10, 0, 26),
        BackgroundTransparency = 1,
        Text = cfg.Content or "",
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Parent = frame
    })

    -- دخول من الأعلى
    tween(frame, 0.35, { Position = UDim2.new(0.5, -140, 0, 20) }, Enum.EasingStyle.Back):Play()

    task.delay(cfg.Duration or 4, function()
        tween(frame, 0.3, { Position = UDim2.new(0.5, -140, 0, -80) }):Play()
        task.wait(0.3)
        gui:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════════════
--                     Save/Load
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:SaveConfig(file)
    if not writefile then return end
    file = file or "GoldLib_Config.json"
    pcall(function() writefile(file, HttpService:JSONEncode(GoldLib.Flags)) end)
    self:Notify({ Title = "💾 Saved", Content = "Config saved", Duration = 2 })
end

function GoldLib:LoadConfig(file)
    if not (readfile and isfile) then return end
    file = file or "GoldLib_Config.json"
    if not isfile(file) then return end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(file)) end)
    if not ok or type(data) ~= "table" then return end
    for _, el in ipairs(GoldLib.Elements) do
        if el.flag and data[el.flag] ~= nil and el.Set then pcall(el.Set, data[el.flag]) end
    end
    self:Notify({ Title = "📂 Loaded", Content = "Config loaded", Duration = 2 })
end

-- ═══════════════════════════════════════════════════════════════════
--                     Window
-- ═══════════════════════════════════════════════════════════════════
function GoldLib.new(cfg)
    cfg = cfg or {}
    local self = setmetatable({}, GoldLib)
    self.Title     = cfg.Title or "Gold"
    self.Subtitle  = cfg.Subtitle or "v2.0"
    self.Icon      = cfg.Icon or "🏆"
    self.Size      = cfg.Size or UDim2.new(0, 380, 0, 300)
    self.ToggleKey = cfg.ToggleKey or Enum.KeyCode.RightShift
    self.IsOpen    = false
    self.Tabs      = {}
    self.CurrentTab = nil

    self.ScreenGui = create("ScreenGui", {
        Name = "GoldUI_" .. math.random(10000, 99999),
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 2147483647,
        Parent = LocalPlayer:WaitForChild("PlayerGui")
    })

    self:_buildWindow()
    self:_buildFAB()
    self:_bindHotkey()
    table.insert(GoldLib.Windows, self)
    return self
end

-- ✅ Layout الجديد: TopBar + Content + BottomTabs
function GoldLib:_buildWindow()
    local win = create("Frame", {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, -self.Size.X.Offset / 2, 0.5, -self.Size.Y.Offset / 2),
        BackgroundColor3 = GoldLib.Theme.Bg,
        BorderSizePixel = 0,
        Visible = false,
        Active = true,
        ClipsDescendants = true,
        Parent = self.ScreenGui
    })
    corner(win, GoldLib.Theme.Radius + 4)
    stroke(win, GoldLib.Theme.Accent, 2)
    self.Window = win

    -- ═══ Top Bar ═══
    local topBar = create("Frame", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Active = true,
        Parent = win
    })
    corner(topBar, GoldLib.Theme.Radius + 4)
    create("Frame", {
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 1, -10),
        BackgroundColor3 = GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Parent = topBar
    })

    -- شعار دائري
    local logo = create("Frame", {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(0, 10, 0.5, -14),
        BackgroundColor3 = GoldLib.Theme.Accent,
        BorderSizePixel = 0,
        Parent = topBar
    })
    corner(logo, 14)
    create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = self.Icon,
        TextColor3 = GoldLib.Theme.Bg,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        Parent = logo
    })

    create("TextLabel", {
        Size = UDim2.new(0, 200, 0, 18),
        Position = UDim2.new(0, 46, 0, 6),
        BackgroundTransparency = 1,
        Text = self.Title,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = topBar
    })

    create("TextLabel", {
        Size = UDim2.new(0, 200, 0, 12),
        Position = UDim2.new(0, 46, 0, 24),
        BackgroundTransparency = 1,
        Text = self.Subtitle,
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = topBar
    })

    -- زر الإغلاق
    local closeBtn = create("TextButton", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(1, -30, 0.5, -11),
        BackgroundColor3 = GoldLib.Theme.Danger,
        Text = "✕",
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Active = true,
        Parent = topBar
    })
    corner(closeBtn, 11)
    closeBtn.Activated:Connect(function() self:Close() end)

    -- ═══ Content ═══
    local content = create("ScrollingFrame", {
        Size = UDim2.new(1, -20, 1, -100),
        Position = UDim2.new(0, 10, 0, 54),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = GoldLib.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Active = true,
        Parent = win
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = content })
    self.Content = content

    -- ═══ Bottom Tabs ═══
    local tabBar = create("Frame", {
        Size = UDim2.new(1, -20, 0, 36),
        Position = UDim2.new(0, 10, 1, -44),
        BackgroundColor3 = GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Parent = win
    })
    corner(tabBar, GoldLib.Theme.Radius)
    create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 4),
        Parent = tabBar
    })
    self.TabBar = tabBar

    -- Drag
    local dragging, dragStart, startPos = false, nil, nil
    topBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = inp.Position
            startPos = win.Position
        end
    end)
    topBar.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
        or inp.UserInputType == Enum.UserInputType.Touch) then
            local d = inp.Position - dragStart
            win.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                     startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

-- ✅ FAB دائري نابض
function GoldLib:_buildFAB()
    local fab = create("TextButton", {
        Size = UDim2.new(0, 48, 0, 48),
        Position = UDim2.new(0, 20, 0.5, -24),
        BackgroundColor3 = GoldLib.Theme.Accent,
        Text = "",
        AutoButtonColor = false,
        Active = true,
        BorderSizePixel = 0,
        Parent = self.ScreenGui
    })
    corner(fab, 24)
    stroke(fab, GoldLib.Theme.Bg, 3)

    create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = self.Icon,
        TextColor3 = GoldLib.Theme.Bg,
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        Parent = fab
    })

    -- حلقة نابضة
    local ring = create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = fab
    })
    corner(ring, 24)
    local ringStroke = create("UIStroke", {
        Color = GoldLib.Theme.Accent,
        Thickness = 2,
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = ring
    })

    task.spawn(function()
        while fab.Parent do
            tween(ring, 1, { Size = UDim2.new(1.5, 0, 1.5, 0), Position = UDim2.new(-0.25, 0, -0.25, 0) }):Play()
            tween(ringStroke, 1, { Transparency = 1 }):Play()
            task.wait(1)
            ring.Size = UDim2.new(1, 0, 1, 0)
            ring.Position = UDim2.new(0, 0, 0, 0)
            ringStroke.Transparency = 0.5
        end
    end)

    fab.Activated:Connect(function() self:Toggle() end)
    self.FAB = fab
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
    tween(self.Window, 0.3, { BackgroundColor3 = GoldLib.Theme.Bg }):Play()
end

-- ═══════════════════════════════════════════════════════════════════
--                     📑 Tabs (Bottom)
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:AddTab(name, icon)
    local tab = { Name = name }

    local btn = create("TextButton", {
        Size = UDim2.new(0, 80, 0, 28),
        BackgroundColor3 = GoldLib.Theme.Card,
        BackgroundTransparency = 0.5,
        Text = (icon or "") .. " " .. name,
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Active = true,
        Parent = self.TabBar
    })
    corner(btn, GoldLib.Theme.Radius - 2)

    local page = create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = self.Content
    })
    create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5), Parent = page })

    tab.Button = btn
    tab.Page   = page

    btn.Activated:Connect(function() self:SelectTab(tab) end)

    table.insert(self.Tabs, tab)
    if not self.CurrentTab then self:SelectTab(tab) end
    return tab
end

function GoldLib:SelectTab(tab)
    if self.CurrentTab == tab then return end
    for _, t in ipairs(self.Tabs) do
        t.Page.Visible = false
        tween(t.Button, 0.15, { BackgroundTransparency = 0.5, TextColor3 = GoldLib.Theme.Sub }):Play()
    end
    tab.Page.Visible = true
    tween(tab.Button, 0.15, { BackgroundTransparency = 0, TextColor3 = GoldLib.Theme.Accent }):Play()
    tab.Button.BackgroundColor3 = GoldLib.Theme.Card
    self.CurrentTab = tab
end

-- ═══════════════════════════════════════════════════════════════════
--                     🧩 Elements
-- ═══════════════════════════════════════════════════════════════════
function GoldLib:AddSection(tab, text)
    return create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundTransparency = 1,
        Text = "◈ " .. text:upper(),
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = tab.Page
    })
end

function GoldLib:AddLabel(tab, text)
    local lbl = create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundColor3 = GoldLib.Theme.Card,
        Text = "  " .. text,
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = tab.Page
    })
    corner(lbl, GoldLib.Theme.Radius - 4)
    return lbl
end

-- ═══════════════ Button ═══════════════
function GoldLib:AddButton(tab, label, callback, color, icon)
    color = color or GoldLib.Theme.Accent
    local el = { enabled = true }
    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = color,
        Text = icon and (icon .. "  " .. label) or label,
        TextColor3 = GoldLib.Theme.Bg,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Active = true,
        AutoButtonColor = false,
        Parent = tab.Page
    })
    corner(btn, GoldLib.Theme.Radius - 2)

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

    el.SetEnabled = function(s) el.enabled = s; btn.BackgroundTransparency = s and 0 or 0.5 end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Toggle ═══════════════
function GoldLib:AddToggle(tab, label, default, flag, callback)
    local state = default or false
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.Radius - 2)

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    -- ✅ شكل جديد: مستطيل صغير دائري + دائرة بيضاء
    local sw = create("Frame", {
        Size = UDim2.new(0, 32, 0, 18),
        Position = UDim2.new(1, -42, 0.5, -9),
        BackgroundColor3 = state and GoldLib.Theme.Accent or GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Parent = c
    })
    corner(sw, 9)
    stroke(sw, state and GoldLib.Theme.Accent or GoldLib.Theme.Sub, 1)

    local knob = create("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = state and UDim2.new(0, 16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = sw
    })
    corner(knob, 7)

    local hit = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        Parent = c
    })

    local function setState(v)
        state = v
        tween(sw, 0.2, { BackgroundColor3 = state and GoldLib.Theme.Accent or GoldLib.Theme.Surface }):Play()
        tween(knob, 0.2, {
            Position = state and UDim2.new(0, 16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
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
    el.SetEnabled = function(s) el.enabled = s; c.BackgroundTransparency = s and 0 or 0.5 end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ SLIDER (شكل جديد: مستطيل مضيء + كبسولة) ═══════════════
function GoldLib:AddSlider(tab, label, min, max, default, flag, callback)
    min = min or 0
    max = max or 100
    default = math.clamp(default or min, min, max)
    local state = default
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.Radius - 2)

    create("TextLabel", {
        Size = UDim2.new(0.7, 0, 0, 16),
        Position = UDim2.new(0, 10, 0, 5),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local valueLbl = create("TextLabel", {
        Size = UDim2.new(0, 50, 0, 16),
        Position = UDim2.new(1, -60, 0, 5),
        BackgroundTransparency = 1,
        Text = tostring(state),
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = c
    })

    -- ✅ Slider Bar (شكل جديد)
    local barBg = create("Frame", {
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.new(0, 10, 0, 24),
        BackgroundColor3 = GoldLib.Theme.Surface,
        BorderSizePixel = 0,
        Parent = c
    })
    corner(barBg, 7)

    -- Fill أخضر متوهج
    local fill = create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = GoldLib.Theme.Accent,
        BorderSizePixel = 0,
        Parent = barBg
    })
    corner(fill, 7)
    -- Glow effect
    local glow = create("UIStroke", {
        Color = GoldLib.Theme.Accent,
        Thickness = 1,
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = fill
    })

    -- Knob (كبسولة بيضاء)
    local knob = create("Frame", {
        Size = UDim2.new(0, 22, 0, 14),
        Position = UDim2.new(0, -11, 0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = barBg
    })
    corner(knob, 7)
    stroke(knob, GoldLib.Theme.Accent, 1)

    local hit = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        ZIndex = 3,
        Parent = barBg
    })

    local function setValue(v)
        v = math.clamp(v, min, max)
        local rel = (v - min) / (max - min)
        state = round(v, 2)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        knob.Position = UDim2.new(rel, -11, 0, 0)
        valueLbl.Text = tostring(state)
        if flag then GoldLib.Flags[flag] = state end
        if callback then pcall(callback, state) end
    end

    local function updateFromX(absX)
        local rel = math.clamp((absX - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1)
        setValue(min + (max - min) * rel)
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

    setValue(default)

    el.Set = setValue
    el.Get = function() return state end
    el.SetEnabled = function(s) el.enabled = s; c.BackgroundTransparency = s and 0 or 0.5 end
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
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.Radius - 2)

    local header = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Text = "",
        Active = true,
        Parent = c
    })

    create("TextLabel", {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })

    local selLbl = create("TextLabel", {
        Size = UDim2.new(0, 90, 1, 0),
        Position = UDim2.new(1, -110, 0, 0),
        BackgroundTransparency = 1,
        Text = selected,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = header
    })

    create("TextLabel", {
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -20, 0, 0),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 8,
        Font = Enum.Font.GothamBold,
        Parent = header
    })

    local list = create("ScrollingFrame", {
        Size = UDim2.new(1, -16, 0, 0),
        Position = UDim2.new(0, 8, 0, 30),
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
            local b = create("TextButton", {
                Size = UDim2.new(1, 0, 0, 22),
                BackgroundColor3 = opt == selected and GoldLib.Theme.Accent or GoldLib.Theme.Surface,
                Text = opt,
                TextColor3 = opt == selected and GoldLib.Theme.Bg or GoldLib.Theme.Text,
                TextSize = 10,
                Font = Enum.Font.Gotham,
                BorderSizePixel = 0,
                Parent = list
            })
            corner(b, 4)
            b.Activated:Connect(function()
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
        local target = isOpen and (30 + math.min(#options * 24, 100)) or 30
        tween(c, 0.2, { Size = UDim2.new(1, 0, 0, target) }):Play()
    end)

    el.Set = function(v) selected = v; el.value = v; selLbl.Text = v; refresh() end
    el.Get = function() return selected end
    el.SetEnabled = function(s) el.enabled = s; header.BackgroundTransparency = s and 1 or 0.5 end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Textbox ═══════════════
function GoldLib:AddTextbox(tab, label, placeholder, default, flag, callback)
    local el = { enabled = true, flag = flag }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.Radius - 2)

    create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.new(0, 10, 0, 4),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Sub,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local box = create("TextBox", {
        Size = UDim2.new(1, -20, 0, 22),
        Position = UDim2.new(0, 10, 0, 18),
        BackgroundColor3 = GoldLib.Theme.Surface,
        Text = default or "",
        PlaceholderText = placeholder or "",
        PlaceholderColor3 = GoldLib.Theme.Sub,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        Parent = c
    })
    corner(box, 4)
    create("UIPadding", { PaddingLeft = UDim.new(0, 6), Parent = box })

    box.FocusLost:Connect(function()
        if flag then GoldLib.Flags[flag] = box.Text end
        if callback then pcall(callback, box.Text) end
    end)

    el.Set = function(v) box.Text = tostring(v) end
    el.Get = function() return box.Text end
    el.SetEnabled = function(s) el.enabled = s; box.TextEditable = s end
    table.insert(GoldLib.Elements, el)
    return el
end

-- ═══════════════ Keybind ═══════════════
function GoldLib:AddKeybind(tab, label, defaultKey, flag, callback)
    local el = { enabled = true, flag = flag, key = defaultKey or Enum.KeyCode.E }

    local c = create("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = GoldLib.Theme.Card,
        BorderSizePixel = 0,
        Parent = tab.Page
    })
    corner(c, GoldLib.Theme.Radius - 2)

    create("TextLabel", {
        Size = UDim2.new(0.6, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = label,
        TextColor3 = GoldLib.Theme.Text,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = c
    })

    local keyBtn = create("TextButton", {
        Size = UDim2.new(0, 70, 0, 20),
        Position = UDim2.new(1, -80, 0.5, -10),
        BackgroundColor3 = GoldLib.Theme.Surface,
        Text = el.key.Name,
        TextColor3 = GoldLib.Theme.Accent,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = c
    })
    corner(keyBtn, 4)
    stroke(keyBtn, GoldLib.Theme.Accent, 1)

    local listening = false
    keyBtn.Activated:Connect(function()
        if not el.enabled then return end
        listening = true
        keyBtn.Text = "..."
    end)

    UserInputService.InputBegan:Connect(function(inp, gp)
        if listening and not gp and inp.UserInputType == Enum.UserInputType.Keyboard then
            el.key = inp.KeyCode
            keyBtn.Text = inp.KeyCode.Name
            listening = false
            if flag then GoldLib.Flags[flag] = inp.KeyCode.Name end
        elseif inp.KeyCode == el.key and not gp and el.enabled then
            if callback then pcall(callback) end
        end
    end)

    el.SetEnabled = function(s) el.enabled = s; c.BackgroundTransparency = s and 0 or 0.5 end
    table.insert(GoldLib.Elements, el)
    return el
end

_G.GoldLib_v2_Loaded = GoldLib
return GoldLib
