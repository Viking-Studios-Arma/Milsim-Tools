/*
Function name: VS_core_fnc_Spawner_SpawnerInit
Author: Mr H.
Description: Reads config files to generate a list of allowed DLCs and Factions, stores them in missionNameSpace variables for further use, adds them to cba settings.
Return value: none
Public: No
Parameters:None
Example:
call VS_core_fnc_Spawner_SpawnerInit;
(called upon clien int through cba preInit event handlers)
*/

/////////////General List finds all vehicles in all cfgs
[] spawn {
	// Suspend the whole damn thing until the required CBA Settings are available
	waitUntil {
		sleep 0.5;
		!(isNil "cba_settings_ready")
	};
_allVehicleConfigs = "true" configClasses (configFile >> "CfgVehicles");
_allVehicleConfigNames = _allVehicleConfigs apply {configName _x};

_allVehiclesArray = [];
{
	_disp = getnumber (configfile >> "CfgVehicles" >> _x >> "scope");
	_subcat = gettext (configfile >> "CfgVehicles" >> _x >> "editorSubcategory");
		if (_disp == 2) then 
		{
			if (_x isKindOf "Helicopter_Base_F" or _x isKindOf "Plane_Base_F" or _x isKindOf "UAV" or _x isKindOf "Car_F" or _x isKindOf "Tank_F" or _x isKindOf "Boat_F") then 
			{
			_allVehiclesArray pushBackUnique _x; 
			}
		}
} forEach _allVehicleConfigNames;
missionNameSpace setVariable ["SPAWNER_ALLConfigVehicles", _allVehiclesArray, true];


/////////List Dlcs and put them as options
_array = [];

{
	_dlc = gettext (configfile >> "CfgVehicles" >> _x >> "dlc");

	if (_dlc == "") then 
		{
		_dlc = "Vanilla";
		};
	if !(_dlc in _array) then 
		{
		_array pushBack _dlc;
		};
} forEach _allVehiclesArray;

missionNameSpace setVariable ["SPAWNER_DLCsList", _array,true];

{
	[_x , "CHECKBOX",gettext (configfile >> "CfgMods" >> _x >> "name"), "VS Spawner Allowed DLCs", true,1, { call VS_core_fnc_Spawner_AllowedDLCs;}] call cba_settings_fnc_init;
	Diag_log format ["VS Spawner AllDLCs -SpawnerInit.sqf: %1", str _x];
} forEach _array;
/////////////////////////Listfactions and put them as options
_FactionsArray = [];
{
	_faction = gettext (configfile >> "CfgVehicles" >> _x >> "faction");
	if !(_faction in _FactionsArray) then 
		{
		_FactionsArray pushBack _faction;
		};
} forEach _allVehiclesArray;

{
	if (_x == "Default") then 
	{
		 _deBuGMess = format ["VS Spawner - error faction %1 is named 'default' faction will not be included to avoid conflicts with cba", (str _x)];
		 Diag_log _deBuGMess;
	 } 
	 else 
	 {
		[_x , "CHECKBOX",gettext (configfile >> "CfgFactionClasses" >> _x >> "displayname"), "VS Spawner Allowed Factions", true,1, { call VS_core_fnc_Spawner_AllowedFactions;}] call cba_settings_fnc_init;
		Diag_log format ["VS Spawner AllFactions -SpawnerInit.sqf: %1", str _x];
	};
} forEach _FactionsArray;
missionNameSpace setVariable ["SPAWNER_FactionsList", _FactionsArray,true];
};
call VS_core_fnc_Spawner_SortFactionsAlgo;

