local config = require("ST_Nimble_Config")
local MVXIVY_Utils = require("MVXIVY_Utils")
local modOptions = {}

function modOptions.init()
  local UI = PZAPI.ModOptions:create(config.modId, config.modName)

	local ComboBoxFactory = MVXIVY_Utils.useComboBoxFactory(
    "ST_Nimble_",
    "UI_options_" .. config.modId .. "_",
    UI
  )

	modOptions.ComboBoxMultiplier = ComboBoxFactory{
		name = "Multiplier",
		label = "multiplier_label",
		items = {"5x", "10x", "25x", "50x", "100x", "1000x"},
		defaultItem = 2,
		description = "multiplier_description"
	}

	modOptions.ComboBoxDelay = ComboBoxFactory{
		name = "Delay",
		label = "delay_label",
		items = {"250", "500", "1000", "2500", "5000"},
		defaultItem = 3,
		description = "delay_description"
	}
end

return modOptions