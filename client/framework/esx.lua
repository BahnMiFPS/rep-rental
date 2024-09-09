if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.openMenu(_index)
    local _data = {}
    for _i, _v in pairs(Config.Locations[_index].vehicles) do
        _data[_i] = _v
        if not _data[_i].label then
            _data[_i].label = GetDisplayNameFromVehicleModel(joaat(_data[_i].model)) ~= 'CARNOTFOUND' and GetDisplayNameFromVehicleModel(joaat(_data[_i].model)) or ('%s %s'):format("VEHICLES", _i)
        end
    end
    currentRental = __index
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        data = {
            vehicles = _data
        }
    })
end

function Framework.getVehName(_model)
    return GetDisplayNameFromVehicleModel(joaat(_model)) ~= 'CARNOTFOUND' and GetDisplayNameFromVehicleModel(joaat(_model)) or "VEHICLE"
end