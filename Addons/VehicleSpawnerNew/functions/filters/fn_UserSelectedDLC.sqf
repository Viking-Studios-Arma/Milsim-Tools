/*
Function name: VS_fnc_UserSelectedDLC
Author: Amateur-God
Description: Filters the list according to the mod selected by the player.
Return value: None
Public: No
Parameters: ["_selected"]
Example(s): call VS_fnc_UserSelectedDLC;
*/

params ["_selected"];

// Constants for display and control IDs
#define DISPLAY_ID 2121
#define DLC_COMBO_CTRL_ID 2101

private _display = findDisplay DISPLAY_ID;
if (isNil "_display") exitWith { diag_log "VS_fnc_UserSelectedDLC: Display not found"; };

private _ctrlCombo = _display displayCtrl DLC_COMBO_CTRL_ID;
if (isNil "_ctrlCombo") exitWith { diag_log "VS_fnc_UserSelectedDLC: Combo control not found"; };

private _selectedDLC = _ctrlCombo lbData _selected;
if (isNil "_selectedDLC") exitWith { diag_log "VS_fnc_UserSelectedDLC: Selected DLC is nil"; };

// Store the selected DLC in a player variable
player setVariable ["userSelectedDLC", [_selectedDLC]];

// Refresh the main list and faction combo box with the new selected DLC
diag_log "VS_fnc_UserSelectedDLC: Refreshing main list and faction combo";
call VS_fnc_RefreshMainList;
call VS_fnc_FillFactionCombo;

diag_log "VS_fnc_UserSelectedDLC: Completed";
