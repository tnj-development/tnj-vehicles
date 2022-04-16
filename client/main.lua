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
