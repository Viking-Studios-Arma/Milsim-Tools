#include "script_component.hpp"

/*
Function: mti_ai_fnc_3den_populateAO

Description:
    Internal helper function to run populateAI in 3den. Do not call directly unless you know
    what you're doing!

Arguments:
    N/A

Return Value:
    None

Example:
    (begin example)
        [...] call mti_ai_fnc_3den_populateAO_3den;
    (end)

Author:
	Mokka
*/

if !(is3DEN) exitWith { ERROR("this function can only be run in 3den"); };

params [
    "_center", "_args_radius", "_grpPrefix", "_patrolMethod", "_road_waypoints", "_factionSide",
    "_args_fnc_getPos", "_args_count", "_args_groups",
    "_air_altitude"
];

_args_radius params ["_radius", "_garr_radius"];
_args_fnc_getPos params ["_fnc_getPos_Inf", "_fnc_getPos_Veh", "_fnc_getPos_Air"];
_args_count params ["_garr_count", "_inf_count", "_inf_aa_count", "_inf_at_count", "_sniper_count", "_veh_light_count", "_veh_heavy_count", "_veh_random_count", "_air_count"];
_args_groups params ["_inf_groups", "_inf_aa_groups", "_inf_at_groups", "_sniper_groups", "_veh_light_list", "_veh_heavy_list", "_veh_random_list", "_air_list"];

private _fnc_spawn_group = {
    params ["_factionSide", "_groupClass", "_pos"];

    // Convert a CfgGroups entry to types, positions and ranks.
    // from BIS_fnc_spawnGroup
	private _types = [];
    private _ranks = [];
	private _positions = [];

	for "_i" from 0 to ((count _groupClass) - 1) do {
		private ["_item"];
		_item = _groupClass select _i;

		if (isClass _item) then {
			_types = _types + [getText(_item >> "vehicle")];
			_ranks = _ranks + [getText(_item >> "rank")];
			_positions = _positions + [getArray(_item >> "position")];
		};
	};

    // spawn a temporary unit to properly set the side of the group
    private ["_temp_unit"];
    switch (_factionSide) do {
        case west: { _temp_unit = "B_Soldier_F"; };
        case east: { _temp_unit = "O_Soldier_F"; };
        case independent: { _temp_unit = "I_soldier_F"; };
        case civilian: { _temp_unit = "C_man_1"; };
        default { };
    };

    private _temp_unit = create3DENEntity ["Object", _temp_unit, [0,0,0]];
    private _group = group _temp_unit;

    // create the actual group
    {
        private _type = _x;
        private _isMan = getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1;

        private _relPos = _positions select _forEachIndex;
        private _itemPos = _pos vectorAdd _relPos;

        private _unit = _group create3DENEntity ["Object", _type, _itemPos];

        if (_isMan) then {
            _unit set3DENAttribute ["rank", _ranks select _forEachIndex];
        };
    } forEach _types;

    delete3DENEntities [_temp_unit];

    _group;
};

private _fnc_spawn_vehicle = {
    params ["_factionSide", "_vehClass", "_pos", ["_dynSim", true]];

    // spawn a temporary unit to properly set the side of the group
    private ["_temp_unit"];
    switch (_factionSide) do {
        case west: { _temp_unit = "B_Soldier_F"; };
        case east: { _temp_unit = "O_Soldier_F"; };
        case independent: { _temp_unit = "I_soldier_F"; };
        case civilian: { _temp_unit = "C_man_1"; };
        default { };
    };

    private _temp_unit = create3DENEntity ["Object", _temp_unit, [0,0,0]];
    private _group = group _temp_unit;

    private _veh = _group create3DENEntity ["Object", _vehClass, _pos];

    _veh set3DENAttribute ["lock", 3];

    if (_dynSim) then {
        _veh set3DENAttribute ["dynamicSimulation", true];
    };

    delete3DENEntities [_temp_unit];

    _group;
};

