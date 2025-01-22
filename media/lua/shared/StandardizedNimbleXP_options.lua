--Default options.
local SETTINGS = { 
	options = {
		dropdown1 = 2,
		dropdown2 = 2,
	},
	names= {
		dropdown1 = "Xp Multiplier",
		dropdown2 = "Xp Delay",
	},
	mod_id = "STNIMBLE",
	mod_shortname = "Standardized Nimble XP"
}

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
	--ModOptions:getInstance(SETTINGS, "STNIMBLE", "StandardizedNimbleXP")
	local settings = ModOptions:getInstance(SETTINGS)
	
	local drop1 = settings:getData("dropdown1")
	drop1[1] = "5x"
	drop1[2] = "10x"
	drop1[3] = "25x"
	drop1[4] = "50x"
	drop1[5] = "100x"
	drop1[6] = "1000x"
	drop1.tooltip = "Xp Multiplier for Nimble skill"
	local drop2 = settings:getData("dropdown2")
	drop2[1] = "250"
	drop2[2] = "500"
	drop2[3] = "1000"
	drop2[4] = "2500"
	drop2[5] = "5000"
	drop2.tooltip = "Delay between bar xp rewards, default: 1000 (~9-10 sec)."

end

StandardizedNimbleXP_global = {}
StandardizedNimbleXP_global.SETTINGS = SETTINGS