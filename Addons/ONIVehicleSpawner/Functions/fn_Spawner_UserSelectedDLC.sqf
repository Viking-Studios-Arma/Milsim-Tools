/*
Function name: oni_core_fnc_UserSelectedDLC
Author: Mr H.
Description: filters the list according with the mod selected by the player
Return value: none
Public:no
Parameters:none
Example(s):
call oni_core_fnc_Spawner_UserSelectedDLC;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2101);
_onivalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _onivalue;

player setVariable ["userSelectedDLC", _array];
call oni_core_fnc_Spawner_RefreshMainList;
call oni_core_fnc_Spawner_FillFactionCombo;

