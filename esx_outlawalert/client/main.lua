ESX = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	PlayerData = ESX.GetPlayerData()

	ESX.PlayerData = ESX.GetPlayerData()

	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(alert)
	if isPlayerWhitelisted then
		TriggerEvent('chat:addMessage', { args = { "^5 Dispatch: " .. alert }})
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if NetworkIsSessionStarted() then
			DecorRegister('isOutlaw', 3)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)


function refreshPlayerWhitelisted()	
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedCops) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

RegisterNetEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
	if isPlayerWhitelisted then

	end
end)

RegisterNetEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then

	end
end)

RegisterNetEvent('esx_outlawalert:drugsaleInProgress')
AddEventHandler('esx_outlawalert:drugsaleInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.DrugAlert then
		local alpha = 250
		local drugBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipDrugRadius)

		SetBlipHighDetail(drugBlip, true)
		SetBlipColour(drugBlip, 52)
		SetBlipAlpha(drugBlip, alpha)
		SetBlipAsShortRange(drugBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipDrugTime*4)
			alpha = alpha - 1
			SetBlipAlpha(drugBlip, alpha)

			if alpha == 0 then
				RemoveBlip(drugBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:AtmHackInProgress')
AddEventHandler('esx_outlawalert:AtmHackInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:RobNPCInProgress')
AddEventHandler('esx_outlawalert:RobNPCInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.RobNPCAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipRobNPCRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:HoldUpInProgress')
AddEventHandler('esx_outlawalert:HoldUpInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.HoldUpAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipHoldUpRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))
		local ignores = {}
		for k,v in pairs(ESX.Game.GetPlayers()) do
			table.insert(ignores,GetPlayerPed(v))
		end
		local closePed,distance = ESX.Game.GetClosestPed(playerCoords,ignores)
		
			-- is jackin'
		if (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) and Config.CarJackingAlert and distance < Config.AlertJacking then

			Citizen.Wait(3000)
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave and not isInService) or not isPlayerWhitelisted) then
					local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

					ESX.TriggerServerCallback('esx_outlawalert:isVehicleOwner', function(owner)
						if not owner then

							local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
							vehicleLabel = GetLabelText(vehicleLabel)

							DecorSetInt(playerPed, 'isOutlaw', 2)

							TriggerServerEvent('esx_outlawalert:carJackInProgress', {
								x = ESX.Math.Round(playerCoords.x, 1),
								y = ESX.Math.Round(playerCoords.y, 1),
								z = ESX.Math.Round(playerCoords.z, 1)
							}, streetName, vehicleLabel)
						end
					end, plate)
				end
			end, 'police')

		elseif IsPedInMeleeCombat(playerPed) and Config.MeleeAlert and distance < Config.AlertMelee then

			Citizen.Wait(3000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)

				TriggerServerEvent('esx_outlawalert:combatInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName)
			end
		
		elseif IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert and distance < Config.AlertShooting then

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				if GetSelectedPedWeapon(GetPlayerPed(-1)) ~=  GetHashKey("WEAPON_STUNGUN") then
					Citizen.Wait(3000)
					DecorSetInt(playerPed, 'isOutlaw', 2)

					TriggerServerEvent('esx_outlawalert:gunshotInProgress', {
						x = ESX.Math.Round(playerCoords.x, 1),
						y = ESX.Math.Round(playerCoords.y, 1),
						z = ESX.Math.Round(playerCoords.z, 1)
					}, streetName)
				end	
			end
		end
	end
		
end)
