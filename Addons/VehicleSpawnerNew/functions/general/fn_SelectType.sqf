/*
Function name: VS_fnc_SelectType
Author: Amateur-God
Description: Gets the selected value from player and refreshes the list.
Return value: None
Public: No
Parameters: ["_selected"]
Example(s): call VS_fnc_SelectType;
*/

params ["_selected"];

// Constants for display and control IDs
#define DISPLAY_ID 2121
#define TYPE_COMBO_CTRL_ID 2100

private _display = findDisplay DISPLAY_ID;
if (isNil "_display") exitWith { diag_log "VS_fnc_SelectType: Display not found"; };

private _ctrlCombo = _display displayCtrl TYPE_COMBO_CTRL_ID;
if (isNil "_ctrlCombo") exitWith { diag_log "VS_fnc_SelectType: Combo control not found"; };

private _selectedType = _ctrlCombo lbData _selected;
if (isNil "_selectedType") exitWith { diag_log "VS_fnc_SelectType: Selected type is nil"; };

// Set the selected type as a player variable
player setVariable ["VS_Spawner_UserSelectedVehicleType", _selectedType];

// Refresh the main list with the new selected type
diag_log "VS_fnc_SelectType: Refreshing main list";
call VS_fnc_FilterAllVehicles;
call VS_fnc_RefreshMainList;

diag_log "VS_fnc_SelectType: Completed";
