/*
Function name: VS_fnc_Spawn
Author: Amateur-God
Description: Spawns the selected vehicle.
Return value: None
Public: No
Parameters: None
Example(s): call VS_fnc_Spawn;
*/
[] spawn {
    // Retrieve necessary variables
    private _uavList = ["VS_Recon_MQ94", "VS_Recon_MQ221", "VS_Recon_ED_1D", "VS_Recon_ED_1E"];
    private _type = uiNamespace getVariable ["VS_Spawner_toSpawnClassName", ""];
    private _sourcePosition = player getVariable ["SourceObjectSpawner", objNull];

    if (isNil "_type" || isNil "_sourcePosition") exitWith {
        hint localize "STR_VS_SPAWNER_ERROR_NOSPAWN";
    };

    private _spawnPosObject = _sourcePosition getVariable ["SpawnPosObject", objNull];
    private _spawnPos;
    private _spawnDir;

    if (isNil "_spawnPosObject") then {
        _spawnPos = _sourcePosition modelToWorld [0, -10, 0];
        _spawnDir = getDir _sourcePosition;
    } else {
        _spawnPos = getPos _spawnPosObject;
        _spawnDir = getDir _spawnPosObject;
    };

    waitUntil {!isNil "_spawnPos"};

    // Clear the spawn area
    private _clearSpawnArea = [_spawnPos, _spawnDir] spawn {
        params ["_spawnPos", "_spawnDir"];
        {
            private _distance = _x distance _spawnPos;
            private _wasCreated = _x getVariable ["isVSSpawnerCreatedVehicle", false];
            if (_distance < 5 && _wasCreated) then {
                deleteVehicle _x;
            };
        } forEach vehicles;

        sleep 0.5;
        ["STR_VS_SPAWNER_GENERATING1", "STR_VS_SPAWNER_GENERATING2", "STR_VS_SPAWNER_GENERATING3", "STR_VS_SPAWNER_GENERATING4"] apply {
            hint localize _x;
            sleep 0.5;
        };
    };

    waitUntil {scriptDone _clearSpawnArea};

    // Create the new vehicle
    private _vehicle = createVehicle [_type, [0, 0, 1000 + random 1000], [], 0, "CAN_COLLIDE"];
    _vehicle setDir _spawnDir;
    _vehicle allowDamage false;  // Temporarily disable damage on spawned vehicles
    _vehicle setPos _spawnPos;

    // Create UAV crew if the vehicle is a UAV
    if ((_vehicle isKindOf "UAV") || (toLower (getText (configFile >> "CfgVehicles" >> _type >> "crew")) find "uav" != -1)) then {
        createVehicleCrew _vehicle;
    };

    sleep 1;
    _vehicle allowDamage true;  // Re-enable damage
    _vehicle setVariable ["isVSSpawnerCreatedVehicle", true, true];
    hint localize "STR_VS_SPAWNER_VEHCREATED";
};
