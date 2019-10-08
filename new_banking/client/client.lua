--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================

inMenu = true

local showblips = true
local atbank = false
local bankMenu = true

local banks = {
  {name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
  {name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
  {name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
  {name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
  {name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
  {name="Bank", id=108, x=-351.534, y=-49.529, z=49.042},
  {name="Bank", id=108, x=241.727, y=220.706, z=106.286},
  {name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
}

local atmHack = {
  {name="atmHack", id=277, x=89.75, y=2.35, z=68.31},
  {name="atmHack", id=277, x=1167.02, y=-456.32, z=66.79},	
  {name="atmHack", id=277, x=-386.733, y=6045.953, z=31.501},
  {name="atmHack", id=277, x=-283.15, y=6225.92, z=31.49},
  {name="atmHack", id=277, x=-133.01, y=6366.47, z=31.48},
  {name="atmHack", id=277, x=-94.96, y=6455.98, z=31.46},
  {name="atmHack", id=277, x=155.4300, y=6641.991, z=31.784},
  {name="atmHack", id=277, x=174.6720, y=6637.218, z=31.784},
  {name="atmHack", id=277, x=1703.138, y=6426.783, z=32.730},
  {name="atmHack", id=277, x=1735.114, y=6411.035, z=35.164},
  {name="atmHack", id=277, x=1702.842, y=4933.593, z=42.051},
  {name="atmHack", id=277, x=1967.333, y=3744.293, z=32.272},
  {name="atmHack", id=277, x=1821.917, y=3683.483, z=34.244},
  {name="atmHack", id=277, x=540.0420, y=2671.007, z=42.177},
  {name="atmHack", id=277, x=2564.399, y=2585.100, z=38.016},
  {name="atmHack", id=277, x=2558.683, y=349.6010, z=108.050},
  {name="atmHack", id=277, x=2558.051, y=389.4817, z=108.660},
  {name="atmHack", id=277, x=1077.692, y=-775.796, z=58.218},
  {name="atmHack", id=277, x=1139.018, y=-469.886, z=66.789},
  {name="atmHack", id=277, x=1153.884, y=-326.540, z=69.245},
  {name="atmHack", id=277, x=381.2827, y=323.2518, z=103.270},
  {name="atmHack", id=277, x=285.2029, y=143.5690, z=104.970},
  {name="atmHack", id=277, x=157.7698, y=233.5450, z=106.450},
  {name="atmHack", id=277, x=-164.568, y=233.5066, z=94.919},
  {name="atmHack", id=277, x=-1827.04, y=785.5159, z=138.020},
  {name="atmHack", id=277, x=-1409.39, y=-99.2603, z=52.473},
  {name="atmHack", id=277, x=-1205.35, y=-325.579, z=37.870},
  {name="atmHack", id=277, x=-2072.41, y=-316.959, z=13.345},
  {name="atmHack", id=277, x=-2975.72, y=379.7737, z=14.992},
  {name="atmHack", id=277, x=-2957.79, y=488.4, z=15.47},
  {name="atmHack", id=277, x=-3044.22, y=595.2429, z=7.595},
  {name="atmHack", id=277, x=-3144.13, y=1127.415, z=20.868},
  {name="atmHack", id=277, x=-3241.10, y=996.6881, z=12.500},
  {name="atmHack", id=277, x=-3241.11, y=1009.152, z=12.877},
  {name="atmHack", id=277, x=-1305.40, y=-706.240, z=25.352},
  {name="atmHack", id=277, x=-538.225, y=-854.423, z=29.234},
  {name="atmHack", id=277, x=-711.156, y=-818.958, z=23.768},
  {name="atmHack", id=277, x=-717.614, y=-915.880, z=19.268},
  {name="atmHack", id=277, x=-526.566, y=-1222.90, z=18.434},
  {name="atmHack", id=277, x=-256.0, y=-716.05, z=33.51},
  {name="atmHack", id=277, x=-258.67, y=-723.47, z=33.44},
  {name="atmHack", id=277, x=-203.548, y=-861.588, z=30.205},
  {name="atmHack", id=277, x=112.4102, y=-776.162, z=31.427},
  {name="atmHack", id=277, x=112.9290, y=-818.710, z=31.386},
  {name="atmHack", id=277, x=119.9000, y=-883.826, z=31.191},
  {name="atmHack", id=277, x=-618.74, y=-707.9, z=30.5},
  {name="atmHack", id=277, x=-146.91, y=-1035.23, z=29.34},
  {name="atmHack", id=277, x=-846.304, y=-340.402, z=38.687},
  {name="atmHack", id=277, x=-56.1935, y=-1752.53, z=29.452},
  {name="atmHack", id=277, x=-261.692, y=-2012.64, z=30.121},
  {name="atmHack", id=277, x=-273.001, y=-2025.60, z=30.197},
  {name="atmHack", id=277, x=24.589, y=-946.056, z=29.357},
  {name="atmHack", id=277, x=-254.112, y=-692.483, z=33.616},
  {name="atmHack", id=277, x=-1570.197, y=-546.651, z=34.955},
  {name="atmHack", id=277, x=-1415.909, y=-211.825, z=46.500},
  {name="atmHack", id=277, x=-1430.112, y=-211.014, z=46.500},
  {name="atmHack", id=277, x=33.232, y=-1347.849, z=29.497},
  {name="atmHack", id=277, x=129.216, y=-1292.347, z=29.269},
  {name="atmHack", id=277, x=287.645, y=-1282.646, z=29.659},
  {name="atmHack", id=277, x=289.012, y=-1256.545, z=29.440},
  {name="atmHack", id=277, x=295.839, y=-895.640, z=29.217},
  {name="atmHack", id=277, x=1686.753, y=4815.809, z=42.008},
  {name="atmHack", id=277, x=-302.408, y=-829.945, z=32.417},
  {name="atmHack", id=277, x=5.134, y=-919.949, z=29.557},
  {name="atmHack", id=277, x=-821.4, y=-1082.25, z=11.13},
  {name="atmHack", id=277, x=-146.83, y=-1035.24, z=29.34},
  {name="atmHack", id=277, x=-1109.5, y=-1690.57, z=4.37},
  {name="atmHack", id=277, x=-1315.46, y=-835.46, z=16.96},
  {name="atmHack", id=277, x=1172.02, y=2702.46, z=38.18},
  {name="atmHack", id=277, x=-1091.42, y=2708.52, z=18.95},
}

local atms = {
  {name="ATM", id=277, x=236.4638, y=217.4718, z=106.840}, -- national banken
  {name="ATM", id=277, x=265.0043, y=212.1717, z=106.780}, -- national banken
  {name="ATM", id=277, x=-216.3139, y = -1327.016, z = 30.89047}, -- Benny's Garage
  {name="ATM", id=277, x=301.9, y=-581.54, z=43.29}, -- Pillbox

}
function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

--===============================================
--==             Core Threading                == 
--===============================================
if bankMenu then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
		if nearBank() then
				DisplayHelpText("Tryk på ~INPUT_PICKUP~ for tilgå din ~b~bank-konto~s~")

			if IsControlJustPressed(1, 38) then
				exports['progressBars']:startUI(2500, "TILGÅR BANK-KONTO")
				playAnim('mp_common', 'givetake1_a', 2500)
				Citizen.Wait(2500)
				inMenu = true
				SetNuiFocus(true, true)
				SendNUIMessage({type = 'openGeneral'})
				TriggerServerEvent('bank:balance')
				local ped = GetPlayerPed(-1)
			end
		end
		if nearATM() then
				DisplayHelpText("Tryk på ~INPUT_PICKUP~ for at bruge ~b~ATM~s~")

			if IsControlJustPressed(1, 38) then
				if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
					exports['progressBars']:startUI(2500, "SÆTTER KORT I ATM")
					playAnim('mp_common', 'givetake1_a', 2500)
					Citizen.Wait(2500)
					inMenu = true
					SetNuiFocus(true, true)
					SendNUIMessage({type = 'openGeneral'})
					TriggerServerEvent('bank:balance')
					local ped = GetPlayerPed(-1)
				else
					TriggerEvent("pNotify:SendNotification",{text = "Du kan ~ikke tilgå en ATM fra et køretøj!",type = "warning",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				end	
			end
		end
		if nearAtmHackable() then

			if IsControlJustPressed(1, 38) then
				if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
					exports['progressBars']:startUI(2500, "SÆTTER KORT I ATM")
					playAnim('mp_common', 'givetake1_a', 2500)
					Citizen.Wait(2500)
					inMenu = true
					SetNuiFocus(true, true)
					SendNUIMessage({type = 'openGeneral'})
					TriggerServerEvent('bank:balance')
					local ped = GetPlayerPed(-1)
				else
					TriggerEvent("pNotify:SendNotification",{text = "Du kan ~ikke tilgå en ATM fra et køretøj!",type = "warning",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				end		
			end
		end

			if IsControlJustPressed(1, 322) then
			inMenu = false
				SetNuiFocus(false, false)
				SendNUIMessage({type = 'close'})
			end
		end
	end)
end

--===============================================
--==             Map Blips	                   ==
--===============================================
Citizen.CreateThread(function()
	if showblips then
	  for k,v in ipairs(banks)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 431)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 28)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(tostring(v.name))
		EndTextCommandSetBlipName(blip)
	  end
	end
end)

--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	
	local id = PlayerId()
	local playerName = name
	
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
	
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	SetNuiFocus(false, false)
			playAnim('mp_common', 'givetake1_a', 2500)
			Citizen.Wait(2500)
	SendNUIMessage({type = 'closeAll'})
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 1 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(atms) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 2 then
			return true
		end
	end
end

function nearAtmHackable()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(atmHack) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 2 then
			DrawText3Ds(search.x, search.y,search.z, "Tryk på ~g~[E]~s~ for ~b~ATM~s~. Tryk på ~g~[G]~s~ for at ~r~Hacke~s~") 
			return true
		end
	end
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 390
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
