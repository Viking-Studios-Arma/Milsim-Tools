_object = _this select 0;

_statement = {
    call VS_fnc_OpenInterface;
    _object = _this select 0;
    player setVariable ["SourceObjectSpawner", _object, true];
};

_loc = localize "STR_VS_SPAWNER_ACEOPEN";
_action = [
    "SpawnAirShip", 
    _loc,
    "x\VS_C\spawner\Paa\iconespawner.paa", 
    _statement,
    {true},
    {},
    [],
    [0,0,0], 
    5
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
