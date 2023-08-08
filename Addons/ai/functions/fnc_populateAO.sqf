#include "script_component.hpp"

/*
Function: mti_ai_fnc_populateAO

Description:
    Quickly populates an entire AO according to a variety of parameters.
    Available factions have to be defined as subclasses of MTI_PopulateAO_Factions.

Arguments:
    _grpPrefix - The prefix for the group IDs <STRING>
    _center - The center position of the area we want to populate <POSITION 3D>
    _radius - The radius of the area we want to populate <SCALAR>
    _faction - The faction which we want to use for populating the AO (subclass of MTI_PopulateAO_Factions) <STRING>
    _args_garr - Garrison Parameters <ARRAY OF [Group Count, Radius]>
    _args_inf - Infantry Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _args_inf_aa - AA Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _args_inf_at - AT Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _args_sniper - Sniper Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _args_veh_light - Light Vehicles Parameters <ARRAY OF [Min Amount of Vehicles, Random Upper Bound of Vehicles]>
    _args_veh_heavy - Heavy/Armoured Vehicle Parameters <ARRAY OF [Min Amount of Vehicles, Random Upper Bound of Vehicles]>
    _args_veh_random - Random Vehicles Parameters <ARRAY OF [Min Amount of Vehicles, Random Upper Bound of Vehicles]>
    _args_air - Air Assets Parameters <ARRAY OF [Min Amount of Aircraft, Random Upper Bound of Aircraft, Altitude]>
    _patrolMethod - Method to use for plotting the patrol paths <STRING, one of ["RANDOM", "ROADS"], default: "RANDOM">

Return Value:
    None

Example:
    (begin example)
        [
            "aurek",
	        [2955.43,6010.11,0],
	        500,
	        "MTI_CIS",
	        [5, 100],
	        [3, 5],
	        [2, 3],
	        [3, 4],
	        [2, 3],
	        [4, 5],
	        [2, 3],
	        [2, 3],
            [1, 1, 100]
            "RANDOM"
        ] call mti_ai_fnc_populateAO;
    (end)

Author:
	MitchJC, Mokka
*/

if (!isserver) exitwith {};

params [
    ["_grpPrefix","aurek", [""]],
    ["_center", [0,0,0], [[],objNull,""]],
    ["_radius", 500, [0]],
    ["_faction", "MTI_CIS", [""]],
	["_args_garr", [0,0]],
	["_args_inf", [0,0]],
	["_args_inf_aa", [0,0]],
	["_args_inf_at", [0,0]],
	["_args_sniper", [0,0]],
	["_args_veh_light", [0,0]],
	["_args_veh_heavy", [0,0]],
	["_args_veh_random", [0,0]],
	["_args_air", [0,0,0]],
    ["_patrolMethod", "RANDOM"]
];

TRACE_1("args",_this);

switch(typeName _center) do {
    case "OBJECT": { _center = getPos _center; };
    case "STRING": { _center = getMarkerPos _center; };
    default {};
};

if (_center isEqualTo [0,0,0]) exitWith {
    ERROR("center cannot be null pos!");
};

_center set [2, 0];

_args_garr params ["_garr_count", "_garr_radius"];
_args_inf params ["_inf_min", "_inf_max"];
_args_inf_aa params ["_inf_aa_min", "_inf_aa_max"];
_args_inf_at params ["_inf_at_min", "_inf_at_max"];
_args_sniper params ["_sniper_min", "_sniper_max"];
_args_veh_light params ["_veh_light_min", "_veh_light_max"];
_args_veh_heavy params ["_veh_heavy_min", "_veh_heavy_max"];
_args_veh_random params ["_veh_random_min", "_veh_random_max"];
_args_air params ["_air_min", "_air_max", "_air_altitude"];

// determine actual amount of groups to spawn
private _inf_count = _inf_min + abs(floor(random (_inf_max - _inf_min)));
private _inf_aa_count = _inf_aa_min + abs(floor(random (_inf_aa_max - _inf_aa_min)));
private _inf_at_count = _inf_at_min + abs(floor(random (_inf_at_max - _inf_at_min)));
private _sniper_count = _sniper_min + abs(floor(random (_sniper_max - _sniper_min)));
private _veh_light_count = _veh_light_min + abs(floor(random (_veh_light_max - _veh_light_min)));
private _veh_heavy_count = _veh_heavy_min + abs(floor(random (_veh_heavy_max - _veh_heavy_min)));
private _veh_random_count = _veh_random_min + abs(floor(random (_veh_random_max - _veh_random_min)));
private _air_count = _air_min + abs(floor(random (_air_max - _air_min)));

