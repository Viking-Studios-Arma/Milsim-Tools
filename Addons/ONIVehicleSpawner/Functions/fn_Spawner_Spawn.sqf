/*
Function name: ONI_fnc_Spawn
Author: Mr H. Modified by Carmichael
Description: Spawns selected Vehicle
Return value: none
Public: No
Parameters: None
Example(s):
call ONI_fnc_Spawner_Spawn;
*/

[] Spawn {
_uav = ["ONI_Recon_MQ94","ONI_Recon_MQ221","ONI_Recon_ED_1D","ONI_Recon_ED_1E"];
_type = uinamespace getVariable "ONI_Spawner_tospawnclassname";
_sourceposition = player getVariable "SourceObjectSpawner";
_spawnPos = nil;
_spawnObject = _sourceposition getVariable "SpawnPosObject";
_spawnDir = nil;
if (isNil "_spawnObject") then {_spawnpos = _sourceposition modelToWorld [-15,0,0]; _spawnDir = 180;} else {_spawnpos = getPos _spawnObject; _spawnDir = getDir _spawnObject; };

waitUntil {!isNil "_spawnpos"};
///////clear spawn

_erasing = [_spawnPos, _spawnDir] Spawn {
{
params ["_spawnPos","_spawnDir"];
_distance = _x distance _spawnpos;
_wasCreated = _x getVariable "isONISpawnerCreatedVehicle";
if (isNil "_wasCreated") then {_wasCreated = false;};
if (_distance < 5 && _wasCreated) then {deleteVehicle _x};
} forEach Vehicles;
sleep 0.5;
hint localize "STR_ONI_SPAWNER_GENERATING1";
sleep 0.5;
hint localize "STR_ONI_SPAWNER_GENERATING2";
sleep 0.5;
hint localize "STR_ONI_SPAWNER_GENERATING3";
sleep 0.5;
hint localize "STR_ONI_SPAWNER_GENERATING4";
};
waitUntil {scriptDone _erasing};
////create new vehicle
_veh = _type createVehicle [0,0,0];
_veh setDir _spawnDir;
_veh allowdamage false; //Temp disable Damage on spawned vehicles because Arma be Arma
_veh setPos _spawnPos;
if ((_veh isKindOf "UAV") || ((TypeOf _veh) in _uav)) then {createVehicleCrew _veh};
sleep 1;
_veh allowdamage true; // Re-Enables damage
_veh setVariable ["isONISpawnerCreatedVehicle", true, true];
hint localize "STR_ONI_SPAWNER_VEHCREATED";
};