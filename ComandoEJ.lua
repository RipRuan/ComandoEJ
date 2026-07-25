-- // COMANDO EJ - VERSÃO COMPLETA COM PARKOUR INTEGRADO // --
local s = Instance.new
local g = game:GetService("Players").LocalPlayer.PlayerGui
local plr = game:GetService("Players").LocalPlayer

-- ============================================
-- CRIAÇÃO DA GUI
-- ============================================
local f = s("ScreenGui")
f.Name = "REDMY_GUI"
f.Parent = g

local m = s("Frame")
m.Size = UDim2.new(0, 300, 0, 320)
m.Position = UDim2.new(0.5, -150, 0.5, -160)
m.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
m.BackgroundTransparency = 0.1
m.BorderSizePixel = 0
m.Active = true
m.Parent = f

local mainCorner = Instance.new("UICorner")
mainCorner.Parent = m
mainCorner.CornerRadius = UDim.new(0, 12)

-- BORDA RGB
local borda = s("Frame")
borda.Size = UDim2.new(1, 10, 1, 10)
borda.Position = UDim2.new(-0.02, 0, -0.02, 0)
borda.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
borda.BackgroundTransparency = 0
borda.BorderSizePixel = 0
borda.ZIndex = 0
borda.Parent = m
local bordaCorner = Instance.new("UICorner")
bordaCorner.Parent = borda
bordaCorner.CornerRadius = UDim.new(0, 14)

game:GetService("RunService").RenderStepped:Connect(function()
    local hue = (tick() * 0.3) % 1
    borda.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- BRILHO
local brilho = s("Frame")
brilho.Size = UDim2.new(1, 14, 1, 14)
brilho.Position = UDim2.new(-0.025, 0, -0.025, 0)
brilho.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
brilho.BackgroundTransparency = 0.8
brilho.BorderSizePixel = 0
brilho.ZIndex = -1
brilho.Parent = m
local brilhoCorner = Instance.new("UICorner")
brilhoCorner.Parent = brilho
brilhoCorner.CornerRadius = UDim.new(0, 16)

task.spawn(function()
    while brilho and brilho.Parent do
        for trans = 0.8, 0.5, -0.01 do
            if not brilho or not brilho.Parent then break end
            brilho.BackgroundTransparency = trans
            task.wait(0.02)
        end
        for trans = 0.5, 0.8, 0.01 do
            if not brilho or not brilho.Parent then break end
            brilho.BackgroundTransparency = trans
            task.wait(0.02)
        end
    end
end)

-- ARRASTO
local dragging = false
local dragStart, startPos

m.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = i.Position
        startPos = m.Position
    end
end)

m.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local delta = i.Position - dragStart
        m.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

m.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

-- TÍTULO
local titulo = s("TextLabel")
titulo.Name = "Titulo"
titulo.Size = UDim2.new(1, 0, 0, 40)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.BackgroundTransparency = 1
titulo.Text = "Comando EJ🇧🇷💀🐺"
titulo.TextColor3 = Color3.fromRGB(255, 200, 50)
titulo.TextScaled = true
titulo.Font = Enum.Font.GothamBold
titulo.ZIndex = 2
titulo.Parent = m

-- BOTÃO MINIMIZAR
local mn = s("TextButton")
mn.Size = UDim2.new(0, 30, 0, 30)
mn.Position = UDim2.new(1, -35, 0, 5)
mn.Text = "➖"
mn.TextScaled = true
mn.TextColor3 = Color3.fromRGB(255, 255, 255)
mn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
mn.BorderSizePixel = 1
mn.BorderColor3 = Color3.fromRGB(255, 200, 50)
mn.ZIndex = 2
mn.Parent = m
local mnCorner = Instance.new("UICorner")
mnCorner.Parent = mn
mnCorner.CornerRadius = UDim.new(0, 8)

-- ============================================
-- BOTÕES E LABELS
-- ============================================
local elementosParaEsconder = {}

