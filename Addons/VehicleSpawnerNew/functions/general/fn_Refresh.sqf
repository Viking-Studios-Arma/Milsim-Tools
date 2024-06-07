/*
Function name: VS_fnc_Refresh
Author: Amateur-God
Description: Refreshes the list with data on selected vehicle.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_Refresh;
*/

// Constants for display and control IDs
#define DISPLAY_ID 2121
#define LIST_CTRL_ID 1500
#define PIC_CTRL_ID 1201
#define ICON_CTRL_ID 1203
#define NAME_CTRL_ID 1100

// Function to safely get a config value
private _getConfigValue = {
    params ["_configPath", "_defaultValue"];
    private _value = getText _configPath;
    if (_value isEqualTo "") then {
        _value = _defaultValue;
    };
    _value
};

disableSerialization;

// Retrieve the necessary UI controls
private _display = findDisplay DISPLAY_ID;
private _ctrlList = _display displayCtrl LIST_CTRL_ID;
private _ctrlPic = _display displayCtrl PIC_CTRL_ID;
private _ctrlIcon = _display displayCtrl ICON_CTRL_ID;
private _ctrlName = _display displayCtrl NAME_CTRL_ID;

// Get the selected vehicle's class name
private _curSel = lbCurSel LIST_CTRL_ID;
private _className = _ctrlList lbData _curSel;

// Get the vehicle's preview image and icon
private _pic = [_configFile >> "CfgVehicles" >> _className >> "editorPreview", ""] call _getConfigValue;
_ctrlPic ctrlSetText _pic;

private _icon = [_configFile >> "CfgVehicles" >> _className >> "icon", ""] call _getConfigValue;
_ctrlIcon ctrlSetText _icon;

// Get and format the vehicle's display name
private _name = [_configFile >> "CfgVehicles" >> _className >> "displayName", ""] call _getConfigValue;
private _formattedName = parseText format ["<t font='PuristaLight' size='1' color='#ba2f01'>%1</t>", _name];
_ctrlName ctrlSetStructuredText _formattedName;

// Set the vehicle class name to be spawned
uiNamespace setVariable ["toSpawnClassName", _className];
