/*
Function name: VS_fnc_RefreshMainList
Author: Amateur-God
Description: Refreshes the main list of the interface.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_RefreshMainList;
*/

#define DISPLAY_ID 2121
#define LIST_CTRL_ID 1500
#define DLC_COMBO_CTRL_ID 2101

private _getConfigValue = {
    params ["_configPath", "_defaultValue"];
    private _value = getText _configPath;
    if (_value isEqualTo "") then {
        _value = _defaultValue;
    };
    _value
};

disableSerialization;

private _allowedDLCsList = missionNamespace getVariable ["AllowedDLCsList", []];
private _allowedFactionsList = missionNamespace getVariable ["AllowedFactionsList", []];
private _playerSelectedDLC = player getVariable ["UserSelectedDLC", []];
private _playerSelectedFaction = player getVariable ["UserSelectedFaction", []];

lbClear LIST_CTRL_ID;

[] spawn {
    disableSerialization;
    private _sourceObject = player getVariable "SourceObjectSpawner";
    private _type = _sourceObject getVariable "TypeToSpawn";
    waitUntil { !isNil "_type" };

    private _vehicleArray = call VS_fnc_FilterAllVehicles;
    waitUntil { !isNil "_vehicleArray" };

    private _finalDLCs = if (isNil "_playerSelectedDLC" || "All" in _playerSelectedDLC) then {
        _allowedDLCsList
    } else {
        _playerSelectedDLC
    };

    private _allRelevantFactions = missionNamespace getVariable ["FilteredFactions", []];
    private _finalFactions = if (isNil "_playerSelectedFaction" || "All" in _playerSelectedFaction) then {
        _allRelevantFactions
    } else {
        _playerSelectedFaction
    };

    private _ctrlList = ((findDisplay DISPLAY_ID) displayCtrl LIST_CTRL_ID);
    {
        private _vehicle = _x;
        private _icon = [configFile >> "CfgVehicles" >> _vehicle >> "icon", ""] call _getConfigValue;
        private _name = [configFile >> "CfgVehicles" >> _vehicle >> "displayName", _vehicle] call _getConfigValue;
        private _dlc = [configFile >> "CfgVehicles" >> _vehicle >> "dlc", "Vanilla"] call _getConfigValue;
        private _dlcPic = [configFile >> "CfgMods" >> _dlc >> "logo", "x\VS_C\spawner\Paa\arma3.paa"] call _getConfigValue;
        private _faction = [configFile >> "CfgVehicles" >> _vehicle >> "faction", ""] call _getConfigValue;

        if (_dlc in _finalDLCs && _faction in _finalFactions) then {
            private _index = _ctrlList lbAdd _name;
            lbSetPicture [LIST_CTRL_ID, _index, _icon];
            lbSetPictureRight [LIST_CTRL_ID, _index, _dlcPic];
            lbSetTooltip [LIST_CTRL_ID, _index, _dlc];
            lbSetData [LIST_CTRL_ID, _index, _vehicle];
        };
    } forEach _vehicleArray;

    lbClear DLC_COMBO_CTRL_ID;
    private _ctrlComboDLC = ((findDisplay DISPLAY_ID) displayCtrl DLC_COMBO_CTRL_ID);
    private _allChoiceIndex = _ctrlComboDLC lbAdd localize "STR_VS_SPAWNER_ALL_MALE";
    lbSetData [DLC_COMBO_CTRL_ID, _allChoiceIndex, "All"];

    {
        private _prettyDLCName = [configFile >> "CfgMods" >> _x >> "name", _x] call _getConfigValue;
        private _indexDLC = _ctrlComboDLC lbAdd _prettyDLCName;
        lbSetData [DLC_COMBO_CTRL_ID, _indexDLC, _x];
    } forEach _allowedDLCsList;
};
