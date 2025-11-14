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
    },
    ["WeakLegacy"] = {
        Ids = {18337464872},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoWeakLegacy/refs/heads/main/TsuoWeakLegacy.lua"
    },
    ["SAB"] = {
        Ids = {109983668079237},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoSAB/refs/heads/main/TsuoSAB.lua"
    },
    ["VoleyBallLegends"] = {
        Ids = {74691681039273},
        Url = "https://raw.githubusercontent.com/DRK070/TsuoVoleyBallLegends/refs/heads/main/TsuoVoleyLegends.lua"
    }
}

local FALLBACK_URL = "https://raw.githubusercontent.com/DRK070/TsuoUniversal/refs/heads/main/TsuoUniversal.lua"

local function getScriptUrl(placeId)
    for name, data in pairs(Scripts) do
        for _, id in ipairs(data.Ids) do
            if id == placeId then
                print("Carregando script: " .. name)
                return data.Url
            end
        end
    end
    return nil
end

local function safeLoadUrl(url)
    if not url or url == "" then
        warn("URL inválida passada para safeLoadUrl.")
        return false
    end

    local ok, content = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or not content then
        warn("Falha ao obter o script em: " .. tostring(url))
        return false
    end

    local execOk, execErr = pcall(function()
        local fn = loadstring(content)
        if not fn then error("loadstring retornou nil") end
        fn()
    end)

    if not execOk then
        warn("Erro ao executar o script de: " .. tostring(url) .. " | Erro: " .. tostring(execErr))
        return false
    end

    return true
end

local ScriptUrl = getScriptUrl(PlaceId)

if ScriptUrl then
    if not safeLoadUrl(ScriptUrl) then
        warn("Tentativa de carregar o script principal falhou. Tentando fallback universal...")
        safeLoadUrl(FALLBACK_URL)
    end
else
    print("Nenhum script específico configurado para este jogo. Carregando fallback universal...")
    if not safeLoadUrl(FALLBACK_URL) then
        warn("Falha ao carregar o fallback universal. PlaceId: " .. tostring(PlaceId))
    end
end