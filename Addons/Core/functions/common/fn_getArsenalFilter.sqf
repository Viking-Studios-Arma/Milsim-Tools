/* ----------------------------------------------------------------------------
Function: oni_core_fnc_getArsenalFilter

Description:
	Gets the whitelist array associated with a filter from
	`bnb_f_arsenal_whitelist_loadouts`

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
	case "standard": { _whitelist = parseSimpleArray bnb_f_arsenal_whitelist_standard; };
	case "multicam": { _whitelist = parseSimpleArray bnb_f_arsenal_whitelist_multicam; };
	case "desert": { _whitelist = parseSimpleArray bnb_f_arsenal_whitelist_desert; };
	case "woodland": { _whitelist = parseSimpleArray bnb_f_arsenal_whitelist_woodland; };
	case "historic": { _whitelist = parseSimpleArray bnb_f_arsenal_whitelist_historic; };
	case "mission": { _whitelist = parseSimpleArray bnb_es_arsenal_whitelist_mission; };
	default { _whitelist = true; };
};

// Is it empty?
if (_whitelist isEqualTo []) then {
	_whitelist = true;
	_filter = format["(was %1, now reset)", _filter];
	[format["Arsenal Whitelist is empty. Filling Arsenal with everything instead. %1", _filter], "core\functions\common\fn_getArsenalFilter.sqf"] call oni_core_fnc_log;
};

_whitelist;
