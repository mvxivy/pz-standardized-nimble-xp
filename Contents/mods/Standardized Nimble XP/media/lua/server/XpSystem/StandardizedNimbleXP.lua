--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Mod:			Standardized Nimble XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--****************************************************************************************************************

--ONLY EDIT IF YOU DO **NOT** HAVE ModOptions
		--*********************************************************************************************
		--**				ALTER THIS NUMBER TO INCREASE/DECREASE Nimble XP MULTIPLIER				 **
		NimbleXpMultiplier = 10;
		--*********************************************************************************************

		--*********************************************************************************************************
		--**				ALTER THIS NUMBER TO INCREASE/DECREASE DELAY BETWEEN Nimble XP POINTS				 **
		NimbleXpDelay = 1000;
		--*********************************************************************************************************



--************************************************************************************************
--**  Would not recommend changing anything past this point unless you know what you are doing. **
--************************************************************************************************
local SETTINGS = StandardizedNimbleXP_global.SETTINGS

local nimbleMult = {5,10,25,50,100,1000};
local nimbleDelay = {250,500,1000,2500,5000};
xpThrottleNimble = 0; -- Just a counting variable.

-- used everytime the player moves
NimbleBonusXP = function()
xpThrottleNimble = tonumber(xpThrottleNimble);
	local player = getPlayer();
	local xp = player:getXp();
	-- if you're aiming and walking
	if player:isAiming() then
		if(tonumber(xpThrottleNimble) > tonumber(NimbleXpDelay)) then
			xp:AddXP(Perks.Nimble, tonumber(NimbleXpMultiplier));
			xpThrottleNimble = 0;
		end
		xpThrottleNimble = tonumber(xpThrottleNimble) + 1;
	end
end

NimbleBonusXP_ModOptions = function()
xpThrottleNimble = tonumber(xpThrottleNimble);
	local player = getPlayer();
	local xp = player:getXp();
	-- if you're aiming and walking
	if player:isAiming() then
		if(tonumber(xpThrottleNimble) > tonumber(nimbleDelay[tonumber(SETTINGS.options.dropdown2)])) then
			xp:AddXP(Perks.Nimble, tonumber(nimbleMult[tonumber(SETTINGS.options.dropdown1)]));
			xpThrottleNimble = 0;
		end
		xpThrottleNimble = tonumber(xpThrottleNimble) + 1;
	end
end


if(SETTINGS) then
	Events.OnPlayerMove.Add(NimbleBonusXP_ModOptions); -- Calls the above function every time player moves.
	else
		Events.OnPlayerMove.Add(NimbleBonusXP); -- Calls the above function every time player moves.
end
Events.OnGameStart.Add(function()
  if not isClient() then -- only host may take these options
    --print("dropdown1 = ", SETTINGS.options.dropdown1)
	--print("INDEXING = ",nimbleMult[1])
  end
end)