-- LABEL PARKOUR
local pkLabel = s("TextLabel")
pkLabel.Size = UDim2.new(1, 0, 0, 30)
pkLabel.Position = UDim2.new(0, 0, 0, 60)
pkLabel.BackgroundTransparency = 1
pkLabel.Text = "ATIVAR PARKOUR"
pkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pkLabel.TextScaled = true
pkLabel.Font = Enum.Font.Gotham
pkLabel.Parent = m
table.insert(elementosParaEsconder, pkLabel)

-- BOTÃO PARKOUR (COM PARKOUR INTEGRADO)
local pk = s("TextButton")
pk.Size = UDim2.new(0.8, 0, 0, 35)
pk.Position = UDim2.new(0.1, 0, 0, 90)
pk.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
pk.Text = "PARKOUR: OFF"
pk.TextColor3 = Color3.fromRGB(0, 0, 0)
pk.TextScaled = true
pk.Font = Enum.Font.GothamBold
pk.BorderSizePixel = 0
pk.Parent = m
local pkCorner = Instance.new("UICorner")
pkCorner.Parent = pk
pkCorner.CornerRadius = UDim.new(0, 10)
table.insert(elementosParaEsconder, pk)

-- JJS
local jLabel = s("TextLabel")
jLabel.Size = UDim2.new(1, 0, 0, 30)
jLabel.Position = UDim2.new(0, 0, 0, 140)
jLabel.BackgroundTransparency = 1
jLabel.Text = "ATIVAR JJs"
jLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jLabel.TextScaled = true
jLabel.Font = Enum.Font.Gotham
jLabel.Parent = m
table.insert(elementosParaEsconder, jLabel)

local jj = s("TextButton")
jj.Size = UDim2.new(0.8, 0, 0, 35)
jj.Position = UDim2.new(0.1, 0, 0, 170)
jj.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
jj.Text = "JJS: OFF"
jj.TextColor3 = Color3.fromRGB(0, 0, 0)
jj.TextScaled = true
jj.Font = Enum.Font.GothamBold
jj.BorderSizePixel = 0
jj.Parent = m
local jjCorner = Instance.new("UICorner")
jjCorner.Parent = jj
jjCorner.CornerRadius = UDim.new(0, 10)
table.insert(elementosParaEsconder, jj)

-- HITBOX
local hLabel = s("TextLabel")
hLabel.Size = UDim2.new(1, 0, 0, 30)
hLabel.Position = UDim2.new(0, 0, 0, 210)
hLabel.BackgroundTransparency = 1
hLabel.Text = "PVP HITBOX"
hLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hLabel.TextScaled = true
hLabel.Font = Enum.Font.Gotham
hLabel.Parent = m
table.insert(elementosParaEsconder, hLabel)

local hb = s("TextButton")
hb.Size = UDim2.new(0.8, 0, 0, 35)
hb.Position = UDim2.new(0.1, 0, 0, 240)
hb.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
hb.Text = "HITBOX: OFF"
hb.TextColor3 = Color3.fromRGB(0, 0, 0)
hb.TextScaled = true
hb.Font = Enum.Font.GothamBold
hb.BorderSizePixel = 0
hb.Parent = m
local hbCorner = Instance.new("UICorner")
hbCorner.Parent = hb
hbCorner.CornerRadius = UDim.new(0, 10)
table.insert(elementosParaEsconder, hb)

-- RODAPÉ
local k = s("TextLabel")
k.Size = UDim2.new(1, 0, 0, 25)
k.Position = UDim2.new(0, 0, 0, 280)
k.BackgroundTransparency = 1
k.Text = "RipJ e ErickX"
k.TextColor3 = Color3.fromRGB(150, 150, 150)
k.TextScaled = true
k.Font = Enum.Font.Gotham
k.Parent = m
table.insert(elementosParaEsconder, k)

-- ============================================
-- MINIMIZAR
-- ============================================
local mini = false

mn.MouseButton1Click:Connect(function()
    mini = not mini
    if mini then
        m.Size = UDim2.new(0, 300, 0, 40)
        for _, elem in ipairs(elementosParaEsconder) do
            elem.Visible = false
        end
        mn.Text = "➕"
    else
        m.Size = UDim2.new(0, 300, 0, 320)
        for _, elem in ipairs(elementosParaEsconder) do
            elem.Visible = true
        end
        mn.Text = "➖"
    end
end)

