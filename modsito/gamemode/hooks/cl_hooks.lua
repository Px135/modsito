net.Recive("Modsito_testpong", function()
    print("[Modsito] Ping recibido de: " .. ply:Nick() .. ": " .. net.ReadString())

    net.Start("Modsito_testpong")
        net.WriteString("Esta otra wea igual funciona")
    net.SendToServer()
end)