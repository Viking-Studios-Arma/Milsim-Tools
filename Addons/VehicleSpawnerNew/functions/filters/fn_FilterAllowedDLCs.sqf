/*
Function name: VS_fnc_FilterAllowedDLCs
Author: Amateur-God
Description: Filters the list of allowed mods and DLCs according to CBA settings.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_FilterAllowedDLCs;
*/

// Retrieve the list of all DLCs from missionNamespace
private _DLCsList = missionNamespace getVariable ["DLCsList", []];

// Initialize an empty array to store allowed DLCs
private _allowedArray = [];

// Iterate through each DLC in the list and filter based on CBA settings
{
    private _setting = [_x] call cba_settings_fnc_get;
    if (_setting) then {
        _allowedArray pushBack _x;
    };
} forEach _DLCsList;

// Store the allowed DLCs list back into missionNamespace
missionNamespace setVariable ["AllowedDLCsList", _allowedArray, true];

// Call the function to sort factions after setting the allowed DLCs list
call VS_fnc_SortFactionsAlgo;
