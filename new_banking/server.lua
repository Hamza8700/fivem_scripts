--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","new_banking")

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		if amount > 0 then
			if vRP.tryPayment({user_id, amount}) then
				local bank = vRP.getBankMoney({user_id})
				bank = bank + amount
				vRP.setBankMoney({user_id, bank})
			else
				TriggerClientEvent('chatMessage', source, "You do not have enough money")
			end
		end
	end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		if amount > 0 then
			local bank = vRP.getBankMoney({user_id})
			bank = bank - amount
			if bank >= 0 then
				vRP.setBankMoney({user_id, bank})
				vRP.giveMoney({user_id, amount})
			end
		end
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		local balance = vRP.getBankMoney({user_id})
		TriggerClientEvent('currentbalance1', source, balance)
	end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(target_id, amountt)
	local user_id = vRP.getUserId({source})
	local tsource = vRP.getUserSource({target_id})
	if tsource ~= nil then
		balance = vRP.getBankMoney({user_id})
		target_balance = vRP.getBankMoney({target_id})

		if tonumber(user_id) == tonumber(target_id) then
			TriggerClientEvent('chatMessage', source, "You cannot transfer to yourself!")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('chatMessage', source, "You do not have enough money in the bank")
			else
				local user_bank = vRP.getBankMoney({user_id})
				user_bank = user_bank - amountt
				vRP.setBankMoney({user_id, user_bank})

				local target_bank = vRP.getBankMoney({target_id})
				target_bank = target_bank + amountt
				vRP.setBankMoney({target_id, target_bank})
			end

		end
	else
		TriggerClientEvent('chatMessage', source, "The player is unavailable.")
	end
end)
