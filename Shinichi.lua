local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Tạo Frame chính của menu
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 1 -- Viền nhỏ khoảng 1mm
frame.Parent = gui

-- Tiêu đề menu (chỉnh to hơn và căn trái)
local title = Instance.new("TextLabel")
title.Text = "Shinichi x Taidepzai"
title.Size = UDim2.new(1, 0, 0, 40) -- Tăng chiều cao chữ
title.Position = UDim2.new(0, 10, 0, 0) -- Dịch sang trái
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu khởi đầu
title.Font = Enum.Font.SourceSansBold
title.TextSize = 25 -- Tăng size chữ
title.TextXAlignment = Enum.TextXAlignment.Left -- Căn chữ trái
title.Parent = frame

-- Nút đóng menu
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Parent = frame

-- Nút thu nhỏ/phóng to menu
local minimizeButton = Instance.new("TextButton")
minimizeButton.Text = "▭"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20
minimizeButton.Parent = frame

-- Trạng thái menu (mở hoặc thu nhỏ)
local isMinimized = false
local originalSize = frame.Size
local minimizedSize = UDim2.new(0, 300, 0, 30)

-- Chức năng thu nhỏ/phóng to menu
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        frame.Size = originalSize
    else
        frame.Size = minimizedSize
    end
    isMinimized = not isMinimized
end)

-- Sự kiện đóng menu
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Tạo hiệu ứng đổi màu liên tục cho tiêu đề & viền
local TweenService = game:GetService("TweenService")
local function createColorTween(object, property, color)
    local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local goal = {[property] = color}
    return TweenService:Create(object, tweenInfo, goal)
end

local colors = {
    Color3.fromRGB(255, 0, 0), -- Đỏ
    Color3.fromRGB(0, 255, 0), -- Xanh lá
    Color3.fromRGB(0, 150, 255), -- Xanh dương
    Color3.fromRGB(255, 255, 0), -- Vàng
    Color3.fromRGB(255, 0, 255) -- Tím
}

local index = 1
while true do
    local nextColor = colors[index]

    -- Hiệu ứng đổi màu cho chữ tiêu đề
    local titleTween = createColorTween(title, "TextColor3", nextColor)
    titleTween:Play()

    -- Hiệu ứng đổi màu viền của menu
    local borderTween = createColorTween(frame, "BorderColor3", nextColor)
    borderTween:Play()
    
    borderTween.Completed:Wait()
    index = index % #colors + 1 -- Chuyển sang màu tiếp theo
end
