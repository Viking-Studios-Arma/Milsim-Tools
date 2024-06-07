/*
Function name: VS_fnc_FilterAllowedDLCs
Author: Amateur-God
Description: Filters the list of allowed mods and DLCs according to CBA settings.
Return value: None
Public: No
Parameters: None
Example(s):
call VS_fnc_FilterAllowedDLCs;
*/

private _allDLCsList = missionNamespace getVariable ["DLCsList", []];

if (count _allDLCsList == 0) then {
    diag_log "VS_fnc_FilterAllowedDLCs: No DLCs found in DLCsList.";
};

private _allowedDLCsList = [];

{
    private _dlcSetting = [_x] call cba_settings_fnc_get;
    if (_dlcSetting) then {
        _allowedDLCsList pushBack _x;
    };
} forEach _allDLCsList;

if (count _allowedDLCsList == 0) then {
    diag_log "VS_fnc_FilterAllowedDLCs: No allowed DLCs found based on CBA settings.";
};

missionNamespace setVariable ["AllowedDLCsList", _allowedDLCsList, true];

call VS_fnc_SortFactionsAlgo;

diag_log "VS_fnc_FilterAllowedDLCs: Allowed DLCs list updated and sorted.";
