local Core = exports["qb-core"]:GetCoreObject()
local blips = {}
local currentRental = 0
local _lang = GetConvar('repscripts:locale', 'en')
local Lang = Config.Lang[_lang]
local npc = nil

local function spawnVeh(_data, _id)
    _data.coords = Config.Locations[_id].spawnpoint
    if IsAnyVehicleNearPoint(_data.coords.x, _data.coords.y, _data.coords.z, 2.0) then
        Core.Functions.Notify(Lang['error_obstacle'].msg, Lang['error_obstacle'].type, Lang['error_obstacle'].time)
        return
    end
    Core.Functions.TriggerCallback("rep-rental:callback:spawnVeh", function(netID)
        if netID then
            local car = NetToVeh(netID)
            SetVehicleNumberPlateText(car, 'RENT' .. Core.Shared.RandomInt(4))
            SetVehicleEngineOn(car, true, true)
            SetVehicleDirtLevel(car, 0.0)
            SetVehRadioStation(car, 'OFF')
            exports['cdn-fuel']:SetFuel(car, 100)
            local r1, g1, b1 = _data.color:match("rgb%((%d+), (%d+), (%d+)%)")
            SetVehicleCustomPrimaryColour(car, tonumber(r1), tonumber(g1), tonumber(b1))
            TriggerEvent("vehiclekeys:client:SetOwner", Core.Functions.GetPlate(car))
            TriggerServerEvent("rep-rental:server:giveRentalPaper", Core.Functions.GetPlate(car),
                Core.Shared.Vehicles[_data.model].brand .. " " .. Core.Shared.Vehicles[_data.model].name)
        end
    end, _data)
end

CreateThread(function()
    for _, info in pairs(Config.Locations) do
        blips[_] = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
        SetBlipSprite(blips[_], info.blip.sprite)
        SetBlipDisplay(blips[_], 4)
        SetBlipScale(blips[_], 0.6)
        SetBlipColour(blips[_], info.blip.colour)
        SetBlipAsShortRange(blips[_], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.blip.label)
        EndTextCommandSetBlipName(blips[_])
        npc = exports['rep-talkNPC']:CreateNPC({
            npc = info.ped.hash,
            coords = vector4(info.coords.x, info.coords.y, info.coords.z, info.coords.w),
            heading = info.coords.w,
            name = info.ped.name,
            animScenario = 'WORLD_HUMAN_CLIPBOARD',
            position = info.ped.position,
            color = info.ped.color,
            startMSG = info.ped.startMSG
        }, {
            [1] = {
                label = Lang['ped_data1'].msg,
                shouldClose = true,
                action = function()
                    currentRental = _
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = 'open',
                        data = {
                            vehicles = info.vehicles
                        }
                    })
                end
            },
            [2] = {
                label = Lang['ped_data3'].msg,
                shouldClose = true,
                action = function()
                    TriggerServerEvent('rep-rental:server:returnVehicle')
                end
            },
            [3] = {
                label = Lang['ped_data2'].msg,
                shouldClose = true,
                action = function()
                end
            }
        })
    end
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    currentRental = 0
end)

RegisterNUICallback('setLocale', function(_, cb)
    cb(Lang['ui'])
end)

RegisterNUICallback('rent', function(data, cb)
    local id = currentRental
    if Config.DriverLicense[data.type] then
        Core.Functions.TriggerCallback("rep-rental:callback:checkLicense", function(hasLicense)
            if hasLicense then
                spawnVeh(data, id)
            else
                Core.Functions.Notify(Lang['error_license'].msg, Lang['error_license'].type, Lang['error_license']
                    .time)
            end
        end, Config.DriverLicense[data.type])
    else
        spawnVeh(data, id)
    end
end)

RegisterNUICallback('init', function(_, cb)
    cb(1)
    SendNUIMessage({
        action = 'loadLocales',
        data = {}
    })
    local JSON = LoadResourceFile(cache.resource, ('locales/%s.json'):format(GetConvar('repscripts:locale', 'en'))) or
        LoadResourceFile(cache.resource, 'locales/en.json')
    SendNUIMessage({
        action = 'setLocale',
        data = JSON and json.decode(JSON) or {}
    })
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    DeleteEntity(npc)
    for i, v in pairs(blips) do
        RemoveBlip(v)
    end
end)
