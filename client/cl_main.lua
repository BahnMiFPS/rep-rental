local blips = {}
currentRental = 0
local npc = nil

local function spawnVeh(_data, _id)
    _data.coords = Config.Locations[_id].spawnpoint
    if IsAnyVehicleNearPoint(_data.coords.x, _data.coords.y, _data.coords.z, 2.0) then
        Framework.Notification(Lang.error.obstacle.label, Lang.error.obstacle.type, Lang.error.obstacle.time)
        return
    end
    local netID = lib.callback.await("rep-rental:callback:spawnVeh", false, _data)
    while not NetworkDoesNetworkIdExist(netID) do
        Wait(100)
    end
    local car = NetToVeh(netID)
    local vehPlate = 'RENT'..lib.string.random('.')..lib.string.random('.')..lib.string.random('.')..lib.string.random('.')
    SetVehicleNumberPlateText(car, vehPlate)
    SetVehicleEngineOn(car, true, true)
    SetVehicleDirtLevel(car, 0.0)
    SetVehRadioStation(car, 'OFF')
    exports['cdn-fuel']:SetFuel(car, 100)
    local r1, g1, b1 = _data.color:match("rgb%((%d+), (%d+), (%d+)%)")
    SetVehicleCustomPrimaryColour(car, tonumber(r1), tonumber(g1), tonumber(b1))
    TriggerEvent("vehiclekeys:client:SetOwner", lib.getVehicleProperties(car).plate)
    SetPedIntoVehicle(cache.ped, car, -1)
    TriggerServerEvent("rep-rental:server:giveRentalPaper", lib.getVehicleProperties(car).plate, Framework.getVehName(_data.model))(_data.model)
end

local function openMenu(_index)
    Framework.openMenu(_index)
end

exports("openMenu", openMenu)

CreateThread(function()
    for _, info in pairs(Config.Locations) do
        if info.blip then
            blips[_] = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
            SetBlipSprite(blips[_], info.blip.sprite)
            SetBlipDisplay(blips[_], 4)
            SetBlipScale(blips[_], 0.6)
            SetBlipColour(blips[_], info.blip.colour)
            SetBlipAsShortRange(blips[_], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.blip.label)
            EndTextCommandSetBlipName(blips[_])
        end
        if info.ped then
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
                    label = Lang.npc.button1.label,
                    shouldClose = true,
                    action = function()
                        Framework.openMenu(_)
                    end
                },
                [2] = {
                    label = Lang.npc.button2.label,
                    shouldClose = true,
                    action = function()
                        TriggerServerEvent('rep-rental:server:returnVehicle')
                    end
                },
                [3] = {
                    label = Lang.npc.button3.label,
                    shouldClose = true,
                    action = function()
                    end
                }
            })
        end
    end
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    currentRental = 0
end)

RegisterNUICallback('setLocale', function(_, cb)
    cb(Lang)
end)

RegisterNUICallback('rent', function(data, cb)
    local id = currentRental
    if Config.DriverLicense[data.type] then
        local hasLicense = lib.callback.await('rep-rental:callback:checkLicense', false, Config.DriverLicense[data.type])
        if hasLicense then
            spawnVeh(data, id)
        else
            Framework.Notification(Lang.error.license.label, Lang.error.license.type, Lang.error.license.time)
        end
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
    SendNUIMessage({
        action = 'setLocale',
        data = Lang
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
