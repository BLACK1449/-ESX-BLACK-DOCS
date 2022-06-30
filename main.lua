--ESX Boilerplate
 
ESX = nil
local PlayerData = {}
 
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
 
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
 
    ESX.PlayerData = ESX.GetPlayerData();
end)
 
--Register Net Events
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
 
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
end)

local showUi = false

Citizen.CreateThread(function()
        Citizen.Wait(1)
        while true do
            if IsControlJustReleased(0, 344) then 
                if showUi == false then 
                    if ESX.PlayerData.job.name ~= nil and ESX.PlayerData.job.name == 'police' then --[!] Job
                    SetNuiFocus(true, true)
                    SendNUIMessage({type = "enable"})
                    showUi = true;
                end
            end
        end
        Citizen.Wait(1)
    end
end)

RegisterNUICallback('NUIFocusOff', function()
    if showUi == true then 
        SetNuiFocus(false, false)
        SendNUIMessage({type = "disable"})
        showUi = false
    end
end)

print("BLACK x Scripts© - Since 2022")
print("   _______________________")
print("  | discord.gg/Sdsnu6HfKA |")

