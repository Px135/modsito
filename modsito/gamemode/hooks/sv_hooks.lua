hook.Add("PlayerInitialSpawn", "modsito_testping", function(ply)
    timer.Simple(3, function()
        if not IsValid(ply) then return end
        
        net.Start("modsito_testping")
            net.WriteString("Esta wea si funciona")
        net.Send(ply)
    end)
end)

net.Recive("modsito_testpong", function(len, ply)
    print("[Modsito] Pong recibido de " .. ply:Nick() .. ": " .. net.ReadString())
end)