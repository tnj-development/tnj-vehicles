local QBCore = exports['qb-core']:GetCoreObject()
local wheelchair = nil

RegisterNetEvent('tnj-vehicles:wheelchair', function()
    if QBCore.Functions.HasItem('wheelchair') then
        if not DoesEntityExist(wheelchair) then
            local wheelchairModel = 'wheelchair'
            RequestModel(wheelchairModel)
            while not HasModelLoaded(wheelchairModel) do
                Wait(0)
            end
            wheelchair = CreateVehicle(wheelchairModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
            SetVehicleOnGroundProperly(wheelchair)
            SetVehicleNumberPlateText(wheelchair, "WHEEL".. math.random(9))
            SetPedIntoVehicle(PlayerPedId(), wheelchair, -1)
            SetModelAsNoLongerNeeded(wheelchairModel)
            local wheelchairPlate = GetVehicleNumberPlateText(wheelchair)
            TriggerEvent("vehiclekeys:client:SetOwner", wheelchairPlate)
            SetVehicleEngineOn(vehicle, true, true)
        elseif DoesEntityExist(wheelchair) and #(GetEntityCoords(wheelchair) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(wheelchair,-1) == 0 then
            DeleteVehicle(wheelchair)
            wheelchair = nil
        else
            QBCore.Functions.Notify("You already have a wheelchair out!")
        end
    end
end)
local hoverboard = nil

RegisterNetEvent('tnj-vehicles:hoverboard', function()
    if QBCore.Functions.HasItem('hoverboard') then
        if not DoesEntityExist(hoverboard) then
            local hoverboardModel = 'hoverboard'
            RequestModel(hoverboardModel)
            while not HasModelLoaded(hoverboardModel) do
                Wait(0)
            end
            hoverboard = CreateVehicle(hoverboardModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
            SetVehicleOnGroundProperly(hoverboard)
            SetVehicleNumberPlateText(hoverboard, "BOARD".. math.random(9))
            SetPedIntoVehicle(PlayerPedId(), hoverboard, -1)
            SetModelAsNoLongerNeeded(hoverboardModel)
            local hoverboardPlate = GetVehicleNumberPlateText(hoverboard)
            TriggerEvent("vehiclekeys:client:SetOwner", hoverboardPlate)
            SetVehicleEngineOn(vehicle, true, true)
        elseif DoesEntityExist(hoverboard) and #(GetEntityCoords(hoverboard) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(hoverboard,-1) == 0 then
            DeleteVehicle(hoverboard)
            hoverboard = nil
        else
            QBCore.Functions.Notify("You already have a hoverboard out!")
        end
    end
end)
