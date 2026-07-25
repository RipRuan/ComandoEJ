-- // COMANDO EJ - MENU PRINCIPAL // --
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

-- BOTÃO PARKOUR
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
-- FUNÇÃO PARA EXECUTAR SCRIPTS
-- ============================================
local function executarScript(url)
    pcall(function()
        loadstring(game:HttpGet(url))()
        print("✅ Script executado: " .. url)
    end)
end

-- ============================================
-- CONTROLE DOS BOTÕES (CORRIGIDO)
-- ============================================
local pa = false  -- Parkour
local ja = false  -- JJs
local ha = false  -- Hitbox

-- BOTÃO PARKOUR
pk.MouseButton1Click:Connect(function()
    pa = not pa
    pk.Text = pa and "PARKOUR: ON" or "PARKOUR: OFF"
    pk.BackgroundColor3 = pa and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if pa then
        executarScript("https://raw.githubusercontent.com/RipRuan/ComandoEJ/main/ParkourComandoEJ.lua")
    else
        print("🟡 Parkour desativado")
    end
end)

-- BOTÃO JJS
jj.MouseButton1Click:Connect(function()
    ja = not ja
    jj.Text = ja and "JJS: ON" or "JJS: OFF"
    jj.BackgroundColor3 = ja and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if ja then 
        executarScript("https://rawscripts.net/raw/Brazilian-Army-Auto-JJs-EB-do-Delta-sem-key-224236") 
    else
        print("🟡 JJs desativado")
    end
end)

-- BOTÃO HITBOX
hb.MouseButton1Click:Connect(function()
    ha = not ha
    hb.Text = ha and "HITBOX: ON" or "HITBOX: OFF"
    hb.BackgroundColor3 = ha and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if ha then 
        executarScript("https://rawscripts.net/raw/Universal-Script-Hitbox-V5-108660") 
    else
        print("🟡 Hitbox desativado")
    end
end)

print("✅ Comando EJ carregado com sucesso!")