TRACE_8("amounts of groups to spawn",_inf_count,_inf_aa_count,_inf_at_count,_sniper_count,_veh_light_count,_veh_heavy_count,_veh_random_count,_air_count);

// set up position and patrol methods
_patrolMethod = toUpper _patrolMethod;

private ["_fnc_patrol_Inf", "_fnc_patrol_Inf_Spec", "_fnc_patrol_Veh", "_fnc_getPos_Inf", "_fnc_getPos_Veh", "_fnc_getPos_Air"];

switch (_patrolMethod) do {
    case "ROAD": {
        _fnc_patrol_Inf = compile format["[(_this select 0), (_this select 3)] call %1;",QFUNC(patrolRoad)];
        _fnc_patrol_Inf_Spec = compile format["[(_this select 0), (_this select 3)] call %1;",QFUNC(patrolRoad)];
        _fnc_patrol_Veh = compile format["[(_this select 0), (_this select 3)] call %1;",QFUNC(patrolRoad)];

        _fnc_getPos_Inf = compile "selectRandom (_this select 2)";
        _fnc_getPos_Veh = compile "selectRandom (_this select 2)";
        _fnc_getPos_Air = compile "selectRandom (_this select 2)";
    };
    case "RANDOM": {
        _fnc_patrol_Inf = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), [""SAD"", ""MOVE""] select (random 1 > 0.33), [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";
        _fnc_patrol_Inf_Spec = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), ""SAD"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";
        _fnc_patrol_Veh = compile "[(_this select 0), (_this select 1), (_this select 2) / 2, 3 + round (random 2), ""MOVE"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";

        _fnc_getPos_Inf = compile format["[[[(_this select 0), (_this select 1)],[]],[""water""]] call %1;",QFUNC(findSpawnPos)];
        _fnc_getPos_Veh = compile format["[[[(_this select 0), (_this select 1)], []], [""water""], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call %1;",QFUNC(findSpawnPos)];
        _fnc_getPos_Air = compile format["[[[(_this select 0), (_this select 1)],[]],[]] call %1;",QFUNC(findSpawnPos)];
    };
    default {
        if (_patrolMethod isEqualType "") exitWith {
            ERROR_1("invalid patrol method supplied: %1", _patrolMethod);
        };
    };
};

// compile unit lists for spawning
private _factionConfig = configFile >> "MTI_PopulateAO_Factions" >> _faction;

if !(isClass _factionConfig) exitWith {
    ERROR_1("invalid faction: %1", _faction);
};

// verify side
private _factionSide = getNumber (_factionConfig >> "side");

switch (_factionSide) do {
    case 0: { _factionSide = east; };
    case 1: { _factionSide = west; };
    case 2: { _factionSide = independent; };
    case 3: { _factionSide = civilian; };
    default { _factionSide = sideEmpty; };
};

if (_factionSide isEqualTo sideEmpty) exitWith {
    ERROR_1("given faction %1 has invalid side!", _faction);
};

// compile path to CfgGroups
private _groupConfig = getArray (_factionConfig >> "GroupPath");
_groupConfig params ["_gr_side", "_gr_faction", "_gr_type"];
_groupConfig = configFile >> "CfgGroups" >> _gr_side >> _gr_faction >> _gr_type;

if !(isClass _groupConfig) exitWith {
    ERROR_1("invalid group path: %1", format[ARR_4("configFile >> ""CfgGroups"" >> ""%1"" >> ""%2"" >> ""%3""",_gr_side,_gr_faction,_gr_type)]);
};

// get group/vehicle lists
private _inf_groups = getArray (_factionConfig >> "Inf_Groups");
private _inf_aa_groups = getArray (_factionConfig >> "Inf_AA_Groups");
private _inf_at_groups = getArray (_factionConfig >> "Inf_AT_Groups");
private _sniper_groups = getArray (_factionConfig >> "Sniper_Groups");
private _veh_light_list = getArray (_factionConfig >> "Veh_Light_List");
private _veh_heavy_list = getArray (_factionConfig >> "Veh_Heavy_List");

private _veh_random_list = +_veh_light_list;
_veh_random_list append _veh_heavy_list;

