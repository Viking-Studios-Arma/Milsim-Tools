class RuggedTerminal_01_VS_Air: RuggedTerminal_01_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Aircraft Vehicle Spawner (Terminal)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_AirSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Air'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};
class B_Slingload_01_Repair_VS_Air: B_Slingload_01_Repair_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Aircraft Vehicle Spawner (Container)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_AirSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Air'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};