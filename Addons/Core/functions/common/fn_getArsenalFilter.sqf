/* ----------------------------------------------------------------------------
Function: oni_core_fnc_getArsenalFilter

Description:
	Gets the whitelist array associated with a filter from
	`oni_core_arsenal_whitelist_loadouts`

Parameters:
	0: _filter - Filter which controls what objects are shown in the
				 arsenal <STRING>

Returns:
	Arsenal whitelist <ARRAY>

Examples:
	["WEST"] call oni_core_fnc_getArsenalFilter;

	[] call oni_core_fnc_getArsenalFilter;

Author:
	Arend

---------------------------------------------------------------------------- */
params [["_filter", "", [""]]];

[format["Getting whitelists for filter %1", _filter], "core\functions\common\fn_getArsenalFilter.sqf"] call oni_core_fnc_log;
private _whitelist = [];
switch (toLowerANSI _filter) do {
	case "Standard": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_standard; };
	case "Black": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_black; };
	case "Urban": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_urban; };
	case "Woodland": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_woodland; };
	case "Marine": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_marine; };
	case "Mission": { _whitelist = parseSimpleArray oni_core_arsenal_whitelist_mission; };
	default { _whitelist = true; };
};

// Is it empty?
if (_whitelist isEqualTo []) then {
	_whitelist = true;
	_filter = format["(was %1, now reset)", _filter];
	[format["Arsenal Whitelist is empty. Filling Arsenal with everything instead. %1", _filter], "core\functions\common\fn_getArsenalFilter.sqf"] call oni_core_fnc_log;
};

_whitelist;