private _fnc_patrol_getRandomWaypoints = {
    params ["_group", "_radius", "_count"];
    private _positions = [];
    private _position = getPos (leader _group);
    // Based on CBA_fnc_taskPatrol
    // Using angles create better patrol patterns
    // Also fixes weird editor bug where all WP are on same position
    private _step = 360 / _count;
    private _offset = random _step;

    for "_i" from 1 to _count do {
        // Gaussian distribution avoids all waypoints ending up in the center
        private _rad = _radius * random [0.1, 0.75, 1];

        // Alternate sides of circle & modulate offset
        private _theta = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i;

        _positions pushBack (_position getPos [_rad, _theta]);
    };

    _positions;
};

private _fnc_patrol_Inf = {
    params ["_group", "_center", "_radius", "_road_waypoints"];
    private _waypoints = [];
    private _pathLength = 3 + round(random 6);

    if (_patrolMethod isEqualTo "RANDOM") then {
        // RANDOM patrol path
        _waypoints = [_group, _radius, _pathLength] call _fnc_patrol_getRandomWaypoints;
    } else {
        // ROAD patrol path
        for "_x" from 1 to _pathLength do {
            _waypoints pushBack (selectRandom _road_waypoints);
        };
    };

    // create the actual waypoints
    {
        private _wp = _group create3DENEntity ["Waypoint", "Move", _x];
        _wp set3DENAttribute ["timeout", [0, 4, 10]];
        _wp set3DENAttribute ["completionRadius", 5];
    } forEach _waypoints;

    private _cwp = _group create3DENEntity ["Waypoint", "Cycle", selectRandom _waypoints];

    // set behaviour
    _group set3DENAttribute ["behaviour", "SAFE"];
    _group set3DENAttribute ["formation", selectRandom [3, 5, 8]];
    _group set3DENAttribute ["speedMode", "LIMITED"];
};

private _fnc_patrol_Inf_Spec = {
    params ["_group", "_center", "_radius", "_road_waypoints"];
    private _waypoints = [];
    private _pathLength = 3 + round(random 6);

    if (_patrolMethod isEqualTo "RANDOM") then {
        // RANDOM patrol path
        _waypoints = [_group, _radius, _pathLength] call _fnc_patrol_getRandomWaypoints;
    } else {
        // ROAD patrol path
        for "_x" from 1 to _pathLength do {
            _waypoints pushBack (selectRandom _road_waypoints);
        };
    };

    // create the actual waypoints
    {
        private _wp = _group create3DENEntity ["Waypoint", "Move", _x];
        _wp set3DENAttribute ["timeout", [0, 4, 10]];
        _wp set3DENAttribute ["completionRadius", 5];
    } forEach _waypoints;

    private _cwp = _group create3DENEntity ["Waypoint", "Cycle", selectRandom _waypoints];

    // set behaviour
    _group set3DENAttribute ["behaviour", "SAFE"];
    _group set3DENAttribute ["formation", selectRandom [3, 5, 8]];
    _group set3DENAttribute ["speedMode", "LIMITED"];
};

private _fnc_patrol_Veh = {
    params ["_group", "_center", "_radius", "_road_waypoints"];
    private _waypoints = [];
    private _pathLength = 3 + round(random 6);

    if (_patrolMethod isEqualTo "RANDOM") then {
        // RANDOM patrol path
        _waypoints = [_group, _radius, _pathLength] call _fnc_patrol_getRandomWaypoints;
    } else {
        // ROAD patrol path
        for "_x" from 1 to _pathLength do {
            _waypoints pushBack (selectRandom _road_waypoints);
        };
    };

    // create the actual waypoints
    {
        private _wp = _group create3DENEntity ["Waypoint", "Move", _x];
        _wp set3DENAttribute ["timeout", [0, 4, 10]];
        _wp set3DENAttribute ["completionRadius", 5];
    } forEach _waypoints;

    private _cwp = _group create3DENEntity ["Waypoint", "Cycle", selectRandom _waypoints];

    // set behaviour
    _group set3DENAttribute ["behaviour", "SAFE"];
    _group set3DENAttribute ["formation", selectRandom [3, 5, 8]];
    _group set3DENAttribute ["speedMode", "LIMITED"];
};

