/*
Function name: VS_core_fnc_Spawner_OpenInterface
Author: Mr H.
Description: Opens and fills the spawner interface
Return value: none
Public: No
Parameters: None
Example(s): VS_core_fnc_Spawner_OpenInterface;
*/

///creates the dialog
createdialog "VS_Spawner";
/////////////////////
disableserialization;
//////////sets defaultpic
_pic = "x\VS_C\spawner\Paa\welcome.paa";
((findDisplay 2121) displayCtrl 1201) ctrlSetText _pic;
_icon = "x\VS_C\spawner\Paa\VSlogo.paa";
((findDisplay 2121) displayCtrl 1203) ctrlSetText _icon;




[] Spawn {
disableserialization;
call VS_core_fnc_Spawner_RefreshMainList;
_sourceObject = player getVariable "SourceObjectSpawner";///ici
_Type = _sourceObject getVariable "TypeToSpawn"; 
waitUntil {!isNil "_Type"};
disableserialization;
///// DEFINES CATEGORY CHOICES
_ctrlcombo = ((findDisplay 2121) displayCtrl 2100);
////localization vars
_locAll = localize "STR_VS_SPAWNER_ALL_MALE";
_locChops= localize "STR_VS_SPAWNER_CHOPPERS";
_locPlanes = localize "STR_VS_SPAWNER_PLANES";
_locUAV = localize "STR_VS_SPAWNER_DRONES";
_locCrs = localize "STR_VS_SPAWNER_CARS";
_locTrucks = localize "STR_VS_SPAWNER_TRUCKS";
_locAPC = localize "STR_VS_SPAWNER_APCs";
_locMRAP = localize "STR_VS_SPAWNER_MRAPS";
_locTanks= localize "STR_VS_SPAWNER_TANKS";
_locSea = localize "STR_VS_SPAWNER_MARITIME";
///
switch (true) do {
case (_Type == "All") : {
_allTypes = _ctrlcombo lbadd _locAll;
lbSetData [2100, _allTypes, "All"]; 
_Helis = _ctrlcombo lbadd _locChops;
lbSetData [2100, _Helis, "Helis"]; 
_Planes = _ctrlcombo lbadd _locPlanes;
lbSetData [2100, _Planes, "Planes"];
_Drones = _ctrlcombo lbadd _locUAV;
lbSetData [2100, _Drones, "Drones"];
_Cars = _ctrlcombo lbadd _locCrs;
lbSetData [2100, _Cars, "Cars"]; 
_Trucks = _ctrlcombo lbadd _locTrucks;
lbSetData [2100, _Trucks, "Trucks"];
_APCs= _ctrlcombo lbadd _locAPC;
lbSetData [2100, _APCs, "APCs"];
_MRAPs = _ctrlcombo lbadd _locMRAP;
lbSetData [2100, _MRAPs, "MRAPs"];
_Tanks = _ctrlcombo lbadd _locTanks;
lbSetData [2100, _Tanks, "Tanks"];
_Maritime = _ctrlcombo lbadd _locSea;
lbSetData [2100, _Maritime, "Maritime"];
};

case (_Type == "Air") : {
_allTypes = _ctrlcombo lbadd _locAll;
lbSetData [2100, _allTypes, "All"];
_Helis = _ctrlcombo lbadd _locChops;
lbSetData [2100, _Helis, "Helis"]; 
_Planes = _ctrlcombo lbadd _locPlanes;
lbSetData [2100, _Planes, "Planes"];
_Drones = _ctrlcombo lbadd _locUAV;
lbSetData [2100, _Drones, "Drones"];
};

case (_Type == "Land") : {
_allTypes = _ctrlcombo lbadd _locAll;
lbSetData [2100, _allTypes, "All"];
_Cars = _ctrlcombo lbadd _locCrs;
lbSetData [2100, _Cars, "Cars"]; 
_Trucks = _ctrlcombo lbadd _locTrucks;
lbSetData [2100, _Trucks, "Trucks"];
_APCs= _ctrlcombo lbadd _locAPC;
lbSetData [2100, _APCs, "APCs"];
_MRAPs = _ctrlcombo lbadd _locMRAP;
lbSetData [2100, _MRAPs, "MRAPs"];
_Tanks = _ctrlcombo lbadd _locTanks;
lbSetData [2100, _Tanks, "Tanks"];
};

case (_Type == "Sea") : {
_allTypes = _ctrlcombo lbadd _locAll;
lbSetData [2100, _allTypes, "All"];
_Maritime = _ctrlcombo lbadd _locSea;
lbSetData [2100, _Maritime, "Maritime"];

};
};





///EndSpawnBelow
};