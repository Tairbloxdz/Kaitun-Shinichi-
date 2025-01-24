-- Tải UI Library (OrionLib)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Tạo cửa sổ menu chính
local Window = OrionLib:MakeWindow({
    Name = "Kaitun Menu ✅",
    HidePremium = false,
    IntroText = "Welcome to Kaitun Menu! ✅",
    SaveConfig = true,
    ConfigFolder = "KaitunConfig"
})

-- Tạo tab chính
local MainTab = Window:MakeTab({
    Name = "📌 Main",
    Icon = "rbxassetid://119153379176478",
    PremiumOnly = false
})

-- Tạo Label hiển thị Level
local LevelLabel = MainTab:AddLabel("🔄 Đang tải Level...")

-- Hàm cập nhật Level
local function UpdateLevel()
    while true do
        -- Kiểm tra nếu nhân vật tồn tại
        if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
            local playerStats = game.Players.LocalPlayer:FindFirstChild("Data")
            if playerStats then
                local level = playerStats:FindFirstChild("Level")
                if level then
                    LevelLabel:Set("📊 Level hiện tại: " .. level.Value)
                end
            end
        end
        wait(5) -- Cập nhật mỗi 5 giây
    end
end

-- Chạy cập nhật Level trong một luồng riêng
task.spawn(UpdateLevel)

-- Nút chạy script chính
MainTab:AddButton({
    Name = "🚀 Chạy Kaitun Script ✅",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tairbloxdz/Kaitun-Shinichi/refs/heads/main/kaitun.lua"))()
    end
})

-- Nút Copy Link Discord
MainTab:AddButton({
    Name = "📋 Copy Link Discord ✅",
    Callback = function()
        setclipboard("https://discord.gg/TFmhmbGjEE") -- Copy link vào clipboard
        OrionLib:MakeNotification({
            Name = "✅ Thành công!",
            Content = "Đã copy link Discord vào clipboard!",
            Image = "rbxassetid://119153379176478",
            Time = 5
        })
    end
})

-- Nút thoát UI
MainTab:AddButton({
    Name = "❌ Thoát Menu",
    Callback = function()
        OrionLib:Destroy()
    end
})

-- Hiển thị UI
OrionLib:Init()