-- ============================================
-- FUNÇÃO PARA EXECUTAR OUTROS SCRIPTS
-- ============================================
local function executarScript(url)
    pcall(function()
        loadstring(game:HttpGet(url))()
        print("✅ Script executado: " .. url)
    end)
end

-- ============================================
-- SISTEMA DO PARKOUR (INTEGRADO DIRETAMENTE)
-- ============================================

-- PEGANDO O JOGADOR E SERVIÇOS
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- POSIÇÕES DAS PLATAFORMAS (MESMAS DO SEU SCRIPT)
local LocalData = {
    {pos = Vector3.new(185.03, 5.04, -661.62), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.39, 13.26, -661.39), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.11, 21.28, -661.68), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.30, 29.29, -661.72), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(186.08, 37.36, -661.76), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(186.08, 45.36, -661.76), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(186.25, 53.36, -661.86), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.82, 61.36, -662.00), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.60, 69.40, -661.98), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.71, 77.42, -661.90), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.28, 85.44, -662.14), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.42, 93.48, -662.05), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.94, 101.46, -661.80), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.94, 109.48, -661.78), size = Vector3.new(4.00, 0.50, 17.00)},
    {pos = Vector3.new(185.08, 5.26, -618.66), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.36, 13.28, -618.65), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.32, 21.29, -618.70), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.65, 29.34, -618.67), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(186.12, 37.36, -618.43), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(186.30, 45.34, -617.87), size = Vector3.new(5.00, 0.50, 16.00)},
    {pos = Vector3.new(185.41, 53.36, -618.05), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.62, 61.40, -617.79), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.58, 69.40, -617.79), size = Vector3.new(4.00, 0.50, 17.00)},
    {pos = Vector3.new(185.87, 77.42, -618.33), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.73, 85.44, -618.62), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.68, 93.48, -618.49), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(185.83, 101.46, -617.76), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(185.57, 109.48, -618.45), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(270.22, 4.24, -661.72), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(277.86, 4.24, -655.56), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(269.80, 4.24, -649.96), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(284.45, 4.24, -660.72), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(284.59, 4.24, -650.23), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(267.14, 5.04, -627.94), size = Vector3.new(4.00, 0.50, 32.00)},
    {pos = Vector3.new(288.33, 5.04, -627.86), size = Vector3.new(4.00, 0.50, 31.00)},
    {pos = Vector3.new(277.48, 7.63, -591.97), size = Vector3.new(4.00, 0.50, 27.00)},
    {pos = Vector3.new(271.76, 7.64, -569.98), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(279.08, 7.64, -567.95), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(265.48, 7.64, -564.93), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(271.34, 7.64, -559.70), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(259.46, 7.64, -561.92), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(260.50, 7.64, -554.72), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(250.93, 7.64, -561.91), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(248.66, 7.64, -554.60), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(243.06, 7.64, -565.74), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(235.96, 7.64, -560.93), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(240.08, 7.64, -592.47), size = Vector3.new(4.00, 0.50, 27.00)},
    {pos = Vector3.new(394.19, 5.06, -850.78), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(389.19, 7.45, -855.82), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(392.91, 5.06, -861.09), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(384.07, 10.15, -855.95), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(377.51, 12.94, -855.73), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(370.87, 14.68, -855.83), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(365.12, 16.20, -856.03), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(358.50, 17.61, -855.96), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(351.76, 19.27, -856.05), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(345.37, 20.53, -855.83), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(339.00, 21.54, -855.95), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(334.51, 21.54, -850.11), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(328.83, 21.54, -855.97), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(335.00, 21.54, -861.70), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(324.43, 21.54, -861.35), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(324.69, 21.54, -850.36), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(318.73, 21.54, -855.70), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(313.47, 21.54, -861.90), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(308.27, 21.54, -855.88), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(314.49, 21.54, -850.04), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(303.58, 21.54, -861.59), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(303.61, 21.54, -850.61), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(298.50, 21.54, -856.16), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(393.87, 2.87, -892.93), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(394.65, 2.87, -902.16), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(389.37, 5.04, -892.40), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(389.57, 5.04, -903.24), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(383.37, 7.79, -892.63), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(383.64, 7.79, -903.27), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(378.64, 9.35, -892.48), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(378.64, 9.35, -903.24), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(373.27, 11.53, -892.90), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(372.82, 11.53, -903.33), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(368.47, 11.53, -892.69), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(367.91, 11.53, -903.02), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(362.88, 11.53, -894.04), size = Vector3.new(4.00, 0.50, 7.00)},
    {pos = Vector3.new(358.03, 11.53, -901.74), size = Vector3.new(4.00, 0.50, 6.00)},
    {pos = Vector3.new(352.36, 11.53, -894.75), size = Vector3.new(4.00, 0.50, 6.00)},
    {pos = Vector3.new(347.47, 11.53, -899.21), size = Vector3.new(4.00, 0.50, 6.00)},
    {pos = Vector3.new(333.21, 11.53, -897.81), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(325.73, 11.53, -898.53), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(318.25, 11.53, -897.79), size = Vector3.new(5.00, 0.50, 11.00)},
    {pos = Vector3.new(310.71, 11.53, -898.95), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(303.10, 11.53, -898.29), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(295.54, 11.53, -898.01), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(288.21, 11.53, -898.79), size = Vector3.new(5.00, 0.50, 12.00)},
    {pos = Vector3.new(149.54, 1.04, -856.00), size = Vector3.new(3.00, 0.50, 13.00)},
    {pos = Vector3.new(148.21, 7.50, -855.93), size = Vector3.new(4.00, 0.50, 13.00)},
    {pos = Vector3.new(148.27, 13.38, -856.27), size = Vector3.new(4.00, 0.50, 13.00)},
    {pos = Vector3.new(162.71, 13.70, -859.82), size = Vector3.new(8.00, 0.50, 5.00)},
    {pos = Vector3.new(170.73, 13.70, -852.89), size = Vector3.new(8.00, 0.50, 5.00)},
    {pos = Vector3.new(181.41, 13.70, -859.17), size = Vector3.new(8.00, 0.50, 5.00)},
    {pos = Vector3.new(190.97, 13.70, -853.25), size = Vector3.new(8.00, 0.50, 5.00)},
    {pos = Vector3.new(217.92, 11.53, -848.28), size = Vector3.new(32.00, 0.50, 4.00)},
    {pos = Vector3.new(217.99, 12.04, -863.62), size = Vector3.new(29.00, 0.50, 4.00)},
    {pos = Vector3.new(243.52, 12.04, -855.57), size = Vector3.new(14.00, 0.50, 3.00)},
    {pos = Vector3.new(150.43, 5.27, -897.87), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(150.71, 13.28, -898.27), size = Vector3.new(4.00, 0.50, 17.00)},
    {pos = Vector3.new(150.28, 21.29, -898.42), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(150.45, 29.30, -898.11), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(150.52, 37.31, -898.44), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(150.56, 45.32, -897.73), size = Vector3.new(4.00, 0.50, 15.00)},
    {pos = Vector3.new(150.95, 53.33, -898.02), size = Vector3.new(4.00, 0.50, 16.00)},
    {pos = Vector3.new(167.23, 53.26, -903.84), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(172.90, 53.26, -900.06), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(167.09, 53.26, -890.73), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(181.65, 53.26, -902.00), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(180.48, 53.26, -893.06), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(199.10, 53.33, -897.28), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(210.50, 53.33, -897.85), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(223.52, 53.33, -898.25), size = Vector3.new(5.00, 0.50, 5.00)},
    {pos = Vector3.new(235.61, 53.33, -897.82), size = Vector3.new(5.00, 0.50, 5.00)},
}

-- VARIÁVEIS DO PARKOUR
local Plataformas = {}
local park
