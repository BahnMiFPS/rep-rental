if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.Notification(src, msg, type , time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(msg, type , time)
end

function Framework.getIdentifier(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    return xPlayer.identifier
end

function Framework.getMoney(src, _type)
    if _type == 'cash' then
        _type = 'money'
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    return xPlayer.GetMoney(_type)
end

function Framework.removeMoney(src, _type, amount)
    if _type == 'cash' then
        _type = 'money'
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeAccountMoney(_type, amount, 'rent vehicle')
end

function Framework.addMoney(src, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addAccountMoney('bank', amount, 'return rent vehicle')
end

lib.callback.register('rep-rental:callback:checkLicense', function (source, _type)
    local src = source
    local result = false
    TriggerEvent('esx_license:getLicenses', src, function(licenses)
        for i=1, #licenses, 1 do
            if licenses[i].type == _type then
                result = true
            end
        end
		return result
    end)
end)