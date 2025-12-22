local utils = require("MVXIVY_Utils")
local config = require("ST_Nimble_Config")
local sandboxFns = require("ST_Nimble_SandboxOptions")

local lastGrantAt = {} -- key -> time seconds
local function getXPPerPulse()
  return sandboxFns.getOpt({"STNIMBLE_B42", "XPPerPulse"}, 10)
end

local function getMinInterval()
  return sandboxFns.getOpt({"STNIMBLE_B42", "MinIntervalSeconds"}, 1.0)
end

--- allow grant for 
---@param player IsoPlayer
local function allowGrant(player)
  local key = utils.getPlayerUniqueId(player)
  local t = utils.nowSeconds()
  local prev = lastGrantAt[key] or 0
  local minInterval = tonumber(getMinInterval()) or 1.0
  local dt = t - prev

  -- print("[NimbleXP] allowGrant player=" .. tostring(key)
  --   .. " t=" .. tostring(t)
  --   .. " prev=" .. tostring(prev)
  --   .. " dt=" .. tostring(dt)
  --   .. " minInterval=" .. tostring(minInterval))

  if dt < minInterval then return false end

  lastGrantAt[key] = t
  return true
end

-- /setaccesslevel MVXIVY admin

local function serverValidate(player)
  if not player or player:isDead() then
    return false
  end

  if player.isPlayerMoving and (not player:isPlayerMoving()) then
    return false
  end

  if player.getVehicle and player:getVehicle() then
    return false
  end

  -- TODO: need check it
  if player.isAiming and (not player:isAiming()) then
    return false
  end

  return true
end

local function grantNimbleXP(player)
  -- print("[NimbleXP] Granting Nimble XP to player " .. tostring(player:getDisplayName()))
  -- print("[NimbleXP] XP per pulse: " .. tostring(getXPPerPulse()))
  player:getXp():AddXP(Perks.Nimble, getXPPerPulse(), false, true, true)
end

local function onClientCommand(module, command, player, args)
  -- print("[NimbleXP] StandardizedNimbleXP_server.lua onClientCommand called")
  -- print("[NimbleXP] module: " .. tostring(module))
  -- print("[NimbleXP] command: " .. tostring(command)) 
  -- print("[NimbleXP] player: " .. tostring(player))
  if module ~= config.modId then return end
  if command ~= config.command then return end
  if not player then return end

  -- print("[NimbleXP] Passed initial checks")

  if not allowGrant(player) then return end
  -- if not serverValidate(player) then return end

  -- print("[NimbleXP] Passed validation checks, granting XP")

  grantNimbleXP(player)
end

Events.OnClientCommand.Add(onClientCommand)
