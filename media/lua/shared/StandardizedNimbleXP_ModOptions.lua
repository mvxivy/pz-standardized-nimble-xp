local config = {
	ModName = "Standardized Nimble XP",
	ModId = "STNIMBLE_B42",
	ComboBoxMultiplier = nil,
	ComboBoxDelay = nil
}

local function InitConfig() {
	local options = PZAPI.ModOptions:create(config.ModId, config.ModName)
	
	options:addTitle(getText("UI_STNIMBLE_B42_ModOptions_title"))

	config.ComboBoxMultiplier = options:addComboBox(
		"combobox1",
		getText("UI_STNIMBLE_B42_ModOptions_multiplier_label"),
		getText("UI_STNIMBLE_B42_ModOptions_multiplier_tooltip")
	)

	config.ComboBoxMultiplier.addItem("5x", false)
	config.ComboBoxMultiplier.addItem("10x", true)
	config.ComboBoxMultiplier.addItem("25x", false)
	config.ComboBoxMultiplier.addItem("50x", false)
	config.ComboBoxMultiplier.addItem("100x", false)
	config.ComboBoxMultiplier.addItem("1000x", false)

	config.ComboBoxDelay = options:addComboBox(
		"combobox2",
		getText("UI_STNIMBLE_B42_ModOptions_delay_label"),
		getText("UI_STNIMBLE_B42_ModOptions_delay_tooltip")
	)

	config.ComboBoxDelay.addItem("250", false)
	config.ComboBoxDelay.addItem("500", true)
	config.ComboBoxDelay.addItem("1000", false)
	config.ComboBoxDelay.addItem("2500", false)
	config.ComboBoxDelay.addItem("5000", false)
}

StandardizedNimbleXP_global = {}
StandardizedNimbleXP_global.config = config;