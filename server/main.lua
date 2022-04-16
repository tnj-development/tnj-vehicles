local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("wheelchair", function(source)
    local source = source
    TriggerClientEvent('tnj-vehicles:wheelchair', source)
end)

QBCore.Functions.CreateUseableItem("hoverboard", function(source)
    local source = source
    TriggerClientEvent('tnj-vehicles:hoverboard', source)
end)
