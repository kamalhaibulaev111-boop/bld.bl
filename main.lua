local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local ParryDistance = 25

local function getBall()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Ball" then
            return obj
        end
    end
    return nil
end

local secretRemote = ReplicatedStorage:FindFirstChild("RE/jjinn` pd2>polaim")

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local ball = getBall()
    
    if ball and hrp and secretRemote then
        local distance = (ball.Position - hrp.Position).Magnitude
        
        if distance <= ParryDistance then
            secretRemote:FireServer()
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blade Ball",
    Text = "Custom Auto-Parry Active!",
    Duration = 4
})