_fnc_garrison_group = {
    params ["_garr_units", "_center", "_radius"];

    // based on ace_ai_fnc_garrison
    private _buildings = nearestObjects [_center, ["Building"], _garr_radius];
    _buildings = [_buildings] call CBA_fnc_shuffle;

    if (count _buildings == 0) exitWith {};

    private _buildingsIndex = [];

    {
        _buildingsIndex pushBack (_x buildingPos -1);
    } foreach _buildings;

    // Remove buildings without positions
    {
        _buildingsIndex deleteAt (_buildingsIndex find _x);
    } foreach (_buildingsIndex select {count _x == 0});

    private _placedUnits = [];

    while {count _garr_units > 0} do {
        if (count _buildingsIndex == 0) exitWith {};
        private _building = selectRandom _buildingsIndex;

        if (_building isEqualTo []) then {

            LOG(format [ARR_2("_fnc_garrison_group: empty building array | removing building from buildingsIndex | %1 buildings remaining",count _buildingsIndex)]);
            _buildingsIndex deleteAt (_buildingsIndex find _building);

        } else {

            private _pos = selectRandom _building;

            private _unit = _garr_units select 0;
            private _posSurface = surfaceIsWater _pos;

            if (_posSurface) then {
                _unit set3DENAttribute ["position", (AGLToASL _pos)];
            } else {
                _unit set3DENAttribute ["position", _pos];
            };

            _placedUnits pushBack _unit;
            _garr_units deleteAt (_garr_units find _unit);
            _buildingsIndex set [(_buildingsIndex find _building), _building - [_pos]];
            _unit setVariable ["ace_ai_garrisonned", true, true];
        };
    };

    _garr_units;
};

