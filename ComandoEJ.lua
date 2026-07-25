-- TESTE: Menu simples
local s = Instance.new
local gui = s("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = s("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = gui

local botao = s("TextButton")
botao.Size = UDim2.new(0.8, 0, 0, 40)
botao.Position = UDim2.new(0.1, 0, 0.3, 0)
botao.Text = "PARKOUR"
botao.Parent = frame

botao.MouseButton1Click:Connect(function()
    print("Clicou! Carregando parkour...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RipRuan/ComandoEJ/main/ParkourComandoEJ.lua"))()
end)

print("✅ Menu de teste criado!")
