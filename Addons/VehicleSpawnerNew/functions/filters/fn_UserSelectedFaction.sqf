/*
Function name: VS_fnc_UserSelectedFaction
Author: Amateur-God
Description: Filters the list according to the faction selected by the player.
Return value: None
Public: No
Parameters: ["_selected"]
Example(s): call VS_fnc_UserSelectedFaction;
*/

params ["_selected"];

// Constants for display and control IDs
#define DISPLAY_ID 2121
#define FACTION_COMBO_CTRL_ID 2102

private _display = findDisplay DISPLAY_ID;
if (isNil "_display") exitWith { diag_log "VS_fnc_UserSelectedFaction: Display not found"; };

private _ctrlCombo = _display displayCtrl FACTION_COMBO_CTRL_ID;
if (isNil "_ctrlCombo") exitWith { diag_log "VS_fnc_UserSelectedFaction: Combo control not found"; };

private _selectedFaction = _ctrlCombo lbData _selected;
if (isNil "_selectedFaction") exitWith { diag_log "VS_fnc_UserSelectedFaction: Selected faction is nil"; };

// Store the selected faction in a player variable
player setVariable ["UserSelectedFaction", _selectedFaction];

// Refresh the main list with the new selected faction
diag_log "VS_fnc_UserSelectedFaction: Refreshing main list";
call VS_fnc_RefreshMainList;

diag_log "VS_fnc_UserSelectedFaction: Completed";
