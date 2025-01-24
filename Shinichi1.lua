# Thêm GUI menu vào script với hiệu ứng mở/đóng và hiển thị trạng thái vũ khí

updated_script = '''
-- Chạy script Kaitun từ URL
local kaitunScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tairbloxdz/Kaitun-Shinichi/refs/heads/main/kaitun.lua"))()
kaitunScript() -- Chạy script Kaitun

-- Tạo GUI để hiển thị trạng thái sở hữu Melee và Sword
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local menuGui = Instance.new("ScreenGui")
menuGui.Parent = playerGui

-- Tạo Frame cho menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 500)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.Visible = false
menuFrame.Parent = menuGui

-- Hiệu ứng mở menu (phóng to)
function openMenu()
    menuFrame.Visible = true
    menuFrame.Size = UDim2.new(0, 50, 0, 50)
    for i = 1, 10 do
        menuFrame.Size = menuFrame.Size + UDim2.new(0, 35, 0, 45)
        wait(0.02)
    end
end

-- Hiệu ứng đóng menu (thu nhỏ rồi biến mất)
function closeMenu()
    for i = 1, 10 do
        menuFrame.Size = menuFrame.Size - UDim2.new(0, 35, 0, 45)
        wait(0.02)
    end
    menuFrame.Visible = false
end

-- Nút đóng menu
local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -55, 0, 5)
closeButton.Image = "rbxassetid://119153379176478" -- Thay ID ảnh nút đóng
closeButton.Parent = menuFrame
closeButton.MouseButton1Click:Connect(closeMenu)

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
    "True Triple Katana", "Yoru", "Tushita", "Yama", "Cursed Dual Katana"
}

-- Hàm kiểm tra vũ khí có trong kho của người chơi
function hasWeapon(weaponName)
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == weaponName then
            return true
        end
    end
    return false
end

-- Tạo danh sách hiển thị trong menu
local listFrame = Instance.new("ScrollingFrame")
listFrame.Size = UDim2.new(1, -10, 1, -60)
listFrame.Position = UDim2.new(0, 5, 0, 50)
listFrame.Parent = menuFrame

local layout = Instance.new("UIListLayout")
layout.Parent = listFrame

for _, weapon in ipairs(meleeList) do
    local weaponLabel = Instance.new("TextLabel")
    weaponLabel.Size = UDim2.new(1, -10, 0, 50)
    weaponLabel.Text = weapon .. (hasWeapon(weapon) and " ✅" or " ❌")
    weaponLabel.TextSize = 20
    weaponLabel.Parent = listFrame
end

for _, weapon in ipairs(swordList) do
    local weaponLabel = Instance.new("TextLabel")
    weaponLabel.Size = UDim2.new(1, -10, 0, 50)
    weaponLabel.Text = weapon .. (hasWeapon(weapon) and " ✅" or " ❌")
    weaponLabel.TextSize = 20
    weaponLabel.Parent = listFrame
end

-- Nút mở menu
local openButton = Instance.new("ImageButton")
openButton.Size = UDim2.new(0, 100, 0, 50)
openButton.Position = UDim2.new(0, 20, 0, 20)
openButton.Image = "rbxassetid://131995589099949" -- Thay ID ảnh nút mở
openButton.Parent = menuGui
openButton.MouseButton1Click:Connect(openMenu)
'''

# Ghi đè nội dung mới vào file
with open(file_path, "w", encoding="utf-8") as file:
    file.write(updated_script)

"Script đã được cập nhật thành công!"