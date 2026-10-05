-- cl_init.lua para el cliente del gamemode, se ejecuta en el lado del cliente y carga todos los archivos necesarios para que el gamemode funcione correctamente en el cliente.
include("shared.lua")

local function recursive_include_client(path)
    local files, folders = file.Find(path .. "*", "LUA")

    for _, file_name in ipairs(files) do
        local full_path = path .. file_name
        if not file_name:EndsWith(".lua") then continue end

        if file_name:StartWith("cl_") or file_name:StartWith("sh_") then
            include(full_path)
        end
    end

    for _, folder_name in ipairs(folders) do
        recursive_include_client(path .. folder_name .. "/")
    end
end

recursive_include_client("modsito/gamemode/core/")
recursive_include_client("modsito/gamemode/utils/")
recursive_include_client("modsito/gamemode/net/")
recursive_include_client("modsito/gamemode/hooks/")
recursive_include_client("modsito/gamemode/modules/")
recursive_include_client("modsito/gamemode/menu/")

print("[modsito] Cliente cargado.")