private _air_list = getArray (_factionConfig >> "Air_List");

TRACE_8("faction unit pool compiled",_inf_groups,_inf_aa_groups,_inf_at_groups,_sniper_groups,_veh_light_list,_veh_heavy_list,_veh_random_list,_air_list);

// if using road patrols, populate road waypoints here
private _road_waypoints = [];

if (_patrolMethod isEqualTo "ROAD") then {
    // estimate amount of positions needed
    private _minBound = 6 * (_inf_max + _inf_aa_max + _inf_at_max + _sniper_max + _veh_light_max + _veh_heavy_max + _veh_random_max);

    _road_waypoints = [_center, _radius, _minBound] call FUNC(getRoadWaypoints);

    if (count _road_waypoints == 0) exitWith {
        ERROR("no road waypoints found!");
    };
};

// actually spawn the units in
// we have to do some stuff to them later (add to zeus, dynamic sim, etc), so we want to keep them all in array
private _units = [];
private _vehicles = [];

// exit now if we are dealing with 3den
if (is3DEN) exitWith {
    [
        _center, [_radius, _garr_radius], _grpPrefix, _patrolMethod, _road_waypoints, _factionSide,
        [_fnc_getPos_Inf, _fnc_getPos_Veh, _fnc_getPos_Air],
        [_garr_count, _inf_count, _inf_aa_count, _inf_at_count, _sniper_count, _veh_light_count, _veh_heavy_count, _veh_random_count, _air_count],
        [_inf_groups, _inf_aa_groups, _inf_at_groups, _sniper_groups, _veh_light_list, _veh_heavy_list, _veh_random_list, _air_list],
        _air_altitude
    ] call FUNC(3den_populateAO);
};

//----- GARRISONS
if ((_garr_count > 0) && ((count _inf_groups) > 0)) then {
    // spawn wanted amount of groups
    private _garr_units = [];

    for "_x" from 0 to _garr_count do {
		private _groupClass = _groupConfig >> (selectRandom _inf_groups);
        private _group = [_center, _factionSide, _groupClass] call BIS_fnc_spawnGroup;

        _group setGroupIdGlobal [format["%1_garr%2", _grpPrefix, _x]];

        _garr_units append (units _group);
    };

    // garrison using ace
    private _failed = [_center, nil, _garr_units, _garr_radius, 2, false, true] call ace_ai_fnc_garrison;

    _garr_units = _garr_units - _failed;
    { deleteVehicle _x; } forEach _failed;

    {
        _x setVariable [QGVAR(garrisoned),true,true];
    } forEach _garr_units;

    _units append _garr_units;
};

//----- INFANTRY PATROLS
if ((_inf_count > 0) && ((count _inf_groups) > 0)) then {
    for "_x" from 0 to (_inf_count - 1) do {

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;

        private _groupClass = _groupConfig >> (selectRandom _inf_groups);
        private _group = [_rpos, _factionSide, _groupClass] call BIS_fnc_spawnGroup;

        _group setGroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];

        [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf;

        _units append (units _group);
    };
};

