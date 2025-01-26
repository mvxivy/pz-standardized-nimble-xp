local modOptions = require("ST_Nimble_ModOptions")
modOptions.init()

local nimbleMultiplier = {5, 10, 25, 50, 100, 1000};
local nimbleDelay = {250, 500, 1000, 2500, 5000};
local xpThrottleNimble = 0; -- Just a counting variable.

local NimbleBonusXP = function()
  local player = getPlayer();
  local xp = player:getXp();
  if player:isAiming() then
    local delay = nimbleDelay[modOptions.ComboBoxDelay:getValue()]
		local multiplier = nimbleMultiplier[modOptions.ComboBoxMultiplier:getValue()]

    if (xpThrottleNimble > delay) then
      xp:AddXP(Perks.Nimble, multiplier);
      xpThrottleNimble = 0;
    end
    xpThrottleNimble = xpThrottleNimble + 1;
  end
end

Events.OnPlayerMove.Add(NimbleBonusXP);

-- local function Debug ()
-- 	print("selected mutliplier option number: " .. config.ComboBoxMultiplier:getValue())
-- 	print("selected multiplier option value: " .. nimbleMultiplier[tonumber(config.ComboBoxMultiplier:getValue())])
-- 	print("selected delay option number: " .. config.ComboBoxDelay:getValue())
-- 	print("selected delay option value: " .. nimbleDelay[tonumber(config.ComboBoxDelay:getValue())])
-- end

-- DEBUG
-- Events.OnPlayerMove.Add(Debug);
