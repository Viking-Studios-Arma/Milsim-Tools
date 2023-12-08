/*
Function name: VS_core_fnc_SpawnerAllowedDLCs
Author: Mr H.
Description: Filters the list of allowed mods and dlcs accoring to cba settings
Return value: none
Public:No
Parameters:None
Example(s):
call VS_core_fnc_Spawner_AllowedDLCs;
*/

_DLCsList = missionNamespace getVariable "SPAWNER_DLCsList";

_allowedArray = [];
{
_setting= [_x] call cba_settings_fnc_get;
if (_setting) then {_allowedArray pushBack _x};
} forEach _DLCsList;
missionNamespace setVariable ["SPAWNER_Allowed_DLCsList", _allowedArray, true];
call VS_core_fnc_Spawner_SortFactionsAlgo;