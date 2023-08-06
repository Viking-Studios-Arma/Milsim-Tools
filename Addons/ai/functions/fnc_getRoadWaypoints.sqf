#include "script_component.hpp"

/*
Function: mti_ai_fnc_getRoadWaypoints

Description:
    Helper function to obtain waypoints on roads for the purpose of fnc_populateAO.

Arguments:
    _center - Center of search pos
    _radius - Search radius
    _minBound - Lower bound, will increase search radius until we have enough positions

Return Value:
    Array of waypoints on roads

Example:
    (begin example)
        [] call mti_ai_fnc_getRoadWaypoints;
    (end)

Author:
	Mokka
*/

// MAX_SEARCH_ITS provides an upper bound for radius extensions when polling road positions,
// so we don't have to search the entire map
#define MAX_SEARCH_ITS 20

// If we don't find enough road positions in the radius, extend radius step-wise by this amount
#define EXT_RADIUS 100

params ["_center", "_radius", "_minBound"];

// Get list of roads around the center
private _roadList = [];
_roadList = _center nearRoads _radius;

// Now increase the search radius until we have found enough positions
if (count _roadList < _minBound) then {
    private _i = 0;
    private _radExtension = 0;

    // If we exceed our max in iterations, abort and use random positions instead...
    while {(count _roadList < _minBound) && (_i < MAX_SEARCH_ITS)} do {
        _radExtension = _radExtension + EXT_RADIUS;
        _roadList = _center nearRoads (_radius + _radExtension);
        _i = _i + 1;
    };
};

// If we still don't have enough positions, fill the remaining spots up with random positions
if (count _roadList < _minBound) then {
    while {count _roadList < _minBound} do {
        private _rpos = [[[_center, _radius],[]],["water"]] call FUNC(findSpawnPos);
        _roadList append [_rpos];
    };
};

// populate _waypoints with the positions of these roads
private _waypoints = [];
{ _waypoints pushBackUnique (getPos _x); } forEach _roadList;

if (count _waypoints == 0) then {
    WARNING_3("no road waypoints could be obtained for center %1, radius %2 and minBound %3", _center, _radius, _minBound)
};

_waypoints
