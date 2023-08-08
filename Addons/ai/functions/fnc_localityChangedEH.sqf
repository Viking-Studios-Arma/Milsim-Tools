#include "script_component.hpp"

/*
Function: mti_ai_fnc_localityChangedEH

Description:
    Handles changes in locality, attempts to fix issues with garrisons.

Arguments:
    _unit - The unit
    _isLocal - If _unit is local

Return Value:
    None

Example:
    (begin example)
        [...] call mti_ai_fnc_localityChangedEH;
    (end)

Author:
	Mokka
*/

params ["_unit","_isLocal"];

if !(_isLocal) exitWith {};

if (_unit getVariable [QGVAR(garrisoned),false]) then {
    ["ace_ai_AISection", [[_unit], ["PATH"], false], [_unit]] call CBA_fnc_localEvent;
};
