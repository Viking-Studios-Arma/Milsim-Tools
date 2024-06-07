params ["_logic", "_unit", "_args"];

private _spawnerType = _args select 0;

private _pos = getPos _logic;
private _dir = getDir _logic;

switch (_spawnerType) do {
    case "Air": {
        _spawner = "RuggedTerminal_01_VS_Air" createVehicle _pos;
        _spawner setDir _dir;
    };
    case "Land": {
        _spawner = "B_Slingload_01_Repair_VS_Land" createVehicle _pos;
        _spawner setDir _dir;
    };
};

deleteVehicle _logic;