//----- AA INFANTRY PATROLS
if ((_inf_aa_count > 0) && ((count _inf_aa_groups) > 0)) then {
    for "_x" from 0 to (_inf_aa_count - 1) do {

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;

        private _groupClass = _groupConfig >> (selectRandom _inf_aa_groups);
        private _group = [_rpos, _factionSide, _groupClass] call BIS_fnc_spawnGroup;

        _group setGroupIdGlobal [format["%1_inf_aa%2", _grpPrefix, _x]];

        [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf_Spec;

        _units append (units _group);
    };
};

//----- AT INFANTRY PATROLS
if ((_inf_at_count > 0) && ((count _inf_at_groups) > 0)) then {
    for "_x" from 0 to (_inf_at_count - 1) do {

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;

        private _groupClass = _groupConfig >> (selectRandom _inf_at_groups);
        private _group = [_rpos, _factionSide, _groupClass] call BIS_fnc_spawnGroup;

        _group setGroupIdGlobal [format["%1_inf_at%2", _grpPrefix, _x]];

        [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf_Spec;

        _units append (units _group);
    };
};

//----- SNIPERS
if ((_sniper_count > 0) && ((count _sniper_groups) > 0)) then {
    for "_x" from 0 to (_sniper_count - 1) do {

        private _rpos = [_center, _radius, 100, 50] call BIS_fnc_findOverwatch;

        private _groupClass = _groupConfig >> (selectRandom _sniper_groups);
        private _group = [_rpos, _factionSide, _groupClass] call BIS_fnc_spawnGroup;

        _group setGroupIdGlobal [format["%1_sniper%2", _grpPrefix, _x]];

        _group setBehaviour "STEALTH";
        _group setCombatMode "RED";

        _units append (units _group);
    };
};

//----- LIGHT VEHICLE PATROLS
if ((_veh_light_count > 0) && ((count _veh_light_list) > 0)) then {
    for "_x" from 1 to (_veh_light_count - 1) do {

        private _group = createGroup _factionSide;
        _group setGroupIdGlobal [format ["%1_veh_light%2", _grpPrefix, _x]];

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            private _veh = (selectRandom _veh_light_list) createVehicle _rpos;
            _veh lock 3;

            [_veh, _group] call BIS_fnc_spawnCrew;
            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;

            if (random 1 >= 0.5) then { _veh allowCrewInImmobile true; };

            _units append (units _group);
            _vehicles pushBack _veh;
        };
    };
};

//----- HEAVY VEHICLE PATROLS
if ((_veh_heavy_count > 0) && ((count _veh_heavy_list) > 0)) then {
    for "_x" from 1 to (_veh_heavy_count - 1) do {

        private _group = createGroup _factionSide;
        _group setGroupIdGlobal [format ["%1_veh_heavy%2", _grpPrefix, _x]];

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            private _veh = (selectRandom _veh_heavy_list) createVehicle _rpos;
            _veh lock 3;

            [_veh, _group] call BIS_fnc_spawnCrew;
            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;

            if (random 1 >= 0.5) then { _veh allowCrewInImmobile true; };

            _units append (units _group);
            _vehicles pushBack _veh;
        };
    };
};

//----- RANDOM VEHICLE PATROLS
if ((_veh_random_count > 0) && ((count _veh_random_list) > 0)) then {
    for "_x" from 1 to (_veh_random_count - 1) do {

        private _group = createGroup _factionSide;
        _group setGroupIdGlobal [format ["%1_veh_random%2", _grpPrefix, _x]];

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            private _veh = (selectRandom _veh_random_list) createVehicle _rpos;
            _veh lock 3;

            [_veh, _group] call BIS_fnc_spawnCrew;
            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;

            if (random 1 >= 0.5) then { _veh allowCrewInImmobile true; };

            _units append (units _group);
            _vehicles pushBack _veh;
        };
    };
};

private _airUnits = [];
private _airVehicles = [];

//----- AIR PATROLS
if ((_air_count > 0) && ((count _air_list) > 0)) then {
    for "_x" from 1 to (_air_count - 1) do {

        private _group = createGroup _factionSide;
        _group setGroupIdGlobal [format ["%1_air%2", _grpPrefix, _x]];

        private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;
        _rpos = _rpos vectorAdd [0, 0, _air_altitude + random 100];

        if !(_rpos isEqualTo [0,0]) then {
            private _veh = createVehicle [(selectRandom _air_list), (_center vectorAdd [0, 0, 100]), [], 0, "FLY"];
            _veh lock 3;

            [_veh, _group] call BIS_fnc_spawnCrew;

            private _wp = _group addWaypoint [_rpos, _radius * (0.8 + (random 0.8))];
            _wp setWaypointType "LOITER";
            _wp setWaypointLoiterRadius (_radius * (0.8 + (random 0.8)));
            _wp setWaypointLoiterAltitude (_air_altitude + random 100);

            if (random 1 >= 0.5) then { _veh allowCrewInImmobile true; };

            _airUnits append (units _group);
            _airVehicles pushBack _veh;
        };
    };
};

// set up spawned units/vehicles
{
	if !(dynamicSimulationEnabled (group _x)) then {
		(group _x) enableDynamicSimulation true;
	};

	_x 	disableAI "AUTOCOMBAT";
} forEach _units;

{
	if (!(dynamicSimulationEnabled _x)) then {
		_x enableDynamicSimulation true;
	};
} forEach _vehicles;

_units append _airUnits;
_vehicles append _airVehicles;

{
	_x addCuratorEditableObjects [_units, false];
	_x addCuratorEditableObjects [_vehicles, true];
} forEach allCurators;

TRACE_2("units/vehicles spawned",_units,_vehicles);

nil;
