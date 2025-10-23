local PlaceId = game.PlaceId

local Scripts = {
    ["KingLegacy"] = {
        Ids = {4520749081},
        Url = "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/king%20legacy"
    },
    ["GrowAGarden"] = {
        Ids = {126884695634066},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoGrow/refs/heads/main/TsuoGrow.lua"
    },
    ["HuntyZombie"] = {
        Ids = {86076978383613},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoHubZombie/refs/heads/main/TsuoHuntyZombie.lua"
    },
    ["99Nights"] = {
        Ids = {126509999114328},
        Url = "https://raw.githubusercontent.com/DRK070/99nights/refs/heads/main/tsuohub99night.lua"
    },
    ["BloxFruits"] = {
        Ids = {7449423635, 4442272183, 2753915549},
        Url = "https://raw.githubusercontent.com/Overgustx2/TsuoLoader/main/Tsuo.lua"
    },
    ["Forsaken"] = {
        Ids = {18687417158},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoHubForsaken/refs/heads/main/TsuoForsaken.lua"
    },
    ["FishIt"] = {
        Ids = {121864768012064},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoFishIt/refs/heads/main/TsuoFishIt.lua"
    },
    ["Fisch"] = {
        Ids = {16732694052, 131716211654599},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoFisch/refs/heads/main/TsuoFisch.lua"
    },
    ["PlantVsBrainrot"] = {
        Ids = {127742093697776},
        Url = "https://raw.githubusercontent.com/DRK070/PlantVsBrainrot/refs/heads/main/TsuoPlantVsBrainrot.lua"
    },
    ["DemonFall"] = {
        Ids = {5094651510},
        Url = "https://raw.githubusercontent.com/yrururhdhdhududhdheh-stack/Tsuohub/refs/heads/main/tsuobhub.lua"
    },
    ["SpeedLegends"] = {
        Ids = {3101667897},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoSpeed/refs/heads/main/TsuoSpeedLegends.lua"
    },
    ["TowerOfHell"] = {
        Ids = {3582763398, 1962086868},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoTower/refs/heads/main/TsuoTower.lua"
    },
    ["MurderMystery2"] = {
        Ids = {142823291},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoMM2/refs/heads/main/TsuoMM2.lua"
    }
}

local function getScriptUrl(placeId)
    for name, data in pairs(Scripts) do
        for _, id in ipairs(data.Ids) do
            if id == placeId then
                print("🌀 Carregando script para: " .. name)
                return data.Url
            end
        end
    end
    return nil
end

local function safeLoadUrl(url, scriptName)
    if not url or url == "" then
        warn("⚠️ URL inválida recebida.")
        return
    end

    local ok, contentOrErr = pcall(function() return game:HttpGet(url) end)
    if not ok then
        warn("⚠️ Falha ao obter script " .. (scriptName or "") .. ".")
        return
    end

    local ok2, funcOrErr = pcall(loadstring, contentOrErr)
    if not ok2 or type(funcOrErr) ~= "function" then
        warn("⚠️ Erro ao compilar script " .. (scriptName or "") .. ".")
        return
    end

    local ok3, execErr = pcall(funcOrErr)
    if not ok3 then
        warn("⚠️ Erro ao executar script " .. (scriptName or "") .. ".")
        return
    end

    print("✅ Script " .. (scriptName or "desconhecido") .. " carregado com sucesso.")
end

local ScriptUrl = getScriptUrl(PlaceId)

if ScriptUrl then
    safeLoadUrl(ScriptUrl, "Principal")
else
    warn("❌ Nenhum script configurado para este jogo! PlaceId: " .. PlaceId)
end

local ContadorUrl = "https://raw.githubusercontent.com/DRK070/Contador/refs/heads/main/ContadorTsuo.lua"
safeLoadUrl(ContadorUrl, "Contador")