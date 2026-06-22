local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local MyUsername = "Davex_11" -- Твой точный юзернейм
local ParryDistance = 35

local function getTargetBall()
    local ballsFolder = workspace:FindFirstChild("Balls")
    if ballsFolder then
        for _, ball in ipairs(ballsFolder:GetChildren()) do
            local isRealBall = ball:GetAttribute("realBall")
            local targetPlayer = ball:GetAttribute("target")
            
            -- Теперь скрипт сверяет цель мяча напрямую с твоим именем
            if isRealBall == true and tostring(targetPlayer) == MyUsername then
                return ball
            end
        end
    end
    return nil
end

local secretRemote = ReplicatedStorage:FindFirstChild("RE/jjinn` pd2>polaim")

RunService.Heartbeat:Connect(function()
    local character = Players.LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local ball = getTargetBall()
    
    if ball and hrp and secretRemote then
        local distance = (ball.Position - hrp.Position).Magnitude
        if distance <= ParryDistance then
            secretRemote:FireServer()
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blade Ball",
    Text = "Davex Custom Parry Active!",
    Duration = 4
})
     
