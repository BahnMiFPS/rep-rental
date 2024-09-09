if not Framework.QBox() then return end
local VEHICLES = exports.qbx_core:GetVehiclesByName()

function Framework.openMenu(_index)
    local _data = {}
    for _i, _v in pairs(Config.Locations[_index].vehicles) do
        _data[_i] = _v
        if not _data[_i].label then
            _data[_i].label = ('%s %s'):format(VEHICLES[_data[_i].model].brand, VEHICLES[_data[_i].model].name)
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
    return ('%s %s'):format(VEHICLES[_model].brand, VEHICLES[_model].name)
end