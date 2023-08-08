#include "script_component.hpp"

/*
Function: mti_ai_fnc_getFactions

Description:
    Returns available factions for the Populate AO functionality both as class names and as readily compiled display names

Arguments:
    _force - (Optional) Set to true to forcefully clear the cache and return a fresh result

Return Value:
    Array of factions, each faction entry has format [side, displayName, className]

Example:
    (begin example)
        [] call mti_ai_fnc_getFactions;
    (end)

Author:
	Mokka
*/

params [["_force", false]];

// if we have a cached result, return it
if (!(_force) && !(isNil QGVAR(factionCache))) exitWith { GVAR(factionCache) };

private _factions = [];
private _factionConfigs = ("getNumber (_x >> 'scope') > 0" configClasses (configFile >> "MTI_PopulateAO_Factions"));

{
    private _faction = _x;
    private _dependencies = getArray (_faction >> "requiredAddons");

    private _missing = {
        !(isClass (configFile >> "CfgPatches" >> _x))
    } count _dependencies;

    if (_missing < 1) then {
        _factions pushBack [
            getNumber (_faction >> "side"),
            getText (_faction >> "displayName"),
            configName _faction
        ];
    } else {
        WARNING_1("missing addons for faction %1",_faction);
    };
} forEach _factionConfigs;

_factions sort true;

// cache the result
GVAR(factionCache) = +_factions;

_factions
