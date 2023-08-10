private _oni_core_settings = [
	[
		"oni_core_arsenal_whitelist_standard",
		"EDITBOX",
		["Standard", "Standard ONI equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
		"oni_core_arsenal_whitelist_black",
		"EDITBOX",
		["Black", "Black equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
		"oni_core_arsenal_whitelist_marine",
		"EDITBOX",
		["Marine", "Marine equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
		"oni_core_arsenal_whitelist_woodland",
		"EDITBOX",
		["Woodland", "Woodland equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
		"oni_core_arsenal_whitelist_urban",
		"EDITBOX",
		["Urban", "Urban UK equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	]
];

{_x call CBA_Settings_fnc_init;} forEach _oni_core_settings;
