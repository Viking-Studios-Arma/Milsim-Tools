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

private _allFactionsList = missionNamespace getVariable ["FactionsList", []];

if (count _allFactionsList == 0) then {
    diag_log "VS_fnc_FilterAllowedFactions: No factions found in FactionsList.";
};

private _allowedFactionsList = [];

{
    private _factionSetting = [_x] call cba_settings_fnc_get;
    if (_factionSetting) then {
        _allowedFactionsList pushBack _x;
    };
} forEach _allFactionsList;

if (count _allowedFactionsList == 0) then {
    diag_log "VS_fnc_FilterAllowedFactions: No allowed factions found based on CBA settings.";
};

missionNamespace setVariable ["AllowedFactionsList", _allowedFactionsList, true];

call VS_fnc_SortFactionsAlgo;

diag_log "VS_fnc_FilterAllowedFactions: Allowed factions list updated and sorted.";
