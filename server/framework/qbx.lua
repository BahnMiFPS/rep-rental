if not Framework.QBox() then return end

function Framework.getIdentifier(src)
    local player = exports.qbx_core:GetPlayer(src)
    return player.PlayerData.citizenid
end

function Framework.Notification(src, _msg, _type, _time)
    exports.qbx_core:Notify(src, _msg, _type, _time)
end

function Framework.getMoney(src, _type)
    local player = exports.qbx_core:GetPlayer(src)
    return player.Functions.GetMoney(_type)
end

function Framework.removeMoney(src, _type, amount)
    local player = exports.qbx_core:GetPlayer(src)
    player.Functions.RemoveMoney(_type, amount, 'rent vehicle')
end

function Framework.addMoney(src, amount)
    local player = exports.qbx_core:GetPlayer(src)
    player.Functions.AddMoney('bank', amount, 'return rent vehicle')
end

lib.callback.register('rep-rental:callback:checkLicense', function (source, _type)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local licenseTable = player.PlayerData.metadata["licences"]
    return licenseTable[_type]
end)

RegisterServerEvent('rep-rental:server:giveRentalPaper', function(plate, model)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local info = {}
    info.citizenid = player.PlayerData.citizenid
    info.firstname = player.PlayerData.charinfo.firstname
    info.lastname = player.PlayerData.charinfo.lastname
    info.plate = plate
    info.model = model
    exports.ox_inventory:AddItem(src, 'rentalpapers', 1, info)
end)

exports("rentalpapers", function(event, item, inventory, slot, data)
    if event == 'usingItem' then
       local i = exports.ox_inventory:GetSlot(inventory.id, slot)
        TriggerClientEvent('rep-weed:client:rollJoint', inventory.id, i.metadata.plate)
        return
    end
end)