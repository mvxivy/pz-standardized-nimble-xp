--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Updated By:		Mortazar																					**
--** 		Last update at: 	22-01-2025																		**
--****************************************************************************************************************
--**		Mod:			Standardized Nimble XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--****************************************************************************************************************

--************************************************************************************************
--**  Would not recommend changing anything past this point unless you know what you are doing. **
--************************************************************************************************
local config = StandardizedNimbleXP_config
local nimbleMultiplier = {5,10,25,50,100,1000};
local nimbleDelay = {250,500,1000,2500,5000};
xpThrottleNimble = 0; -- Just a counting variable.

NimbleBonusXP = function()
	xpThrottleNimble = tonumber(xpThrottleNimble);
	local player = getPlayer();
	local xp = player:getXp();
	-- if you're aiming and walking
	if player:isAiming() then

		local delay = tonumber(nimbleDelay[tonumber(config.ComboBoxDelay:getValue())])

		if(tonumber(xpThrottleNimble) > delay) then
			xp:AddXP(Perks.Nimble, tonumber(nimbleMultiplier[tonumber(config.ComboBoxMultiplier:getValue())]));
			xpThrottleNimble = 0;
		end
		xpThrottleNimble = tonumber(xpThrottleNimble) + 1;
	end
end

Events.OnPlayerMove.Add(NimbleBonusXP);

local function Debug ()
	print("selected mutliplier option number: " .. config.ComboBoxMultiplier:getValue())
	print("selected multiplier option value: " .. nimbleMultiplier[tonumber(config.ComboBoxMultiplier:getValue())])
	print("selected delay option number: " .. config.ComboBoxDelay:getValue())
	print("selected delay option value: " .. nimbleDelay[tonumber(config.ComboBoxDelay:getValue())])
end

-- DEBUG
-- Events.OnPlayerMove.Add(Debug);