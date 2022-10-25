local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('polo-bennys:client:BennyShop', function (ShopItems)
	local ShopItems = {}
	ShopItems.label = "Benny's Shop"
	ShopItems.items = Config.Shop
	ShopItems.slots = #Config.Shop
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "bennyshop_"..math.random(1, 99), ShopItems) 
end)





Citizen.CreateThread(function()

    Citizen.Wait(500)
      RequestModel("ig_benny")
      while not HasModelLoaded("ig_benny") do
  
          Wait(500)
      end
      local ped =  CreatePed(0, 'ig_benny', Config.PedsCoords[1].coords.x, Config.PedsCoords[1].coords.y, Config.PedsCoords[1].coords.z, Config.PedsCoords[1].heading, false, false)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskStartScenarioInPlace(ped, 'PROP_HUMAN_SEAT_CHAIR_DRINK', true)
  
     

      RegisterNetEvent('polo-bennys:client:RefuelNitrous', function()
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            if result then
                TriggerServerEvent('polo-bennys:server:RefuelCheck')
                print('ok boss')
            else
                QBCore.Functions.Notify('You Dont Have Empty Nitrous Sad :(', 'error', 4000)
            end
        end, "emptynitrous")
    end)





  
      exports['qb-target']:AddBoxZone("polo-shop", Config.PedsCoords[1].coords, 1, 1, {
      name = "polo-shop",
      heading=0,
      debugPoly = Config.debug,
      minZ=24.89,
      maxZ=54.89,
    }, {
      options = {
        { 
          num = 1,
          type = "client",
          event = "polo-bennys:client:BennyShop",
          icon = 'fas fa-eye',
          label = 'bennys custom shop',
        },
        { 
          num = 2,
          type = "client",
          event = "polo-bennys:client:RefuelNitrous",
          icon = 'fas fa-eye',
          label = 'refil nitrous can $'..Config.Shop[1].price.. " ",
        },
      },
      distance = 2.5,
    })
  
  end)


  



  