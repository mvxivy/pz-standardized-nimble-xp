local utils = require("MVXIVY_Utils")
local config = require("ST_Nimble_Config")
local modOptions = require("ST_Nimble_ModOptions")
modOptions.init(isMultiplayer())

local nimbleMultiplier = {5, 10, 25, 50, 100, 1000};
local nimbleDelay = {250, 500, 1000, 2500, 5000};
local xpPulseDelay = 0; -- counter for pulse delay

if isClient() and isMultiplayer() then
  -- MULTIPLAYER
  --- check aim walking
  ---@param player IsoPlayer
  local function isAimWalking(player)
    if not player then
      return false
    end

    local aiming = player:isAiming()
    local moving = player:isPlayerMoving()
    local sprinting = player:isSprinting()

    return aiming and moving and (not sprinting)
  end

  local getNimbleBonusXPOnServer = function()
    local player = getPlayer();
    local xp = player:getXp();
    if isAimWalking(player) then
      local delay = nimbleDelay[modOptions.ComboBoxDelay:getValue()]

      if (xpPulseDelay > delay) then
        print("[NimbleXP] StandardizedNimbleXP.lua sending server command for XP grant");
        sendClientCommand(config.modId, config.command, {});
        xpPulseDelay = 0;
      end
      xpPulseDelay = xpPulseDelay + 1;
    end
  end

  Events.OnPlayerUpdate.Add(getNimbleBonusXPOnServer);
else
  -- SINGLEPLAYER
  local function getNimbleBonusXP(Player)
    local player = Player or getPlayer();
    local xp = player:getXp();
    if player:isAiming() then
      local delay = nimbleDelay[modOptions.ComboBoxDelay:getValue()]
      local multiplier = nimbleMultiplier[modOptions.ComboBoxMultiplier:getValue()]
      if not multiplier then
        multiplier = 10
      end

      if (xpPulseDelay > delay) then
        xp:AddXP(Perks.Nimble, multiplier);
        xpPulseDelay = 0;
      end
      xpPulseDelay = xpPulseDelay + 1;
    end
  end

  Events.OnPlayerMove.Add(getNimbleBonusXP)
end

-- local function Debug ()
-- 	print("selected mutliplier option number: " .. config.ComboBoxMultiplier:getValue())
-- 	print("selected multiplier option value: " .. nimbleMultiplier[tonumber(config.ComboBoxMultiplier:getValue())])
-- 	print("selected delay option number: " .. config.ComboBoxDelay:getValue())
-- 	print("selected delay option value: " .. nimbleDelay[tonumber(config.ComboBoxDelay:getValue())])
-- end

-- DEBUG
-- Events.OnPlayerMove.Add(Debug);
