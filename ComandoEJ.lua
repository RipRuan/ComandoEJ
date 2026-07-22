-- // COMANDO EJ - VERSÃO CORRIGIDA // --
local s = Instance.new
local g = game:GetService("Players").LocalPlayer.PlayerGui
local plr = game:GetService("Players").LocalPlayer

-- ============================================
-- CRIAÇÃO DA GUI PRINCIPAL
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

-- BORDAS ARREDONDADAS
local mainCorner = Instance.new("UICorner")
mainCorner.Parent = m
mainCorner.CornerRadius = UDim.new(0, 12)

-- ============================================
-- BORDA RGB ANIMADA
-- ============================================
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

-- ============================================
-- EFEITO DE BRILHO PULSANTE
-- ============================================
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

-- ============================================
-- SISTEMA DE ARRASTO
-- ============================================
local dragging = false
local dragStart = nil
local startPos = nil

local function StartDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = m.Position
    end
end

local function UpdateDrag(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                     input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        m.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

local function EndDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end

m.InputBegan:Connect(StartDrag)
m.InputChanged:Connect(UpdateDrag)
m.InputEnded:Connect(EndDrag)

-- ============================================
-- BOTÃO MINIMIZAR (CORRIGIDO)
-- ============================================
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

local mini = false

-- Lista de elementos que NÃO devem ser escondidos (ficam sempre visíveis)
local sempreVisiveis = {mn, m:FindFirstChild("Titulo"), borda, brilho}

mn.MouseButton1Click:Connect(function()
    mini = not mini
    if mini then
        m.Size = UDim2.new(0, 300, 0, 40) -- encolhe o frame
        for _, c in pairs(m:GetChildren()) do
            local deveFicar = false
            for _, v in pairs(sempreVisiveis) do
                if c == v then deveFicar = true break end
            end
            if not deveFicar then
                c.Visible = false
            end
        end
        mn.Text = "➕"
        print("🟡 Minimizado")
    else
        m.Size = UDim2.new(0, 300, 0, 320) -- volta ao tamanho normal
        for _, c in pairs(m:GetChildren()) do
            c.Visible = true
        end
        mn.Text = "➖"
        print("🟢 Restaurado")
    end
end)

-- ============================================
-- TÍTULO E LABELS
-- ============================================
local t = s("TextLabel")
t.Name = "Titulo"
t.Size = UDim2.new(1, 0, 0, 40)
t.Position = UDim2.new(0, 0, 0, 0)
t.BackgroundTransparency = 1
t.Text = "Comando EJ🇧🇷💀🐺"
t.TextColor3 = Color3.fromRGB(255, 200, 50)
t.TextScaled = true
t.Font = Enum.Font.GothamBold
t.ZIndex = 2
t.Parent = m

-- ============================================
-- BOTÃO PARKOUR (com GHOST V1)
-- ============================================
local pLabel = s("TextLabel")
pLabel.Size = UDim2.new(1, 0, 0, 30)
pLabel.Position = UDim2.new(0, 0, 0, 40)
pLabel.BackgroundTransparency = 1
pLabel.Text = "PARKOUR"
pLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pLabel.TextScaled = true
pLabel.Font = Enum.Font.Gotham
pLabel.Parent = m

local pk = s("TextButton")
pk.Size = UDim2.new(0.8, 0, 0, 35)
pk.Position = UDim2.new(0.1, 0, 0, 70)
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

-- ============================================
-- BOTÃO JJS
-- ============================================
local jLabel = s("TextLabel")
jLabel.Size = UDim2.new(1, 0, 0, 30)
jLabel.Position = UDim2.new(0, 0, 0, 110)
jLabel.BackgroundTransparency = 1
jLabel.Text = "ATIVAR JJs"
jLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jLabel.TextScaled = true
jLabel.Font = Enum.Font.Gotham
jLabel.Parent = m

local jj = s("TextButton")
jj.Size = UDim2.new(0.8, 0, 0, 35)
jj.Position = UDim2.new(0.1, 0, 0, 140)
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

-- ============================================
-- BOTÃO HITBOX
-- ============================================
local hLabel = s("TextLabel")
hLabel.Size = UDim2.new(1, 0, 0, 30)
hLabel.Position = UDim2.new(0, 0, 0, 180)
hLabel.BackgroundTransparency = 1
hLabel.Text = "PVP HITBOX"
hLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hLabel.TextScaled = true
hLabel.Font = Enum.Font.Gotham
hLabel.Parent = m

local hb = s("TextButton")
hb.Size = UDim2.new(0.8, 0, 0, 35)
hb.Position = UDim2.new(0.1, 0, 0, 210)
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

-- ============================================
-- RODAPÉ
-- ============================================
local k = s("TextLabel")
k.Size = UDim2.new(1, 0, 0, 25)
k.Position = UDim2.new(0, 0, 0, 255)
k.BackgroundTransparency = 1
k.Text = "RipJ e ErickX"
k.TextColor3 = Color3.fromRGB(150, 150, 150)
k.TextScaled = true
k.Font = Enum.Font.Gotham
k.Parent = m

-- ============================================
-- FUNÇÃO PARA EXECUTAR SCRIPTS
-- ============================================
local function e(u)
    pcall(function()
        loadstring(game:HttpGet(u))()
        print("✅ Script executado: " .. u)
    end)
end

-- ============================================
-- CONTROLE DOS BOTÕES
-- ============================================
local pa = false
local ja = false
local ha = false

-- PARKOUR
pk.MouseButton1Click:Connect(function()
    pa = not pa
    pk.Text = pa and "PARKOUR: ON" or "PARKOUR: OFF"
    pk.BackgroundColor3 = pa and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if pa then
        e("https://raw.githubusercontent.com/RipRuan/BarreirasMobile/main/BarreirasMobile.lua")
    else
        print("🔴 PARKOUR DESATIVADO")
    end
end)

-- JJS
jj.MouseButton1Click:Connect(function()
    ja = not ja
    jj.Text = ja and "JJS: ON" or "JJS: OFF"
    jj.BackgroundColor3 = ja and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if ja then
        e("https://rawscripts.net/raw/Brazilian-Army-Auto-JJs-EB-do-Delta-sem-key-224236")
    else
        print("🔴 JJS DESATIVADO")
    end
end)

-- HITBOX
hb.MouseButton1Click:Connect(function()
    ha = not ha
    hb.Text = ha and "HITBOX: ON" or "HITBOX: OFF"
    hb.BackgroundColor3 = ha and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 200, 50)
    if ha then
        e("https://rawscripts.net/raw/Universal-Script-Hitbox-V5-108660")
    else
        print("🔴 HITBOX DESATIVADO")
    end
end)

print("✅ Comando EJ carregado com sucesso!")
