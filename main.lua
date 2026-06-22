-- [[ Simple Auto-Parry for Blade Ball (Mobile Optimized) ]] --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local ParryDistance = 20 -- Можешь менять число, если нужно дальше/ближе

local function getBall()
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj.Name == "Ball" or obj:GetAttribute("IsBall") then
            return obj
        end
    end
    return nil
end

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local ball = getBall()
    
    if ball and hrp then
        local distance = (ball.Position - hrp.Position).Magnitude
        
        -- Если мяч рядом, пробуем отбить
        if distance <= ParryDistance then
            local remote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("ParryButtonPress")
            if remote then
                remote:FireServer()
            end
        end
    end
end)

-- Уведомление об успешном запуске
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blade Ball",
    Text = "Auto-Parry Active!",
    Duration = 3
})
