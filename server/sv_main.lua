local vehs = {}

lib.callback.register('rep-rental:callback:spawnVeh', function(source, _data)
    local src = source
    local ped = GetPlayerPed(src)
    for k, v in pairs(vehs) do
        if v.owner == Framework.getIdentifier(src) then
            Framework.Notification(src, Lang.error.already.label, Lang.error.already.type, Lang.error.already.time)
            return false
        end
    end
    if Framework.getMoney(src,_data.payment) < _data.total then
        if _data.payment == 'cash' then
            Framework.Notification(src, Lang.error.cash.label, Lang.error.cash.type, Lang.error.cash.time)
        else
            Framework.Notification(src, Lang.error.bank.label, Lang.error.bank.type, Lang.error.bank.time)
        end
        return false
    end
    Framework.removeMoney(src,_data.payment, _data.total)
    _data.model = type(_data.model) == 'string' and joaat(_data.model) or _data.model
    local veh = CreateVehicle(_data.model, _data.coords.x, _data.coords.y, _data.coords.z, _data.coords.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    while NetworkGetEntityOwner(veh) ~= src do Wait(0) end
    vehs[#vehs + 1] = {
        owner = Framework.getIdentifier(src),
        entity = veh,
        time = os.time() + (_data.time * 60 * 60),
        price = tonumber(_data.total / _data.time),
    }
    return NetworkGetNetworkIdFromEntity(veh)
end)

RegisterNetEvent('rep-rental:server:returnVehicle', function ()
    local src = source
    for k, v in pairs(vehs) do
        if v.owner == Framework.getIdentifier(src) then
            local remainTime = math.floor(v.time - os.time())
            if DoesEntityExist(v.entity) then
                DeleteEntity(v.entity)
                Framework.addMoney(src, 'bank', math.floor(remainTime * v.price / 60 / 60))
            end
            vehs[k] = nil
        end
    end
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


