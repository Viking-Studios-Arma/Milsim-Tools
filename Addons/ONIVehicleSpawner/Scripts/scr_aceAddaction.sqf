_object = _this select 0;

_statement = {

 call oni_core_fnc_Spawner_OpenInterface;
_object = _this select 0;
player setVariable ["SourceObjectSpawner", _object, true];
};
_loc = localize "STR_ONI_SPAWNER_ACEOPEN"; 
_action =
["SpawnAirShip", 
_loc,
 "x\vs_oni_c\spawner\Paa\iconespawner.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 

 