--[El init funciona como un script de arranque para el gamemode, se ejecuta al iniciar el servidor y carga todos los archivos necesarios para que el gamemode funcione correctamente.]]
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Mensaje de depuración para indicar que el gamemode se ha cargado correctamente en el servidor.
print("[MODSITO] Gamemode cargado correctamente.")

pcall(require, "pills")  -- Carga el módulo "pills" si está disponible, pero no genera un error si no lo está.

local function recursive_include(path) -- Función recursiva para incluir archivos Lua desde un directorio y sus subdirectorios.
	local files, folders = file.Find(path .. "*", "LUA") -- Busca todos los archivos y carpetas en el directorio especificado.
	
	for _, file_name in ipairs(files) do -- Itera sobre cada archivo encontrado en el directorio actual.
		local full_path = path .. file_name -- Construye la ruta completa del archivo.
	
		if !file_name:EndsWith(".lua") then continue end -- Si el archivo no es un archivo Lua, se omite y se continúa con el siguiente.
	
		if file_name:StartWith("sv_") then -- Si el archivo comienza con "sv_", se incluye solo en el servidor.
			include(full_path)
	
		elseif file_name:StartWith("sh_") then -- Si el archivo comienza con "sh_", se incluye tanto en el servidor como en el cliente.
			AddCSLuaFile(full_path)
			include(full_path)
	
		elseif file_name:StartWith("cl_") then -- Si el archivo comienza con "cl_", se incluye solo en el cliente.
			AddCSLuaFile(full_path)
		end
	end
    for _, folder_name in ipairs(folders) do  -- Itera sobre cada carpeta encontrada en el directorio actual.
        recursive_include(path .. folder_name .. "/") -- Llama recursivamente a la función para incluir archivos en subdirectorios.
    end
end

-- Llamadas a la función recursiva para incluir archivos desde varios directorios del gamemode.
recursive_include("modsito/gamemode/core/")
recursive_include("modsito/gamemode/utils/")
recursive_include("modsito/gamemode/")
recursive_include("modsito/gamemode/net/")
recursive_include("modsito/gamemode/hooks/")
recursive_include("modsito/gamemode/modules/")
recursive_include("modsito/gamemode/menu/")

