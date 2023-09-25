local Core = exports['qb-core']:GetCoreObject()
local _lang = GetConvar('repscripts:locale', 'en')
local Lang = Config.Lang[_lang]
local vehs = {}

Core.Functions.CreateCallback('rep-rental:callback:checkLicense', function(source, cb, type)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]
    cb(licenseTable[type])
end)

RegisterServerEvent('rep-rental:server:giveRentalPaper', function(plate, model)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local info = {}
    info.citizenid = Player.PlayerData.citizenid
    info.firstname = Player.PlayerData.charinfo.firstname
    info.lastname = Player.PlayerData.charinfo.lastname
    info.plate = plate
    info.model = model
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items["rentalpapers"], 'add')
    Player.Functions.AddItem('rentalpapers', 1, false, info)
end)

Core.Functions.CreateCallback('rep-rental:callback:spawnVeh', function(source, cb, _data)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    if _data.payment == 'cash' then
        if Player.PlayerData.money.cash < _data.total then
            TriggerClientEvent('QBCore:Notify', src, Lang['error_cash'].msg, Lang['error_cash'].type,
                Lang['error_cash'].time)
            cb(false)
            return
        end
        Player.Functions.RemoveMoney('cash', _data.total)
    else
        if Player.PlayerData.money.bank < _data.total then
            TriggerClientEvent('QBCore:Notify', src, Lang['error_bank'].msg, Lang['error_bank'].type,
                Lang['error_bank'].time)
            cb(false)
            return
        end
        Player.Functions.RemoveMoney('bank', _data.total)
    end
    _data.model = type(_data.model) == 'string' and joaat(_data.model) or _data.model
    local veh = CreateVehicle(_data.model, _data.coords.x, _data.coords.y, _data.coords.z, _data.coords.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    while GetVehiclePedIsIn(ped) ~= veh do
        Wait(0)
        TaskWarpPedIntoVehicle(ped, veh, -1)
    end
    while NetworkGetEntityOwner(veh) ~= src do Wait(0) end
    vehs[#vehs + 1] = {
        entity = veh,
        time = os.time() + (_data.time * 60 * 60)
    }
    cb(NetworkGetNetworkIdFromEntity(veh))
end)

CreateThread(function()
    while true do
        for k, v in pairs(vehs) do
            if v then
                if os.time() >= v.time then
                    if DoesEntityExist(v.entity) then
                        DeleteEntity(v.entity)
                    end
                    vehs[k] = nil
                end
            end
        end
        Wait(60 * 1000)
    end
end)

Core.Functions.CreateUseableItem("rentalpapers", function(source, item)
    if item.info and item.info.plate then
        TriggerEvent("vehiclekeys:client:SetOwner", item.info.plate)
    end
end)
