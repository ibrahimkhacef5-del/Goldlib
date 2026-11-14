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

<div align="center">

# 🏆 GoldLib v3.0

### مكتبة واجهات Roblox — الجيل الجديد

[![Version](https://img.shields.io/badge/version-3.0-gold?style=for-the-badge)](https://github.com/ibrahimkhacef5-del/Goldlib)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)
[![Roblox](https://img.shields.io/badge/Roblox-Compatible-red?style=for-the-badge)](https://www.roblox.com)
[![Status](https://img.shields.io/badge/status-stable-green?style=for-the-badge)]()
[![Tabs](https://img.shields.io/badge/Tabs-Unlimited-purple?style=for-the-badge)]()
[![Images](https://img.shields.io/badge/Images-Supported-orange?style=for-the-badge)]()

**TopBar + Glass Tabs + FAB نابض + صور متعددة**
**مجانية — مفتوحة المصدر — سهلة الاستخدام**

</div>

---

## 🆕 ما الجديد في v3.0

<table>
<tr>
<td width="50%">

### ✨ إضافات جديدة
- 🎯 **تبويبات غير محدودة** (سكرول أفقي)
- 🌫️ **Glass Blur** على شريط التبويبات
- 🖼️ **دعم الصور** (Decal / Asset / URL)
- 🎨 **شعار (Logo)** للنافذة
- 🖼️ **صور للأزرار** و Toggles
- 📸 **عنصر Image** جديد

</td>
<td width="50%">

### ⚡ تحسينات
- أداء أسرع
- تصميم أنظف
- كود أبسط
- 10 ثيمات محدّثة
- FAB جديد أنيق
- Notifications أفضل

</td>
</tr>
</table>

---

## 📖 جدول المحتويات

- [المميزات](#-المميزات)
- [التثبيت](#-التثبيت)
- [البدء السريع](#-البدء-السريع)
- [الثيمات](#-الثيمات)
- [الصور](#-الصور)
- [النافذة](#-النافذة)
- [التبويبات](#-التبويبات)
- [العناصر](#-العناصر)
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
- ✅ TopBar احترافي
- ✅ Bottom Tabs (iOS Style)
- ✅ **Glass Blur** على التبويبات
- ✅ **سكرول أفقي لا نهائي**
- ✅ FAB دائري نابض
- ✅ Slider متوهج
- ✅ Notifications منسدلة

</td>
<td width="50%">

### ⚡ الوظائف
- ✅ 10 ثيمات جاهزة
- ✅ 9 عناصر تفاعلية
- ✅ **دعم الصور** (Decal/Asset/URL)
- ✅ حفظ/تحميل تلقائي
- ✅ Keybind قابل للتخصيص
- ✅ تحديث فوري للثيم
- ✅ لوغو مخصص

</td>
</tr>
</table>

---

## 🚀 التثبيت

انسخ هذا السطر في بداية سكربتك:

```lua
local GoldLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV3.luau"
))()
```

---

## ⚡ البدء السريع

```lua
-- 1. تحميل المكتبة
local GoldLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV3.luau"
))()

-- 2. اختيار الثيم
GoldLib:SetTheme("Gold")

-- 3. إنشاء نافذة
local Window = GoldLib.new({
    Title     = "My Hub",
    Subtitle  = "v3.0",
    Icon      = "🏆",
    ToggleKey = Enum.KeyCode.RightShift,
    Size      = UDim2.new(0, 400, 0, 320),
})

-- 4. إضافة تبويب
local MainTab = Window:AddTab("Main", "🏠")

-- 5. إضافة زر
GoldLib:AddButton(MainTab, "Click Me", function()
    GoldLib:Notify({ Title = "✅", Content = "Clicked!", Duration = 2 })
end, Color3.fromRGB(255, 200, 60), "✨")
```

---

## 🎨 الثيمات

<table>
<tr>
<th>الثيم</th>
<th>الوصف</th>
<th>الألوان</th>
</tr>
<tr><td><code>Gold</code></td><td>ذهبي داكن (افتراضي)</td><td>🟡 ⚫</td></tr>
<tr><td><code>Midnight</code></td><td>أزرق ليلي</td><td>🔵 ⚫</td></tr>
<tr><td><code>Cyber</code></td><td>نيون سيبربانك</td><td>🟢 🟣</td></tr>
<tr><td><code>Rose</code></td><td>وردي أنيق</td><td>🌸 ⚫</td></tr>
<tr><td><code>Forest</code></td><td>أخضر غابة</td><td>🟢 ⚫</td></tr>
<tr><td><code>Ocean</code></td><td>أزرق محيط</td><td>🌊 ⚫</td></tr>
<tr><td><code>Sunset</code></td><td>برتقالي غروب</td><td>🟠 ⚫</td></tr>
<tr><td><code>Mono</code></td><td>أبيض/أسود</td><td>⚪ ⚫</td></tr>
<tr><td><code>Candy</code></td><td>وردي فاتح</td><td>🌸 ⚪</td></tr>
<tr><td><code>iOS</code></td><td>أزرق iOS</td><td>🔵 ⚪</td></tr>
</table>

```lua
GoldLib:SetTheme("Cyber")
```

---

## 🖼️ الصور (جديد في v3.0)

المكتبة تدعم **3 أنواع** من الصور:

### 1. Asset ID (رقم مباشر)
```lua
Window:AddTab("Home", nil, 6031075931)
```

### 2. Decal ID (نص رقمي)
```lua
Window:AddTab("Shop", nil, "12345678")
```

### 3. URL كامل
```lua
Window:AddTab("Profile", nil, "rbxthumb://type=Asset&id=6031075931&w=150&h=150")
```

### أين يمكن استخدام الصور؟

<table>
<tr>
<th>المكان</th>
<th>الطريقة</th>
</tr>
<tr>
<td>شعار النافذة</td>
<td><code>LogoImage = 6031075931</code></td>
</tr>
<tr>
<td>أيقونة التبويب</td>
<td><code>Window:AddTab("Name", nil, 6031075931)</code></td>
</tr>
<tr>
<td>صورة على زر</td>
<td><code>GoldLib:AddButton(tab, label, cb, color, nil, 6031075931)</code></td>
</tr>
<tr>
<td>صورة على Toggle</td>
<td><code>GoldLib:AddToggle(tab, label, false, flag, cb, 6031075931)</code></td>
</tr>
<tr>
<td>صورة على Label</td>
<td><code>GoldLib:AddLabel(tab, text, 6031075931)</code></td>
</tr>
<tr>
<td>صورة كاملة</td>
<td><code>GoldLib:AddImage(tab, 6031075931, 120)</code></td>
</tr>
</table>

---

## 🪟 النافذة

```lua
local Window = GoldLib.new({
    Title     = "My Hub",                 -- اسم النافذة
    Subtitle  = "v3.0",                   -- الإصدار
    Icon      = "🏆",                     -- إيموجي (يُستخدم إن لم توجد صورة)
    LogoImage = 6031075931,               -- صورة (اختياري)
    ToggleKey = Enum.KeyCode.RightShift,  -- اختصار
    Size      = UDim2.new(0, 400, 0, 320),-- الحجم
})
```

### شرح الحقول

| الحقل | النوع | الوصف |
|:---|:---:|:---|
| `Title` | `string` | اسم النافذة |
| `Subtitle` | `string` | الإصدار |
| `Icon` | `string` | إيموجي (يُستخدم إن لم توجد صورة) |
| `LogoImage` | `number` أو `string` | صورة الشعار (اختياري) |
| `ToggleKey` | `Enum.KeyCode` | زر فتح/إغلاق |
| `Size` | `UDim2` | العرض × الارتفاع |

### أحجام مقترحة

| الغرض | الحجم |
|:---|:---|
| صغير جداً | `UDim2.new(0, 320, 0, 280)` |
| صغير | `UDim2.new(0, 360, 0, 300)` |
| **افتراضي v3** | `UDim2.new(0, 400, 0, 320)` |
| متوسط | `UDim2.new(0, 460, 0, 360)` |
| كبير | `UDim2.new(0, 520, 0, 420)` |

---

## 📑 التبويبات (جديد: سكرول لا نهائي)

### تبويبات بلا حد

```lua
local Tab1 = Window:AddTab("Main", "🏠")
local Tab2 = Window:AddTab("Player", "👤")
local Tab3 = Window:AddTab("Settings", "⚙️")
local Tab4 = Window:AddTab("Combat", "⚔️")
local Tab5 = Window:AddTab("Visual", "🎨")
local Tab6 = Window:AddTab("Misc", "🔧")
local Tab7 = Window:AddTab("Credits", "📜")
local Tab8 = Window:AddTab("Extras", "🎁")
-- لا يوجد حد! السكرول يظهر تلقائياً
```

### تبويب بصورة

```lua
-- صورة Asset ID
local HomeTab = Window:AddTab("Home", nil, 6031075931)

-- صورة Decal ID
local ShopTab = Window:AddTab("Shop", nil, "12345678")

-- صورة URL
local ProfileTab = Window:AddTab("Profile", nil, "rbxthumb://type=Asset&id=6031075931&w=150&h=150")

-- تبويب نصي عادي
local NormalTab = Window:AddTab("Normal", "📁")
```

### شكل التبويب مع صورة

```
┌─────────────────┐
│ 🖼️  Home        │  ← صورة + نص
└─────────────────┘
```

---

## 🧩 العناصر

### 1️⃣ Section — عنوان قسم

```lua
GoldLib:AddSection(MainTab, "Movement")
```

**النتيجة:** `◈ MOVEMENT`

---

### 2️⃣ Label — نص بسيط

```lua
-- بدون صورة
GoldLib:AddLabel(MainTab, "Version 3.0")

-- مع صورة
GoldLib:AddLabel(MainTab, "Premium Member", 6031075931)
```

---

### 3️⃣ Image — صورة كاملة (جديد)

```lua
GoldLib:AddImage(MainTab, 6031075931, 120)
-- العرض تلقائي، الارتفاع 120px
```

---

### 4️⃣ Button — زر

```lua
-- بدون صورة
GoldLib:AddButton(
    MainTab,
    "Click Me",
    function() print("Clicked!") end,
    Color3.fromRGB(255, 200, 60),
    "✨"
)

-- مع صورة
GoldLib:AddButton(
    MainTab,
    "Buy Item",
    function() print("Bought!") end,
    Color3.fromRGB(255, 200, 60),
    nil,
    6031075931
)
```

---

### 5️⃣ Toggle — مفتاح تشغيل/إيقاف

```lua
-- بدون صورة
GoldLib:AddToggle(
    MainTab, "Infinite Jump", false, "InfJump",
    function(s) print("State:", s) end
)

-- مع صورة
GoldLib:AddToggle(
    MainTab, "Enable Feature", false, "Feature",
    function(s) print("State:", s) end,
    6031075931
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

### 6️⃣ Slider — شريط تمرير ✨

```lua
GoldLib:AddSlider(
    MainTab, "WalkSpeed", 16, 300, 16, "Speed",
    function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = v
        end
    end
)
```

---

### 7️⃣ Dropdown — قائمة منسدلة

```lua
GoldLib:AddDropdown(
    SettingsTab,
    "Select Theme",
    {"Gold", "Cyber", "Rose", "Ocean"},
    "Gold",
    "Theme",
    function(name)
        GoldLib:SetTheme(name)
    end
)
```

---

### 8️⃣ Textbox — مربع نص

```lua
GoldLib:AddTextbox(
    PlayerTab, "Player Name", "Enter...", "", "TargetPlayer",
    function(text)
        print("Entered:", text)
    end
)
```

---

### 9️⃣ Keybind — اختصار لوحة مفاتيح

```lua
GoldLib:AddKeybind(
    SettingsTab, "Toggle Fly", Enum.KeyCode.F, "FlyKey",
    function() print("F pressed!") end
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
    "https://raw.githubusercontent.com/ibrahimkhacef5-del/Goldlib/refs/heads/main/GoldV3.luau"
))()

GoldLib:SetTheme("Gold")

local Window = GoldLib.new({
    Title     = "Gold Hub",
    Subtitle  = "v3.0",
    Icon      = "🏆",
    LogoImage = 6031075931,
    ToggleKey = Enum.KeyCode.RightShift,
    Size      = UDim2.new(0, 400, 0, 320),
})

-- تبويبات متعددة (سكرول)
local MainTab     = Window:AddTab("Main",     "🏠")
local PlayerTab   = Window:AddTab("Player",   "👤")
local SettingsTab = Window:AddTab("Settings", "⚙️")
local ImageTab    = Window:AddTab("Showcase", nil, 6031075931)

-- ═════════════ Main Tab ═════════════
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

GoldLib:AddButton(MainTab, "Reset Character", function()
    local char = game.Players.LocalPlayer.Character
    if char then char:BreakJoints() end
end, Color3.fromRGB(255, 140, 60), "🔄")

-- ═════════════ Player Tab ═════════════
GoldLib:AddSection(PlayerTab, "Teleport")

GoldLib:AddTextbox(PlayerTab, "Player Name", "Enter...", "", "Target", function(name)
    local target = game.Players:FindFirstChild(name)
    local char = game.Players.LocalPlayer.Character
    if target and target.Character and char then
        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)

GoldLib:AddButton(PlayerTab, "Full Heal", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").Health = char:FindFirstChildOfClass("Humanoid").MaxHealth
    end
end, Color3.fromRGB(80, 210, 120), "❤️")

-- ═════════════ Settings Tab ═════════════
GoldLib:AddSection(SettingsTab, "Theme")

GoldLib:AddDropdown(SettingsTab, "Theme",
    {"Gold", "Midnight", "Cyber", "Rose", "Forest", "Ocean", "Sunset", "Mono", "Candy", "iOS"},
    "Gold", "Theme",
    function(name) GoldLib:SetTheme(name) end)

GoldLib:AddSection(SettingsTab, "Config")

GoldLib:AddButton(SettingsTab, "Save", function()
    GoldLib:SaveConfig("config.json")
end, Color3.fromRGB(80, 200, 120), "💾")

GoldLib:AddButton(SettingsTab, "Load", function()
    GoldLib:LoadConfig("config.json")
end, Color3.fromRGB(100, 150, 255), "📂")

-- ═════════════ Showcase Tab ═════════════
GoldLib:AddSection(ImageTab, "Images Demo")

GoldLib:AddImage(ImageTab, 6031075931, 100)

GoldLib:AddLabel(ImageTab, "Premium Member", 6031075931)

GoldLib:AddButton(ImageTab, "Buy Now", function()
    GoldLib:Notify({ Title = "✅", Content = "Purchased!", Duration = 2 })
end, Color3.fromRGB(255, 200, 60), nil, 6031075931)

-- ═════════════ Welcome ═════════════
task.wait(0.5)
GoldLib:Notify({
    Title    = "🏆 Gold v3.0 Loaded",
    Content  = "Press RightShift to open",
    Duration = 4,
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
<td><code>Window:AddTab(name, icon, image)</code></td>
<td>Tab</td>
</tr>
<tr>
<td><b>Section</b></td>
<td><code>GoldLib:AddSection(tab, text)</code></td>
<td>Label</td>
</tr>
<tr>
<td><b>Label</b></td>
<td><code>GoldLib:AddLabel(tab, text, image)</code></td>
<td>Label</td>
</tr>
<tr>
<td><b>Image</b></td>
<td><code>GoldLib:AddImage(tab, image, height)</code></td>
<td>Frame</td>
</tr>
<tr>
<td><b>Button</b></td>
<td><code>GoldLib:AddButton(tab, label, callback, color, icon, image)</code></td>
<td><code>{SetEnabled}</code></td>
</tr>
<tr>
<td><b>Toggle</b></td>
<td><code>GoldLib:AddToggle(tab, label, default, flag, callback, image)</code></td>
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
<tr>
<td><b>Image Resolver</b></td>
<td><code>GoldLib:ResolveImage(input)</code></td>
<td>string</td>
</tr>
<tr>
<td><b>Decal to Image</b></td>
<td><code>GoldLib:DecalToImage(decalId)</code></td>
<td>string</td>
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
<td>الصورة لا تظهر</td>
<td>جرّب <code>rbxthumb://type=Asset&id=ID&w=420&h=420</code></td>
</tr>
<tr>
<td>FAB ثابت</td>
<td>حرّكه بـ <code>Window.FAB.Position</code></td>
</tr>
<tr>
<td>التبويبات لا تظهر كلها</td>
<td>السكرول يعمل تلقائياً — اسحب أفقياً</td>
</tr>
<tr>
<td>خطأ <code>:Set</code></td>
<td>احفظ العنصر في متغير أولاً</td>
</tr>
</tbody>
</table>

---

## 🎯 مقارنة الإصدارات

<table>
<tr>
<th>الميزة</th>
<th>v1.0</th>
<th>v2.0</th>
<th>v3.0</th>
</tr>
<tr><td>ثيمات</td><td>12</td><td>10</td><td>10</td></tr>
<tr><td>عناصر</td><td>8</td><td>8</td><td>9</td></tr>
<tr><td>تبويبات لا نهائية</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>Glass Blur</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>دعم صور</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>Logo مخصص</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>AddImage</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>حجم افتراضي</td><td>380×300</td><td>380×300</td><td>400×320</td></tr>
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

### 🏆 GoldLib v3.0

**صُنع بشغف ✨**

[⬆ العودة للأعلى](#-goldlib-v30)

</div>
