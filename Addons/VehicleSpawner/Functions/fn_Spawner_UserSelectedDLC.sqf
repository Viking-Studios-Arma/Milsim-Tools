/*
Function name: VS_core_fnc_UserSelectedDLC
Author: Mr H.
Description: filters the list according with the mod selected by the player
Return value: none
Public:no
Parameters:none
Example(s):
call VS_core_fnc_Spawner_UserSelectedDLC;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2101);
_VSvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _VSvalue;

player setVariable ["userSelectedDLC", _array];
call VS_core_fnc_Spawner_RefreshMainList;
call VS_core_fnc_Spawner_FillFactionCombo;

