if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.openMenu(_index)
    local _data = {}
    for _i, _v in pairs(Config.Locations[_index].vehicles) do
        _data[_i] = _v
        if not _data[_i].label then
            _data[_i].label = ('%s %s'):format(QBCore.Shared.Vehicles[_data[_i].model]['brand'], QBCore.Shared.Vehicles[_data[_i].model]['name'])
        end
    end
    currentRental = _index
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        data = {
            vehicles = _data
        }
    })
end

function Framework.getVehName(_model)
    return ('%s %s'):format(QBCore.Shared.Vehicles[_model]['brand'], QBCore.Shared.Vehicles[_model]['name'])
end