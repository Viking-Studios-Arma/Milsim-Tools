/*
Function name: oni_core_fnc_UserSelectedFaction
Author: Mr H.
Description: Filters the list according to the dlc selected by the player
Return value: none
Public: no
Parameters:none
Example(s):
call oni_core_fnc_UserSelectedFaction;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2102);
_onivalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _onivalue;

player setVariable ["userSelectedFaction", _array];
call oni_core_fnc_Spawner_RefreshMainList;