["Populate AO", "MokTech Industries - Populate AO", "z\mti\addons\common\data\moktech_industries_logo.paa"] collect3DENHistory {
   //----- GARRISONS
    if ((_garr_count > 0) && ((count _inf_groups) > 0)) then {
        // spawn wanted amount of groups
        private _garr_units = [];

        for "_x" from 0 to _garr_count do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;
    		private _groupClass = _groupConfig >> (selectRandom _inf_groups);

            private _group = [_factionSide, _groupClass, _rpos] call _fnc_spawn_group;

            _group set3DENAttribute ["groupID", format["%1_garr%2", _grpPrefix, _x]];
            _group set3DENAttribute ["dynamicSimulation", true];
            _group set3DENAttribute ["garbageCollectGroup", true];


            _garr_units append (units _group);
        };

        // garrison using ace
        private _failed = [+_garr_units, _center, _garr_radius] call _fnc_garrison_group;

        _garr_units = _garr_units - _failed;
        delete3DENEntities _failed;

        {
            _x set3DENAttribute ["Init", "this disableAI ""PATH"";"];
        } forEach _garr_units;
    };

    //----- INFANTRY PATROLS
    if ((_inf_count > 0) && ((count _inf_groups) > 0)) then {
        for "_x" from 0 to (_inf_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;
            private _groupClass = _groupConfig >> (selectRandom _inf_groups);

            private _group = [_factionSide, _groupClass, _rpos] call _fnc_spawn_group;

            _group set3DENAttribute ["groupID", format["%1_inf%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf;

            _group set3DENAttribute ["dynamicSimulation", true];
            _group set3DENAttribute ["garbageCollectGroup", true];
        };
    };

    //----- AA INFANTRY PATROLS
    if ((_inf_aa_count > 0) && ((count _inf_aa_groups) > 0)) then {
        for "_x" from 0 to (_inf_aa_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;
            private _groupClass = _groupConfig >> (selectRandom _inf_aa_groups);

            private _group = [_factionSide, _groupClass, _rpos] call _fnc_spawn_group;

            _group set3DENAttribute ["groupID", format["%1_inf_aa%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf_Spec;

            _group set3DENAttribute ["dynamicSimulation", true];
            _group set3DENAttribute ["garbageCollectGroup", true];
        };
    };

    //----- AT INFANTRY PATROLS
    if ((_inf_at_count > 0) && ((count _inf_at_groups) > 0)) then {
        for "_x" from 0 to (_inf_at_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_Inf;
            private _groupClass = _groupConfig >> (selectRandom _inf_at_groups);

            private _group = [_factionSide, _groupClass, _rpos] call _fnc_spawn_group;

            _group set3DENAttribute ["groupID", format["%1_inf_at%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_Inf_Spec;

            _group set3DENAttribute ["dynamicSimulation", true];
            _group set3DENAttribute ["garbageCollectGroup", true];
        };
    };

    //----- SNIPERS
    if ((_sniper_count > 0) && ((count _sniper_groups) > 0)) then {
        for "_x" from 0 to (_sniper_count - 1) do {

            private _rpos = [_center, _radius, 100, 50] call BIS_fnc_findOverwatch;
            private _groupClass = _groupConfig >> (selectRandom _sniper_groups);

            private _group = [_factionSide, _groupClass, _rpos] call _fnc_spawn_group;

            _group set3DENAttribute ["groupID", format["%1_sniper%2", _grpPrefix, _x]];

            _group set3DENAttribute ["behaviour", "STEALTH"];
            _group set3DENAttribute ["combatMode", "RED"];

            _group set3DENAttribute ["dynamicSimulation", true];
            _group set3DENAttribute ["garbageCollectGroup", true];
        };
    };

    //----- LIGHT VEHICLE PATROLS
    if ((_veh_light_count > 0) && ((count _veh_light_list) > 0)) then {
        for "_x" from 0 to (_veh_light_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;
            private _vehClass = selectRandom _veh_light_list;

            private _group = [_factionSide, _vehClass, _rpos] call _fnc_spawn_vehicle;

            _group set3DENAttribute ["groupID", format["%1_veh_light%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;
        };
    };

    //----- HEAVY VEHICLE PATROLS
    if ((_veh_heavy_count > 0) && ((count _veh_heavy_list) > 0)) then {
        for "_x" from 0 to (_veh_heavy_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;
            private _vehClass = selectRandom _veh_heavy_list;

            private _group = [_factionSide, _vehClass, _rpos] call _fnc_spawn_vehicle;

            _group set3DENAttribute ["groupID", format["%1_veh_heavy%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;
        };
    };

    //----- RANDOM VEHICLE PATROLS
    if ((_veh_random_count > 0) && ((count _veh_random_list) > 0)) then {
        for "_x" from 0 to (_veh_random_count - 1) do {

            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;
            private _vehClass = selectRandom _veh_random_list;

            private _group = [_factionSide, _vehClass, _rpos] call _fnc_spawn_vehicle;

            _group set3DENAttribute ["groupID", format["%1_veh_random%2", _grpPrefix, _x]];

            [_group, _center, _radius, _road_waypoints] call _fnc_patrol_veh;
        };
    };

    //----- AIR PATROLS
    if ((_air_count > 0) && ((count _air_list) > 0)) then {
        for "_x" from 0 to (_air_count - 1) do {
            private _rpos = [_center, _radius, _road_waypoints] call _fnc_getPos_veh;
            _rpos = _rpos vectorAdd [0, 0, _air_altitude + random 100];
            private _vehClass = selectRandom _air_list;

            private _group = [_factionSide, _vehClass, _rpos, false] call _fnc_spawn_vehicle;

            _group set3DENAttribute ["groupID", format["%1_air%2", _grpPrefix, _x]];

            private _wp = _group create3DENEntity ["Waypoint", "Loiter", _rpos];
            _wp set3DENAttribute ["LoiterRadius", _radius * (0.8 + (random 0.8))];
            _wp set3DENAttribute ["LoiterAltitude", _air_altitude + random 100];
        };
    };

    TRACE_2("units/vehicles spawned",_units,_vehicles);
};
