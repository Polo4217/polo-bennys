local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('polo-bennys:server:RefuelCheck', function()
    local args = tonumber(args)
    local Player = QBCore.Functions.GetPlayer(source)
    local cash = Player.Functions.GetMoney('cash')
    local refuelcoust = Config.Shop[1].price

    if tonumber(refuelcoust) <= cash then
        Player.Functions.RemoveMoney('cash', tonumber(refuelcoust))
        Player.Functions.AddItem('nitrous', 1)
        Player.Functions.RemoveItem('emptynitrous', 1)
        TriggerClientEvent('QBCore:Notify', source, "Payed $"..refuelcoust)
    else 
        TriggerClientEvent('QBCore:Notify', source, "You dont have enough cash", "error")
    end

end)