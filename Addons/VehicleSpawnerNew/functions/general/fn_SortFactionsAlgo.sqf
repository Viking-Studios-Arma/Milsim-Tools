/*
Function name: VS_fnc_SortFactionsAlgo
Author: Amateur-God
Description: Sorts the factions listed at init to filter only allowed factions.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_SortFactionsAlgo;
*/

private _allVehicleConfigNames = missionNamespace getVariable "AllConfigVehicles";
private _allAllowedDLCs = missionNamespace getVariable "AllowedDLCsList";
private _allAllowedFactions = missionNamespace getVariable "AllowedFactionsList";

diag_log format ["VS_fnc_SortFactionsAlgo: _allVehicleConfigNames size: %1", count _allVehicleConfigNames];
diag_log format ["VS_fnc_SortFactionsAlgo: _allAllowedDLCs size: %1", count _allAllowedDLCs];
diag_log format ["VS_fnc_SortFactionsAlgo: _allAllowedFactions size: %1", count _allAllowedFactions];

private _vehiclesInAllowedDLCs = [];
{
    private _dlc = getText (configFile >> "CfgVehicles" >> _x >> "dlc");
    if (_dlc == "") then {
        _dlc = "Vanilla";
    };
    if (_dlc in _allAllowedDLCs && !(_x in _vehiclesInAllowedDLCs)) then {
        _vehiclesInAllowedDLCs pushBack _x;
    };
} forEach _allVehicleConfigNames;

diag_log format ["VS_fnc_SortFactionsAlgo: _vehiclesInAllowedDLCs size: %1", count _vehiclesInAllowedDLCs];

private _factionsFromAllowedFactions = [];
{
    private _faction = getText (configFile >> "CfgVehicles" >> _x >> "faction");
    if (_faction in _allAllowedFactions && !(_faction in _factionsFromAllowedFactions)) then {
        _factionsFromAllowedFactions pushBack _faction;
    };
} forEach _vehiclesInAllowedDLCs;

diag_log format ["VS_fnc_SortFactionsAlgo: _factionsFromAllowedFactions size: %1", count _factionsFromAllowedFactions];

private _remainingFactions = [];
{
    if !(_x in _remainingFactions) then {
        _remainingFactions pushBack _x;
    };
} forEach _factionsFromAllowedFactions;

diag_log format ["VS_fnc_SortFactionsAlgo: _remainingFactions size: %1", count _remainingFactions];

missionNamespace setVariable ["FilteredFactions", _remainingFactions, true];

diag_log "VS_fnc_SortFactionsAlgo: Filtered factions updated and sorted.";
