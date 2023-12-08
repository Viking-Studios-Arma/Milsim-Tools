/*
Function name: VS_core_fnc_SelectType
Author: Mr H.
Description: gets the selected value from player  and refreshes the list//I know now there are better ways to do this, might change it in the future
Return value: None
Public:No
Parameters: None
Example(s):
call VS_core_fnc_Spawner_SelectType;
*/

params ["_selected"];
_ctrlcombo = ((findDisplay 2121) displayCtrl 2100);
_VSvalue = _ctrlcombo lbData _selected;
player setVariable ["VS_spawnerUSERSELECTEDVEHICLETYPE", _VSvalue];
call VS_core_fnc_Spawner_FilterAll;
call VS_core_fnc_Spawner_RefreshMainList;