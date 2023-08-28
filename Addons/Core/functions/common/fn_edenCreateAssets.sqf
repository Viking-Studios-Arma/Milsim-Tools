/* ----------------------------------------------------------------------------
	Function: oni_core_fnc_edenCreateAssets

	Description:
	Creates mission slots, modules and markers.

	Parameters:
	0: _callsign - The platoon callsign that all sections will use <String>
	1: _zeusCallsign - The callsign that HQ will use <String>
	2: _camo - The camo the units will use <String>
	3: _numberOfSections - The number of sections to spawn <Number>
	4: _createDefaults - Whether to create a section to use as default loadout units <Bool>

	Returns:
	Nothing.

	Examples:
	["Odin", "Valhalla", "MTP", 3, false] call oni_core_fnc_edenCreateAssets;

	Author:
	Met
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_callsign", "Raider", [""]], ["_zeusCallsign", "Monarch", [""]], ["_camo", "MTP", [""]], ["_numberOfSections", 3, [0]], ["_createDefaults", false, [false]]];

if (_callsign == "") then {
	_callsign = "Raider";
};

if (_zeusCallsign == "") then {
	_zeusCallsign = "Monarch";
};

if (_camo == "") then {
	_camo = "MTP";
};

_camo = toUpper _camo;
_nameZeus = format ["%1_zeus", _camo];
_nameSection = format ["%1_section", _camo];
_nameCommand = format ["%1_command", _camo];
_nameDefaults = format ["%1_defaults", _camo];

_centralPos = screenToWorld [0, 0];
_entities =
[
	[
		["Marker", "mil_circle", _centralPos vectorAdd [10, 0]],
		["markerName", "respawn"],
		["text", "respawn"]
	],
	[
		["Logic", "ModuleCurator_F", _centralPos vectorAdd [-1, 0]],
		["ModuleCurator_F_Owner", "zeusOne"],
		["ModuleCurator_F_Name", "Active Zeus"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "ModuleCurator_F", _centralPos vectorAdd [-1, -1]],
		["ModuleCurator_F_Owner", "zeusTwo"],
		["ModuleCurator_F_Name", "Assistant Zeus"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "ModuleCurator_F", _centralPos vectorAdd [-1, -2]],
		["ModuleCurator_F_Owner", "#adminLogged"],
		["ModuleCurator_F_Name", "Admin"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "HeadlessClient_F", _centralPos vectorAdd [-2, 0]],
		["ControlMp", true],
		["name", "HC1"]
	],
	[
		["Logic", "HeadlessClient_F", _centralPos vectorAdd [-2, -1]],
		["ControlMp", true],
		["name", "HC2"]
	],
	[
		["Logic", "HeadlessClient_F", _centralPos vectorAdd [-2, -2]],
		["ControlMp", true],
		["name", "HC3"]
	],
	[
		["Object", "B_supplyCrate_F", _centralPos vectorAdd [-3, 6]],
		["allowDamage", false],
		["ArsenalObject", true]
	],
	[
		["Logic", "ONI_CORE_Barracks_Module", _centralPos vectorAdd [-4, 7]],
		["ONI_CORE_Barracks_Module_ArsenalFilter", "Standard"],
		["ArsenalObject", true]
	],
	[
		["Object", "B_supplyCrate_F", _centralPos vectorAdd [-5, 6]],
		["allowDamage", false],
		["ArsenalObject", true]
	]
];

_sections =
[
	[
		[configfile >> "CfgGroups" >> "West" >> "oni_core_compositions" >> "infantry" >> _nameCommand, _centralPos vectorAdd [0, 0]],
		"Command",
		["description", format ["1: 1IC@%1 1-Actual", _callsign ]]
	],
	[
		[configfile >> "CfgGroups" >> "West" >> "oni_core_compositions" >> "infantry" >> _nameZeus, _centralPos vectorAdd [1, 2]],
		"Zeus",
		["description", format ["1: Zeus@%1", _zeusCallsign]]
	]
];

// Individual entities, such as arsenals and headless clients
_last = "";
{
	_entity = _x select 0;
	_attributeOne = _x select 1;
	_attributeTwo = _x select 2;
	_attributeThree = _x select 3;
	_current = create3DENEntity _entity, _current set3DENAttribute _attributeOne, _current set3DENAttribute _attributeTwo, _current set3DENAttribute _attributeThree;
	if ((_attributeTwo select 0) == "ArsenalObject") then {
		add3DENConnection ["Sync", [_last], _current];
		_last = _current;
	};
} forEach _entities;

// The main sections
_num = 1;
for "_i" from 1 to _numberOfSections do {
	create3DENComposition [configfile >> "CfgGroups" >> "West" >> "oni_core_compositions" >> "infantry" >> _nameSection, _centralPos vectorAdd [_num, 0, 0]];
	set3DENAttributes [[get3DENSelected "Group", "groupID", format ["1-%1 Sec", _i]], [get3DENSelected "Object", "ControlMP", true]];
	_group = get3DENselected "Object" select 0;
	_ix = 3;
	{
		_unitDisplayName = [configfile >> "CfgVehicles" >> typeOf _x] call BIS_fnc_displayName;
		if (_unitDisplayName == "IC MTP" && !isFormationLeader _x) then {
			_x set3DENAttribute ["description", "2: 2IC"];
		} else {
			if (_x getUnitTrait "Medic") then {
				_x set3DENAttribute ["description", "3: Medic"];
			} else {
				if (_ix <= 6) then {
					_x set3DENAttribute ["description", format ["%1: Open", _ix]];
				} else {
					_x set3DENAttribute ["description", format ["%1: Rifleman", _ix]];
				};
				_ix = _ix + 1;
			};
		};
	} forEach units _group;
	leader _group set3DENAttribute ["description", format ["1: 1IC@%1 1-%2", _callsign, _i]];
	set3DENSelected [];
	_num = _num + 2;
};

// Command and Zeus
{
	_configPath = _x select 0;
	_attributeOne = _x select 1;
	_attributeTwo = _x select 2;
	create3DENComposition _configPath;
	set3DENAttributes [[get3DENSelected "Group", "groupID", _attributeOne], [get3DENSelected "Object", "ControlMP", true]];
	_groupComp = get3DENSelected "Object";
	_group = _groupComp select 0;
	if ((_attributeOne) == "Zeus") then {
		leader _group set3DENAttribute ["name", "zeusOne"];
		_asZeus = _groupComp select 1;
		_asZeus set3DENAttribute ["description", "2: A.Zeus"];
		_asZeus set3DENAttribute ["name", "zeusTwo"];
	} else {
		{
			_unitDisplayName = [configfile >> "CfgVehicles" >> typeOf _x] call BIS_fnc_displayName;
			if (_unitDisplayName == "IC MTP" && !isFormationLeader _x) then {
				_x set3DENAttribute ["description", "2: 2IC"];
			} else {
				if (_x getUnitTrait "Medic") then {
					_x set3DENAttribute ["description", "3: Medic"];
				} else {
					_x set3DENAttribute ["description", "4: Open"];
				};
			};
		} forEach units _group;
	};
	leader _group set3DENAttribute _attributeTwo;
	set3DENSelected [];
} forEach _sections;

// default Loadouts
if (_createDefaults) then {
	create3DENComposition [configfile >> "CfgGroups" >> "West" >> "oni_core_compositions" >> "infantry" >> _nameDefaults, _centralPos vectorAdd [_num + 2, 3, 0]];
	set3DENAttributes [[get3DENSelected "Group", "groupID", "Default Loadouts"], [get3DENSelected "Object", "ONI_CORE_3den_Loadout", true]];
	_groupComp = get3DENSelected "Object";
	{
		_unitDisplayName = [configfile >> "CfgVehicles" >> typeOf _x] call BIS_fnc_displayName;
		_x set3DENAttribute ["ONI_CORE_3den_LoadoutName", _unitDisplayName];
	} forEach _groupComp;
	set3DENSelected [];
};
