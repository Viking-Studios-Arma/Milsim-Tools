/*
Function name: VS_fnc_SpawnerInit
Author: Amateur-God
Description: Reads config files to generate a list of allowed DLCs and Factions, stores them in missionNamespace variables for further use, adds them to CBA settings.
Return value: None
Public: No
Parameters: None
Example: call VS_fnc_SpawnerInit;
(called upon client init through CBA preInit event handlers)
*/

[] spawn {
    waitUntil {
        sleep 0.5;
        !(isNil "cba_settings_ready")
    };

    private _allVehicleConfigs = "true" configClasses (configFile >> "CfgVehicles");
    private _allVehicleConfigNames = _allVehicleConfigs apply { configName _x };

    private _allVehiclesArray = [];
    {
        private _disp = getNumber (configFile >> "CfgVehicles" >> _x >> "scope");
        if (_disp == 2 && {_x isKindOf "Helicopter_Base_F" || _x isKindOf "Plane_Base_F" || _x isKindOf "UAV" || _x isKindOf "Car_F" || _x isKindOf "Tank_F" || _x isKindOf "Boat_F"}) then {
            _allVehiclesArray pushBack _x;
        }
    } forEach _allVehicleConfigNames;
    missionNamespace setVariable ["AllConfigVehicles", _allVehiclesArray, true];

    private _dlcArray = [];
    {
        private _dlc = getText (configFile >> "CfgVehicles" >> _x >> "dlc");
        if (_dlc == "") then { _dlc = "Vanilla"; };
        if !(_dlc in _dlcArray) then { _dlcArray pushBack _dlc; };
    } forEach _allVehiclesArray;
    missionNamespace setVariable ["DLCsList", _dlcArray, true];

    {
        [_x, "CHECKBOX", getText (configFile >> "CfgMods" >> _x >> "name"), "VS Spawner Allowed DLCs", true, 1, { call VS_fnc_FilterAllowedDLCs; }] call cba_settings_fnc_init;
    } forEach _dlcArray;

    private _factionsArray = [];
    {
        private _faction = getText (configFile >> "CfgVehicles" >> _x >> "faction");
        if !(_faction in _factionsArray) then { _factionsArray pushBack _faction; };
    } forEach _allVehiclesArray;

    {
        if (_x == "Default") then {
            diag_log format ["VS Spawner - error faction %1 is named 'default'. This faction will not be included to avoid conflicts with CBA", (str _x)];
        } else {
            [_x, "CHECKBOX", getText (configFile >> "CfgFactionClasses" >> _x >> "displayName"), "VS Spawner Allowed Factions", true, 1, { call VS_fnc_FilterAllowedFactions; }] call cba_settings_fnc_init;
        };
    } forEach _factionsArray;
    missionNamespace setVariable ["FactionsList", _factionsArray, true];
};

call VS_fnc_FilterAllowedDLCs;
call VS_fnc_SortFactionsAlgo;
diag_log "VS_fnc_SpawnerInit: Initialization complete.";
