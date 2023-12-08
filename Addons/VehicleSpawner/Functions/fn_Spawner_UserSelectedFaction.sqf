/*
Function name: VS_core_fnc_UserSelectedFaction
Author: Mr H.
Description: Filters the list according to the dlc selected by the player
Return value: none
Public: no
Parameters:none
Example(s):
call VS_core_fnc_UserSelectedFaction;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2102);
_VSvalue = _ctrlcombo lbData _selected;
_array = [];
_array pushBack _VSvalue;

player setVariable ["userSelectedFaction", _array];
call VS_core_fnc_Spawner_RefreshMainList;
