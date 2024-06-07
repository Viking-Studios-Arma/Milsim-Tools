/*
Function name: VS_fnc_FilterAllowedFactions
Author: Amateur-God
Description: Filters the list of allowed factions according to CBA settings.
Return value: None
Public: No
Parameters: None
Example(s):
call VS_fnc_FilterAllowedFactions;
*/

// Retrieve the list of all factions from missionNamespace
private _FactionsList = missionNamespace getVariable ["FactionsList", []];

// Initialize an empty array to store allowed factions
private _allowedArray = [];

// Iterate through each faction in the list and filter based on CBA settings
{
    private _setting = [_x] call cba_settings_fnc_get;
    if (_setting) then {
        _allowedArray pushBack _x;
    };
} forEach _FactionsList;

// Store the allowed factions list back into missionNamespace
missionNamespace setVariable ["AllowedFactionsList", _allowedArray, true];

// Call the function to sort factions after setting the allowed factions list
call VS_fnc_SortFactionsAlgo;

