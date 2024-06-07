/*
Function name: VS_fnc_OpenInterface
Author: Amateur-God
Description: Opens and fills the spawner interface.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_OpenInterface;
*/

// Create the dialog
createDialog "VS_Spawner";
disableSerialization;

// Set default picture and icon
private _defaultPic = "x\VS_C\spawner\Paa\welcome.paa";
((findDisplay 2121) displayCtrl 1201) ctrlSetText _defaultPic;
private _iconPic = "x\VS_C\spawner\Paa\VSlogo.paa";
((findDisplay 2121) displayCtrl 1203) ctrlSetText _iconPic;

// Define localization variables
private _localizations = [
    ["All", localize "STR_VS_SPAWNER_ALL_MALE"],
    ["Helis", localize "STR_VS_SPAWNER_CHOPPERS"],
    ["Planes", localize "STR_VS_SPAWNER_PLANES"],
    ["Drones", localize "STR_VS_SPAWNER_DRONES"],
    ["Cars", localize "STR_VS_SPAWNER_CARS"],
    ["Trucks", localize "STR_VS_SPAWNER_TRUCKS"],
    ["APCs", localize "STR_VS_SPAWNER_APCs"],
    ["MRAPs", localize "STR_VS_SPAWNER_MRAPS"],
    ["Tanks", localize "STR_VS_SPAWNER_TANKS"],
    ["Maritime", localize "STR_VS_SPAWNER_MARITIME"]
];

// Define category choices based on type
private _categoriesByType = [
    ["All", ["All", "Helis", "Planes", "Drones", "Cars", "Trucks", "APCs", "MRAPs", "Tanks", "Maritime"]],
    ["Air", ["All", "Helis", "Planes", "Drones"]],
    ["Land", ["All", "Cars", "Trucks", "APCs", "MRAPs", "Tanks"]],
    ["Sea", ["All", "Maritime"]]
];

// Refresh the main list
[] spawn {
    disableSerialization;
    call VS_fnc_RefreshMainList;

    // Retrieve necessary variables
    private _sourceObject = player getVariable ["SourceObject", objNull];
    private _typeToSpawn = _sourceObject getVariable ["TypeToSpawn", "All"];
    waitUntil { !isNil _typeToSpawn };

    private _ctrlCombo = ((findDisplay 2121) displayCtrl 2100);

    // Add categories to combo box
    {
        private _category = _x;
        private _localization = _localizations select { _x select 0 == _category } select 0 select 1;
        private _index = _ctrlCombo lbAdd _localization;
        _ctrlCombo lbSetData [2100, _index, _category];
    } forEach (_categoriesByType select { _x select 0 == _typeToSpawn } select 0 select 1);
};
