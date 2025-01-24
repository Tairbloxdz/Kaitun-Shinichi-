local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

local gui = player:WaitForChild("PlayerGui"):WaitForChild("StatusGui")
local menuFrame = gui:WaitForChild("MenuFrame")  -- Frame chứa trạng thái
local toggleButton = gui:WaitForChild("ToggleButton")  -- Nút bật/tắt
local healthLabel = menuFrame:WaitForChild("HealthLabel")
local energyLabel = menuFrame:WaitForChild("EnergyLabel")

-- Hình ảnh khi bật/tắt
local closeImage = "rbxassetid://100882525032763"  -- Hình ảnh khi menu đóng
local openImage = "rbxassetid://100882525032763"    -- Hình ảnh khi menu mở
toggleButton.Image = closeImage  -- Đặt hình ảnh ban đầu

-- Ẩn menu ban đầu
menuFrame.Visible = false
local isVisible = false

-- Hàm cập nhật trạng thái
local function updateStats()
    while true do
        if humanoid then
            healthLabel.Text = "Health: " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
        end
        
        local energy = character:FindFirstChild("Energy")
        if energy then
            energyLabel.Text = "Energy: " .. energy.Value
        end
        
        wait(1) -- Cập nhật mỗi giây
    end
end

-- Hàm bật/tắt menu và thay đổi hình ảnh nút
local function toggleMenu()
    isVisible = not isVisible
    menuFrame.Visible = isVisible
    
    if isVisible then
        toggleButton.Image = openImage
    else
        toggleButton.Image = closeImage
    end
end

-- Gắn sự kiện khi nhấn vào nút
toggleButton.MouseButton1Click:Connect(toggleMenu)

-- Chạy cập nhật trạng thái
updateStats()
