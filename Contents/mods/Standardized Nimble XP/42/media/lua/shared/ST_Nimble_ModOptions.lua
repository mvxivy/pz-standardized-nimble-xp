local config = require("ST_Nimble_Config")
local MVXIVY_Utils = require("MVXIVY_Utils")
local modOptions = {}
--- init mod options in game settings menu
---@param isSingleplayer boolean
function modOptions.init(isSingleplayer)
	isSingleplayer = isSingleplayer or true
  local UI = PZAPI.ModOptions:create(config.modId, config.modName)

	local ComboBoxFactory = MVXIVY_Utils.useComboBoxFactory(
    "ST_Nimble_",
    "UI_options_" .. config.modId .. "_",
    UI
  )

	if isSingleplayer then
		modOptions.ComboBoxMultiplier = ComboBoxFactory{
			name = "Multiplier",
			label = "multiplier_label",
			items = {"5x", "10x", "25x", "50x", "100x", "1000x"},
			defaultItem = 2,
			description = "multiplier_description"
		}	
	end
	

	modOptions.ComboBoxDelay = ComboBoxFactory{
		name = "Delay",
		label = "delay_label",
		items = {"250", "500", "1000", "2500", "5000"},
		defaultItem = 3,
		description = "delay_description"
	}
end

return modOptions