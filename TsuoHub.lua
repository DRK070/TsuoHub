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
        Url = "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuohub99nights"
    },
    ["BloxFruits"] = {
        Ids = {7449423635, 4442272183, 2753915549}, -- adicionei os 3 IDs
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
    ["PlantVsBrainrot"] = {
        Ids = {127742093697776},
        Url = "https://raw.githubusercontent.com/DRK070/PlantVsBrainrot/refs/heads/main/TsuoPlantVsBrainrot.lua"
    }
}

local function getScriptUrl(placeId)
    for _, data in pairs(Scripts) do
        for _, id in ipairs(data.Ids) do
            if id == placeId then
                return data.Url
            end
        end
    end
    return nil
end

local ScriptUrl = getScriptUrl(PlaceId)

if ScriptUrl then
    loadstring(game:HttpGet(ScriptUrl))()
else
    warn("Nenhum script configurado para este jogo! PlaceId: " .. PlaceId)
end