/*
Function name: VS_fnc_FillFactionCombo
Author: Amateur-God
Description: Refreshes the interface with the list of allowed factions.
Return value: None
Public: No
Parameters: None
Example(s):
call VS_fnc_FillFactionCombo;
*/

disableSerialization;

// Retrieve necessary data from missionNamespace
private _allVehicleConfigNames = missionNamespace getVariable "AllConfigVehicles";
private _allowedDLCsList = missionNamespace getVariable "AllowedDLCsList";
private _allowedFactionsList = missionNamespace getVariable "AllowedFactionsList";
private _selectedDLC = player getVariable "UserSelectedDLC";

// If "All" is selected, use all allowed DLCs
if ("All" in _selectedDLC) then {
    _selectedDLC = _allowedDLCsList;
};

// Initialize arrays
private _vehiclesInSelectedDLCs = [];
private _factionsFromAllowedFactions = [];
private _remainingFactions = ["All"];

// Filter vehicles by selected and allowed DLCs
{
    private _dlc = getText (configFile >> "CfgVehicles" >> _x >> "dlc");
    if (_dlc == "") then {
        _dlc = "Vanilla";
    };
    if (_dlc in _selectedDLC && _dlc in _allowedDLCsList && !(_x in _vehiclesInSelectedDLCs)) then {
        _vehiclesInSelectedDLCs pushBack _x;
    };
} forEach _allVehicleConfigNames;

// Filter factions from allowed factions
{
    private _faction = getText (configFile >> "CfgVehicles" >> _x >> "faction");
    if (_faction in _allowedFactionsList && !(_faction in _factionsFromAllowedFactions)) then {
        _factionsFromAllowedFactions pushBack _faction;
    };
} forEach _vehiclesInSelectedDLCs;

// Add remaining factions
{
    if !(_x in _remainingFactions) then {
        _remainingFactions pushBack _x;
    };
} forEach _factionsFromAllowedFactions;

// Update faction combo box
private _filteredFactions = missionNamespace getVariable ["FilteredFactions", []];
lbClear 2102;
private _ctrlComboFactions = ((findDisplay 2121) displayCtrl 2102);
{
    private _prettyFactionName = getText (configFile >> "CfgFactionClasses" >> _x >> "displayName");
    if (_x == "All") then {
        _prettyFactionName = localize "STR_VS_SPAWNER_ALL_FEMALE";
    };
    private _indexFaction = _ctrlComboFactions lbAdd _prettyFactionName;
    lbSetData [2102, _indexFaction, _x];
} forEach _remainingFactions;

// Log completion message
diag_log "VS_fnc_FillFactionCombo: Faction combo box updated.";
