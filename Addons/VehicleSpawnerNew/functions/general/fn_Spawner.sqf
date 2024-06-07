/*
Function name: VS_fnc_Spawner
Author: Amateur-God
Description:
This function makes an object a vehicle spawner and gives it an interface. Allowed factions, mods, and DLCs can be defined via CBA settings by mission makers. The spawner can include all vehicles or filter them by types (Air, Land, Sea).
Return value: None
Public: Yes
Parameters:
0 - <OBJECT> - Source object that serves as a spawner interface, a laptop is appropriate.
1 - <STRING> - OPTIONAL - Type of vehicles this particular spawner will spawn. Can be "Air", "Land", "Sea", or "All". If you have multiple spawners in a mission, they can all have different types. If undefined, the type will be "All".
2 - <OBJECT> - OPTIONAL (requires parameter 1 to be defined) - Object that serves as a spawn point, preferably an invisible helipad. Note that the vehicle will spawn with the same direction the object has (useful for planes spawning facing the landing strip, etc.). If undefined, the vehicle will be spawned a few meters behind the source object.
Example(s):
[this] call VS_fnc_Spawner;
[this, "Air"] call VS_fnc_Spawner;
[this, "Air", helipad1] call VS_fnc_Spawner;
*/

params [
    "_object",
    ["_type", "All"], // Default to "All" if _type is not provided
    ["_spawnPosObject", objNull]
];

// Execute the external script to add ACE interaction
[_object] execVM "x\VS_C\spawner\scripts\scr_aceAddaction.sqf";

// Set the type of vehicles to spawn
_object setVariable ["TypeToSpawn", _type, true];

// Set the spawn position object if provided
if (!isNil "_spawnPosObject") then {
    _object setVariable ["SpawnPosObject", _spawnPosObject, true];
} else {
    [] spawn {
        waitUntil {time > 1};
        systemChat "VS_fnc_Spawner error: No spawn position was defined. Spawn will be set behind the source object.";
    };
};

// Validate the type parameter
if !(_type in ["All", "Air", "Land", "Sea"]) then {
    _type = "All"; // Default to "All" if the type is invalid
    _object setVariable ["TypeToSpawn", _type, true];
    [] spawn {
        waitUntil {time > 1};
        systemChat "VS_fnc_Spawner error: Wrong type defined. Type must be 'All', 'Air', 'Land', or 'Sea'. Default value has been set to 'All'.";
    };
};

// Log the initialized spawner details (optional for debugging)
