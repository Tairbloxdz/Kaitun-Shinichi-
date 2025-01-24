-- Chạy script Kaitun từ URL
local kaitunScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tairbloxdz/Kaitun-Shinichi/refs/heads/main/kaitun.lua"))()
kaitunScript() -- Chạy script Kaitun

-- Tạo GUI để hiển thị trạng thái sở hữu Melee và Sword
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo danh sách Melee và Sword
local meleeList = {
    "Combat", "Dark Step", "Electric", "Water Kung Fu", "Dragon Breath", 
    "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", 
    "Dragon Talon", "Godhuman", "Sanguine Art"
}

local swordList = {
    "Cutlass", "Dual Katana", "Katana", "Iron Mace", "Shark Saw", 
    "Dual-Headed Blade", "Triple Katana", "Pipe", "Warden's Sword", "Saber", 
    "Soul Cane", "Pole (1st Form)", "Pole (2nd Form)", "Bisento", "Longsword", 
    "Jitte", "Trident", "Dark Blade", "Rengoku", "Shisui", "Wando", "Saddi", 
    "True Triple Katana", "Yoru", "Tushita", "Yama", "Cursed Dual Katana", 
    "Hallow Scythe", "Buddy Sword", "Canvander", "Midnight Blade", 
    "Dragon Trident", "Spikey Trident", "Twin Hooks", "Koko", "Gravity Cane"
}

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "WeaponStatusMenu"

-- Tạo Frame hiển thị trạng thái
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400) -- Kích thước: 300x400 pixel
frame.Position = UDim2.new(0.5, -150, 0.5, -200) -- Căn giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Màu nền: xám đậm
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Thêm khả năng kéo thả Frame
frame.Active = true
frame.Draggable = true

-- Tạo Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30) -- Kích thước: chiều ngang đầy đủ, cao 30 pixel
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Màu nền: xám tối
title.BorderSizePixel = 0
title.Text = "Weapon Status"
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ: trắng
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Tạo ScrollingFrame để danh sách cuộn
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -30) -- Chiều ngang đầy đủ, trừ phần title
scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 6 -- Độ dày thanh cuộn
scrollingFrame.Parent = frame

-- Hàm kiểm tra trạng thái sở hữu
local function updateWeaponStatus()
    -- Xóa các nội dung cũ
    for _, child in pairs(scrollingFrame:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end

    -- Thêm UIListLayout để căn chỉnh
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scrollingFrame

    -- Kiểm tra trạng thái Melee
    for _, melee in ipairs(meleeList) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 30)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.SourceSans
        label.TextSize = 18
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Text = melee .. ": "

        -- Kiểm tra sở hữu
        local hasWeapon = false
        if player.Backpack:FindFirstChild(melee) or player.Character:FindFirstChild(melee) then
            hasWeapon = true
        end

        -- Thêm trạng thái ✅ hoặc ❌
        if hasWeapon then
            label.Text = label.Text .. "✅"
        else
            label.Text = label.Text .. "❌"
        end

        label.Parent = scrollingFrame
    end

    -- Kiểm tra trạng thái Sword
    for _, sword in ipairs(swordList) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 30)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.SourceSans
        label.TextSize = 18
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Text = sword .. ": "

        -- Kiểm tra sở hữu
        local hasWeapon = false
        if player.Backpack:FindFirstChild(sword) or player.Character:FindFirstChild(sword) then
            hasWeapon = true
        end

        -- Thêm trạng thái ✅ hoặc ❌
        if hasWeapon then
            label.Text = label.Text .. "✅"
        else
            label.Text = label.Text .. "❌"
        end

        label.Parent = scrollingFrame
    end
end

-- Cập nhật trạng thái vũ khí mỗi 2 giây
while true do
    updateWeaponStatus()
    wait(2)
end
