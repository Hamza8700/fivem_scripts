ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('carjack', "Bil", streetName))
	TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('combat', streetName))
	TriggerClientEvent('esx_outlawalert:combatInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('gunshot', streetName))
	TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:drugsaleInProgress')
AddEventHandler('esx_outlawalert:drugsaleInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('drugsale', streetName))
	TriggerClientEvent('esx_outlawalert:drugsaleInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:AtmHackInProgress')
AddEventHandler('esx_outlawalert:AtmHackInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('atmhack', streetName))
	TriggerClientEvent('esx_outlawalert:AtmHackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:RobNPCInProgress')
AddEventHandler('esx_outlawalert:RobNPCInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('robnpc', streetName))
	TriggerClientEvent('esx_outlawalert:RobNPCInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:HoldUpInProgress')
AddEventHandler('esx_outlawalert:HoldUpInProgress', function(targetCoords, streetName)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('holdup', streetName))
	TriggerClientEvent('esx_outlawalert:HoldUpInProgress', -1, targetCoords)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)
