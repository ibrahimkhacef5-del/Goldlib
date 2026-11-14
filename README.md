<div align="center">

# 🏆 GoldLib v2.0

### مكتبة واجهات Roblox عصرية — تصميم فريد ومبتكر

[![Version](https://img.shields.io/badge/version-2.0-gold?style=for-the-badge)](https://github.com/ibrahimkhacef5-del/Goldlib)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Roblox](https://img.shields.io/badge/Roblox-Compatible-red?style=for-the-badge)](https://www.roblox.com)
[![Status](https://img.shields.io/badge/status-stable-green?style=for-the-badge)]()

**واجهة عصرية بتصميم TopBar + Bottom Tabs + FAB نابض**
**مجانية — مفتوحة المصدر — سهلة الاستخدام**

</div>

---

## 📖 جدول المحتويات

- [المميزات](#-المميزات)
- [التثبيت](#-التثبيت)
- [البدء السريع](#-البدء-السريع)
- [الثيمات المتاحة](#-الثيمات-المتاحة)
- [إنشاء نافذة](#-إنشاء-نافذة)
- [إضافة تبويبات](#-إضافة-تبويبات)
- [العناصر المتاحة](#-العناصر-المتاحة)
- [الإشعارات](#-الإشعارات)
- [الحفظ والتحميل](#-الحفظ-والتحميل)
- [مثال كامل](#-مثال-كامل)
- [الدوال الكاملة](#-الدوال-الكاملة)
- [استكشاف الأخطاء](#-استكشاف-الأخطاء)
- [الترخيص](#-الترخيص)

---

## ✨ المميزات

<table>
<tr>
<td width="50%">

### 🎨 التصميم
- TopBar احترافي
- Bottom Tabs (شكل iOS)
- FAB دائري نابض
- Slider متوهج
- Notifications منسدلة

</td>
<td width="50%">

### ⚡ الوظائف
- 10 ثيمات جاهزة
- 8 عناصر تفاعلية
- حفظ/تحميل تلقائي
- Keybind قابل للتخصيص
- تحديث فوري للثيم

</td>
</tr>
</table>

---

## 🚀 التثبيت

انسخ هذا السطر في بداية سكربتك:

```lua
local GoldLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV2.luau"
))()
```

---

## ⚡ البدء السريع

```lua
-- 1. تحميل المكتبة
local GoldLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV2.luau"
))()

-- 2. اختيار الثيم
GoldLib:SetTheme("Gold")

-- 3. إنشاء نافذة
local Window = GoldLib.new({
    Title     = "My Hub",
    Subtitle  = "v1.0",
    Icon      = "🏆",
    ToggleKey = Enum.KeyCode.RightShift,
    Size      = UDim2.new(0, 360, 0, 300),
})

-- 4. إضافة تبويب
local MainTab = Window:AddTab("Main", "🏠")

-- 5. إضافة زر
GoldLib:AddButton(MainTab, "Click Me", function()
    GoldLib:Notify({ Title = "✅", Content = "Clicked!", Duration = 2 })
end, Color3.fromRGB(255, 200, 60), "✨")
```

---

## 🎨 الثيمات المتاحة

<table>
<tr>
<th>الثيم</th>
<th>الوصف</th>
<th>الألوان</th>
</tr>
<tr>
<td><code>Gold</code></td>
<td>ذهبي داكن (افتراضي)</td>
<td>🟡 ⚫</td>
</tr>
<tr>
<td><code>Midnight</code></td>
<td>أزرق ليلي</td>
<td>🔵 ⚫</td>
</tr>
<tr>
<td><code>Cyber</code></td>
<td>نيون سيبربانك</td>
<td>🟢 🟣</td>
</tr>
<tr>
<td><code>Rose</code></td>
<td>وردي أنيق</td>
<td>🌸 ⚫</td>
</tr>
<tr>
<td><code>Forest</code></td>
<td>أخضر غابة</td>
<td>🟢 ⚫</td>
</tr>
<tr>
<td><code>Ocean</code></td>
<td>أزرق محيط</td>
<td>🌊 ⚫</td>
</tr>
<tr>
<td><code>Sunset</code></td>
<td>برتقالي غروب</td>
<td>🟠 ⚫</td>
</tr>
<tr>
<td><code>Mono</code></td>
<td>أبيض/أسود</td>
<td>⚪ ⚫</td>
</tr>
<tr>
<td><code>Candy</code></td>
<td>وردي فاتح</td>
<td>🌸 ⚪</td>
</tr>
<tr>
<td><code>iOS</code></td>
<td>أزرق iOS</td>
<td>🔵 ⚪</td>
</tr>
</table>

**طريقة التغيير:**
```lua
GoldLib:SetTheme("Cyber")
```

---

## 🪟 إنشاء نافذة

```lua
local Window = GoldLib.new({
    Title     = "My Hub",                 -- اسم النافذة
    Subtitle  = "v1.0",                   -- الإصدار
    Icon      = "🏆",                     -- الأيقونة
    ToggleKey = Enum.KeyCode.RightShift,  -- اختصار
    Size      = UDim2.new(0, 360, 0, 300),-- الحجم
})
```

### شرح الحقول

| الحقل | النوع | الوصف |
|:---|:---:|:---|
| `Title` | `string` | اسم النافذة |
| `Subtitle` | `string` | الإصدار أو الوصف |
| `Icon` | `string` | إيموجي في الدائرة |
| `ToggleKey` | `Enum.KeyCode` | زر فتح/إغلاق |
| `Size` | `UDim2` | العرض × الارتفاع |

### أحجام مقترحة

| الغرض | الحجم |
|:---|:---|
| صغير جداً | `UDim2.new(0, 300, 0, 260)` |
| صغير (افتراضي) | `UDim2.new(0, 360, 0, 300)` |
| متوسط | `UDim2.new(0, 420, 0, 340)` |
| كبير | `UDim2.new(0, 500, 0, 400)` |

---

## 📑 إضافة تبويبات

```lua
local MainTab     = Window:AddTab("Main",     "🏠")
local PlayerTab   = Window:AddTab("Player",   "👤")
local SettingsTab = Window:AddTab("Settings", "⚙️")
```

> 💡 **الحد الأقصى الموصى به:** 4 تبويبات

---

## 🧩 العناصر المتاحة

### 1️⃣ Section — عنوان قسم

```lua
GoldLib:AddSection(MainTab, "Movement")
```

**النتيجة:** `◈ MOVEMENT`

---

### 2️⃣ Label — نص بسيط

```lua
GoldLib:AddLabel(MainTab, "Version 1.0")
```

---

### 3️⃣ Button — زر

```lua
GoldLib:AddButton(
    MainTab,                       -- التبويب
    "Click Me",                    -- النص
    function()                     -- الدالة
        print("Clicked!")
    end,
    Color3.fromRGB(255, 200, 60),  -- اللون (اختياري)
    "✨"                           -- الأيقونة (اختياري)
)
```

---

### 4️⃣ Toggle — مفتاح تشغيل/إيقاف

```lua
GoldLib:AddToggle(
    MainTab,              -- التبويب
    "Infinite Jump",      -- النص
    false,                -- الحالة الافتراضية
    "InfJump",            -- اسم للحفظ
    function(state)       -- الدالة
        if state then
            print("مفعّل")
        else
            print("موقوف")
        end
    end
)
```

**⚠️ مهم:** احفظ الـ Connection:

```lua
local conn
GoldLib:AddToggle(MainTab, "Infinite Jump", false, "InfJump", function(s)
    if s then
        conn = game:GetService("UserInputService").JumpRequest:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    else
        if conn then conn:Disconnect() end
    end
end)
```

---

### 5️⃣ Slider — شريط تمرير ✨

```lua
GoldLib:AddSlider(
    MainTab,           -- التبويب
    "WalkSpeed",       -- النص
    16,                -- الحد الأدنى
    300,               -- الحد الأقصى
    16,                -- القيمة الافتراضية
    "Speed",           -- اسم للحفظ
    function(value)    -- الدالة
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
)
```

---

### 6️⃣ Dropdown — قائمة منسدلة

```lua
GoldLib:AddDropdown(
    SettingsTab,                          -- التبويب
    "Select Theme",                       -- النص
    {"Gold", "Cyber", "Rose", "Ocean"},   -- الخيارات
    "Gold",                               -- الافتراضي
    "Theme",                              -- اسم للحفظ
    function(selected)                    -- الدالة
        GoldLib:SetTheme(selected)
    end
)
```

---

### 7️⃣ Textbox — مربع نص

```lua
GoldLib:AddTextbox(
    PlayerTab,             -- التبويب
    "Player Name",         -- النص
    "Enter name...",       -- Placeholder
    "",                    -- الافتراضي
    "TargetPlayer",        -- اسم للحفظ
    function(text)         -- الدالة
        print("Entered:", text)
    end
)
```

---

### 8️⃣ Keybind — اختصار لوحة مفاتيح

```lua
GoldLib:AddKeybind(
    SettingsTab,          -- التبويب
    "Toggle Fly",         -- النص
    Enum.KeyCode.F,       -- المفتاح الافتراضي
    "FlyKey",             -- اسم للحفظ
    function()            -- الدالة
        print("F pressed!")
    end
)
```

---

## 🔔 الإشعارات

```lua
GoldLib:Notify({
    Title    = "✅ Success",
    Content  = "Operation completed",
    Duration = 3,
    Color    = GoldLib.Theme.Success,
})
```

### ألوان جاهزة

```lua
-- Success (أخضر)
Color = GoldLib.Theme.Success

-- Danger (أحمر)
Color = GoldLib.Theme.Danger

-- Accent (افتراضي)
Color = GoldLib.Theme.Accent
```

---

## 💾 الحفظ والتحميل

```lua
-- حفظ
GoldLib:SaveConfig("my_config.json")

-- تحميل
GoldLib:LoadConfig("my_config.json")
```

### كيف يعمل؟

كل عنصر له `flag` (اسم فريد). المكتبة تحفظ قيمة كل عنصر في ملف JSON.

**مثال:**
```
قبل: Speed = 100, InfJump = true
ملف: { "Speed": 100, "InfJump": true }
بعد: Speed يعود 100, InfJump يعود مفعّل
```

> ⚠️ يحتاج المنفذ يدعم `writefile` (Delta, Xeno, Solara)

---

## 📱 مثال كامل

```lua
local GoldLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV2.luau"
))()

GoldLib:SetTheme("Gold")

local Window = GoldLib.new({
    Title = "Gold Hub", Subtitle = "v2.0", Icon = "🏆",
    ToggleKey = Enum.KeyCode.RightShift,
    Size = UDim2.new(0, 360, 0, 300),
})

local MainTab     = Window:AddTab("Main",     "🏠")
local PlayerTab   = Window:AddTab("Player",   "👤")
local SettingsTab = Window:AddTab("Settings", "⚙️")

-- Main
GoldLib:AddSection(MainTab, "Movement")

GoldLib:AddSlider(MainTab, "WalkSpeed", 16, 300, 16, "Speed", function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = v
    end
end)

local conn
GoldLib:AddToggle(MainTab, "Infinite Jump", false, "InfJump", function(s)
    if s then
        conn = game:GetService("UserInputService").JumpRequest:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    else
        if conn then conn:Disconnect() end
    end
end)

GoldLib:AddButton(MainTab, "Reset", function()
    local char = game.Players.LocalPlayer.Character
    if char then char:BreakJoints() end
end, Color3.fromRGB(255, 140, 60), "🔄")

-- Player
GoldLib:AddSection(PlayerTab, "Teleport")

GoldLib:AddTextbox(PlayerTab, "Player Name", "Enter...", "", "Target", function(name)
    local target = game.Players:FindFirstChild(name)
    local char = game.Players.LocalPlayer.Character
    if target and target.Character and char then
        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)

-- Settings
GoldLib:AddSection(SettingsTab, "Theme")

GoldLib:AddDropdown(SettingsTab, "Theme",
    {"Gold", "Cyber", "Rose", "Ocean"}, "Gold", "Theme",
    function(name) GoldLib:SetTheme(name) end)

GoldLib:AddButton(SettingsTab, "Save", function()
    GoldLib:SaveConfig("config.json")
end, Color3.fromRGB(80, 200, 120), "💾")

GoldLib:AddButton(SettingsTab, "Load", function()
    GoldLib:LoadConfig("config.json")
end, Color3.fromRGB(100, 150, 255), "📂")

task.wait(0.5)
GoldLib:Notify({
    Title = "🏆 Loaded", Content = "Press RightShift", Duration = 4,
})
```

---

## 📊 الدوال الكاملة

<table>
<thead>
<tr>
<th>العنصر</th>
<th>الدالة</th>
<th>يُرجع</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>Window</b></td>
<td><code>GoldLib.new(config)</code></td>
<td>Window</td>
</tr>
<tr>
<td><b>Tab</b></td>
<td><code>Window:AddTab(name, icon)</code></td>
<td>Tab</td>
</tr>
<tr>
<td><b>Section</b></td>
<td><code>GoldLib:AddSection(tab, text)</code></td>
<td>Label</td>
</tr>
<tr>
<td><b>Label</b></td>
<td><code>GoldLib:AddLabel(tab, text)</code></td>
<td>Label</td>
</tr>
<tr>
<td><b>Button</b></td>
<td><code>GoldLib:AddButton(tab, label, callback, color, icon)</code></td>
<td><code>{SetEnabled}</code></td>
</tr>
<tr>
<td><b>Toggle</b></td>
<td><code>GoldLib:AddToggle(tab, label, default, flag, callback)</code></td>
<td><code>{Set, Get, SetEnabled}</code></td>
</tr>
<tr>
<td><b>Slider</b></td>
<td><code>GoldLib:AddSlider(tab, label, min, max, default, flag, callback)</code></td>
<td><code>{Set, Get, SetEnabled}</code></td>
</tr>
<tr>
<td><b>Dropdown</b></td>
<td><code>GoldLib:AddDropdown(tab, label, options, default, flag, callback)</code></td>
<td><code>{Set, Get, SetEnabled}</code></td>
</tr>
<tr>
<td><b>Textbox</b></td>
<td><code>GoldLib:AddTextbox(tab, label, placeholder, default, flag, callback)</code></td>
<td><code>{Set, Get, SetEnabled}</code></td>
</tr>
<tr>
<td><b>Keybind</b></td>
<td><code>GoldLib:AddKeybind(tab, label, defaultKey, flag, callback)</code></td>
<td><code>{SetEnabled}</code></td>
</tr>
<tr>
<td><b>Notify</b></td>
<td><code>GoldLib:Notify(config)</code></td>
<td>—</td>
</tr>
<tr>
<td><b>Save</b></td>
<td><code>GoldLib:SaveConfig(file)</code></td>
<td>—</td>
</tr>
<tr>
<td><b>Load</b></td>
<td><code>GoldLib:LoadConfig(file)</code></td>
<td>—</td>
</tr>
<tr>
<td><b>Theme</b></td>
<td><code>GoldLib:SetTheme(name)</code></td>
<td>boolean</td>
</tr>
</tbody>
</table>

---

## 🐛 استكشاف الأخطاء

<table>
<thead>
<tr>
<th>المشكلة</th>
<th>الحل</th>
</tr>
</thead>
<tbody>
<tr>
<td>الواجهة لا تظهر</td>
<td>تأكد أن <code>loadstring</code> مفعّل</td>
</tr>
<tr>
<td><code>writefile</code> لا يعمل</td>
<td>استخدم Delta / Xeno / Solara</td>
</tr>
<tr>
<td>FAB ثابت</td>
<td>حرّكه بـ <code>Window.FAB.Position</code></td>
</tr>
<tr>
<td>خطأ <code>:Set</code></td>
<td>احفظ العنصر في متغير أولاً</td>
</tr>
<tr>
<td>الواجهة تختفي بعد الموت</td>
<td>طبيعي — بسبب <code>ResetOnSpawn</code></td>
</tr>
</tbody>
</table>

---

## 📜 الترخيص

<div align="center">

**MIT License** — مجاني للاستخدام الشخصي والتجاري
**مفتوح المصدر** — يمكنك تعديله بحرية
**لا يُنسب** إلى ZHAVA أو Delta

</div>

---

<div align="center">

### 🏆 GoldLib v2.0

**صُنع بشغف ✨**

[⬆ العودة للأعلى](#-goldlib-v20)

</div>
