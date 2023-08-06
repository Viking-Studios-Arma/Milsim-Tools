#include "script_component.hpp"

/*
Function: mti_ai_fnc_patrolRoad

Description:
    Sets up a patrol plotted along roads, rather than random positions dotted around the AO.

Arguments:
	_group - Group to set up for patrol
	_waypoints - Array of waypoints (i.e. roads) to use for the patrol setup
	_patrolLength - Length of the patrol path, array in format [min, max], default: [4, 8]

Return Values:
	Nothing.

Example:
    (begin example)
        [] call mti_ai_fnc_patrolRoad;
    (end)

Author:
	Mokka
*/

params [
	"_group",
	"_waypoints",
	["_patrolLength", [4, 8]]
];

_patrolLength params ["_patrolLengthMin", "_patrolLengthMax"];

private _findWps = _patrolLengthMin + floor (random (_patrolLengthMax - _patrolLengthMin));

_group setBehaviour (["AWARE", "SAFE"] select (random 1 > 0.5));
_group setSpeedMode (["limited", "normal"] select (random 1 > 0.5));

for "_i" from 0 to _findWps do {
	private _wp = selectRandom _waypoints;
	_wp = _group addWaypoint [_wp, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 5;
	[_group, _i] setWaypointTimeout [0, 4, 10];
};

private _wpc = _group addWaypoint [selectRandom _wayPoints, 0];
_wpc setWaypointType "CYCLE";
_wpc setWaypointCompletionRadius 5;

nil
