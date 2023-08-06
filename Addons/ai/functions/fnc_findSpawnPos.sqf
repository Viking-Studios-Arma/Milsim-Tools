#include "script_component.hpp"

/*
Function: mti_ai_fnc_findSpawnPos

Description:
	Finds a safe position based on the given parameters, using BIS_fnc_randomPos.

	White-/Blacklist can be:

	Object - trigger
	String - marker
	Array - in format [center, radius] or [center, [a, b, angle, rect]]
	Location - location

Arguments:
	_whitelist - Whitelisted areas, if empty the whole map is used
	_blacklist - Blacklisted areas, if empty water is blacklisted by default
	_code - Custom condition which should return true for current position _this
	_timeout - Abort position finding after that many attempts (default: 25)

Return Values:
	Random safe position that fits the passed parameters or [0,0] if no valid position could be found after _timeout attempts

Examples:
    (begin example)
		_pos = [[[[0, 0, 0], 150],[]],["water"]] call mti_ai_fnc_findSpawnPos;
	(end)

Author:
	Mokka
*/

params [
	["_whitelist", [[0,0], 100]],
	["_blacklist", ["water"]],
	["_code", {true}],
	["_timeout", 25]
];

private _pos = [0,0,0];

for [{_i = 0}, {_i < _timeout}, {_i = _i + 1}] do {
    _pos = [_whitelist, _blacklist, _code] call BIS_fnc_randomPos;

    if (not (_pos isEqualTo [0,0,0])) then {_i = _timeout};
};

if (_pos isEqualTo [0,0,0]) then {
	WARNING("Could not find a valid position!");
};

_pos;
