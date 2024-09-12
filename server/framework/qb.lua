if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end

function Framework.getIdentifier(src)
    local Player = QBCore.Functions.GetPlayer(src)
    return Player.PlayerData.citizenid
end

function Framework.getMoney(src, _type)
    local Player = QBCore.Functions.GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    return Player.PlayerData.money[_type]
end

function Framework.removeMoney(src, _type, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    Player.Functions.RemoveMoney(_type, amount, 'rent vehicle')
end

function Framework.addMoney(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('bank', amount, 'return rent vehicle')
end

lib.callback.register('rep-rental:callback:checkLicense', function (source, _type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]
    return licenseTable[_type]
end)

RegisterServerEvent('rep-rental:server:giveRentalPaper', function(plate, model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.citizenid = Player.PlayerData.citizenid
    info.firstname = Player.PlayerData.charinfo.firstname
    info.lastname = Player.PlayerData.charinfo.lastname
    info.plate = plate
    info.model = model
    Player.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rentalpapers"], 'add')
end)

QBCore.Functions.CreateUseableItem("rentalpapers", function(source, item)
    if item.info and item.info.plate then
        TriggerEvent("vehiclekeys:client:SetOwner", item.info.plate)
    end
end)