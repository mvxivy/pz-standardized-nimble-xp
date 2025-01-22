local config = StandardizedNimbleXP_config

local function InitConfig() 
	local options = PZAPI.ModOptions:create(config.ModId, config.ModName)

	options:addDescription(getText("UI_options_STNIMBLE_B42_multiplier_description"))

	config.ComboBoxMultiplier = options:addComboBox(
		"combobox1",
		getText("UI_options_STNIMBLE_B42_multiplier_label")
	)

	config.ComboBoxMultiplier:addItem("5x", false)
	config.ComboBoxMultiplier:addItem("10x", true)
	config.ComboBoxMultiplier:addItem("25x", false)
	config.ComboBoxMultiplier:addItem("50x", false)
	config.ComboBoxMultiplier:addItem("100x", false)
	config.ComboBoxMultiplier:addItem("1000x", false)

	options:addDescription(getText("UI_options_STNIMBLE_B42_delay_description"))

	config.ComboBoxDelay = options:addComboBox(
		"combobox2",
		getText("UI_options_STNIMBLE_B42_delay_label")
	)

	config.ComboBoxDelay:addItem("250", false)
	config.ComboBoxDelay:addItem("500", true)
	config.ComboBoxDelay:addItem("1000", false)
	config.ComboBoxDelay:addItem("2500", false)
	config.ComboBoxDelay:addItem("5000", false)
end

InitConfig()