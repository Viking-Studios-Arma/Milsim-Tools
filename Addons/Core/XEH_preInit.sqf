private _oni_core_settings = [
	[
		"oni_core_debug",
		"CHECKBOX",
		["Enable Debug", "Tick enable ONI debug messages to appear in RPT and systemChat"],
		["ONI Common", "Development"],
		false
	],
	[
		"oni_core_arsenal_objects",
		"EDITBOX",
		["Arsenal Objects", "Classnames, separated by commas and without double quotations, of objects that are spawnable by ""Add Filtered Arsenal"" module"],
		["ONI Zeus", "Modules"],
		"C_supplyCrate_F,B_Slingload_01_Ammo_F"
	],
	[
		"oni_core_respawn_timer",
		"SLIDER",
		["Respawn Timer (seconds)", "Number of seconds player waves need to wait before respawn (0 -> 600 (10 minutes))"],
		["ONI Zeus", "Respawn"],
		[1, 600, 5, 0],
		1,
		{
			setPlayerRespawnTime _this;
		}
	],
	[
		"oni_core_map_volume",
		"SLIDER",
		["Map Volume", "Volume to set when in a vehicle and looking at the map (so that you don't have to listen to loud as fuck helicopter rotors)"],
		"ONI Common",
		[0, 1, 0.20, 2]
	],
	[
		"oni_core_arsenal_whitelist_mission",
		"EDITBOX",
		["Mission", "Mission specific equipment whitelist"],
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

// Create a climate select setting for each detected world
private _name = "";
private _prettyName = "";
{
	_name = configName _x;
	_prettyName = getText (configfile >> "CfgWorlds" >> _name >> "description");
	[
		format["oni_core_climate_%1", _name],
		"LIST",
		[format["Map Climate - %1", _prettyName], "Select the appropriate climate for this map"],
		["ONI Arsenal", "World Climates"],
		[
			["all", "woodland", "multicam", "desert", "arctic"], // Code (keep the same, else settings will reset)
			["All", "Flecktarn", "Multitarn", "Tropentarn", "Arctic"], // Display name
			0
		],
		1,
		{},
		true
	] call CBA_Settings_fnc_init;
} forEach ([
	("true" configClasses (configFile >> "CfgWorldList")),
	[],
	{getText (configFile >> "CfgWorlds" >> (configName _x) >> "description")}
] call BIS_fnc_sortBy);

CHVD_allowNoGrass = false;
