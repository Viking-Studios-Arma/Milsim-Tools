/*
Function name: VS_fnc_Spawn
Author: Amateur-God
Description: Spawns the selected vehicle.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_Spawn;
*/
[] Spawn {
    _uav = ["VS_Recon_MQ94","VS_Recon_MQ221","VS_Recon_ED_1D","VS_Recon_ED_1E"];
    _type = uinamespace getVariable "VS_Spawner_tospawnclassname";
    _sourceposition = player getVariable "SourceObjectSpawner";
    _spawnPos = nil;
    _spawnObject = _sourceposition getVariable "SpawnPosObject";
    _spawnDir = nil;
    if (isNil "_spawnObject") then {_spawnpos = _sourceposition modelToWorld [0,-10,0]; _spawnDir = 0;} else {_spawnpos = getPos _spawnObject; _spawnDir = getDir _spawnObject; };

    waitUntil {!isNil "_spawnpos"};
    ///////clear spawn

    _erasing = [_spawnPos, _spawnDir] Spawn 
    {
        {
            params ["_spawnPos","_spawnDir"];
            _distance = _x distance _spawnpos;
            _wasCreated = _x getVariable "isVSSpawnerCreatedVehicle";
            if (isNil "_wasCreated") then {_wasCreated = false;};
            if (_distance < 5 && _wasCreated) then {deleteVehicle _x};
        } forEach Vehicles;
        sleep 0.5;
        hint localize "STR_VS_SPAWNER_GENERATING1";
        sleep 0.5;
        hint localize "STR_VS_SPAWNER_GENERATING2";
        sleep 0.5;
        hint localize "STR_VS_SPAWNER_GENERATING3";
        sleep 0.5;
        hint localize "STR_VS_SPAWNER_GENERATING4";
    };
    waitUntil {scriptDone _erasing};
    ////create new vehicle
    _veh = createVehicle [_type, [0,0,1000 + random 1000], [], 0, "CAN_COLLIDE"];
    _veh setDir _spawnDir;
    _veh allowdamage false; //Temp disable Damage on spawned vehicles because Arma be Arma
    _veh setPos _spawnPos;
    if ((_veh isKindOf "UAV") || (toLower (getText (configfile >> "CfgVehicles" >> _type >> "crew")) find "uav" != -1)) then {createVehicleCrew _veh};
    sleep 1;
    _veh allowdamage true; // Re-Enables damage
    _veh setVariable ["isVSSpawnerCreatedVehicle", true, true];
    hint localize "STR_VS_SPAWNER_VEHCREATED";
};