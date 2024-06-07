/*
Function name: VS_fnc_FilterAllVehicles
Author: Amateur-God
Description: Produces a list of all vehicles after filters have been applied.
Return value: <ARRAY> of vehicle classnames.
Public: No
Parameters: None
Example(s): call VS_fnc_FilterAllVehicles;
*/

// Retrieve necessary variables
private _sourceObject = player getVariable ["SourceObject", objNull];
private _typeToSpawn = _sourceObject getVariable ["TypeToSpawn", "All"];
waitUntil { !isNil _typeToSpawn };
private _allVehiclesArray = missionNamespace getVariable ["AllConfigVehicles", []];

// Initialize resulting array
private _resultingArray = [];

// Helper function to filter vehicles by type
private _filterByType = {
    params ["_vehicle", "_type"];
    switch (_type) do {
        case "Air": { _vehicle isKindOf "Helicopter_Base_F" or _vehicle isKindOf "Plane_Base_F" };
        case "Land": { _vehicle isKindOf "Car_F" or _vehicle isKindOf "Tank_F" };
        case "Sea": { _vehicle isKindOf "Boat_F" or _vehicle isKindOf "Ship_F" };
        default { true };
    };
};

// Filter vehicles by type to spawn
{
    if ([ _x, _typeToSpawn ] call _filterByType) then {
        _resultingArray pushBack _x;
    };
} forEach _allVehiclesArray;

// Helper function to filter vehicles by subcategory
private _filterBySubcategory = {
    params ["_vehicle", "_subcategory"];
    private _subcat = getText (configFile >> "CfgVehicles" >> _vehicle >> "editorSubcategory");
    switch (_subcategory) do {
        case "Maritime": { _subcat == "EdSubcat_Boats" or _subcat == "EdSubcat_Submersibles" };
        case "Helis": { _subcat != "EdSubcat_Drones" and _vehicle isKindOf "Helicopter_Base_F" };
        case "Planes": { _subcat != "EdSubcat_Drones" and _vehicle isKindOf "Plane_Base_F" };
        case "Drones": { _subcat == "EdSubcat_Drones" and (_vehicle isKindOf "Helicopter_Base_F" or _vehicle isKindOf "Plane_Base_F" or _vehicle isKindOf "UAV") };
        case "APCs": { _subcat == "EdSubcat_APCs" };
        case "Cars": { _subcat == "EdSubcat_Cars" };
        case "Tanks": { _subcat == "EdSubcat_Tanks" };
        case "MRAPs": { _subcat == "rhs_EdSubcat_mrap" };
        case "Trucks": { _subcat == "rhs_EdSubcat_truck" };
        default { false };
    };
};

// Apply additional filters based on user-selected vehicle type
private _userSelectedVehicleType = player getVariable ["UserSelectedVehicleType", "All"];
if !isNil _userSelectedVehicleType then {
    private _filteredArray = [];

    {
        if ([ _x, _userSelectedVehicleType ] call _filterBySubcategory) then {
            _filteredArray pushBack _x;
        };
    } forEach _resultingArray;

    _resultingArray = _filteredArray;
};

// Return the resulting array
_resultingArray;
