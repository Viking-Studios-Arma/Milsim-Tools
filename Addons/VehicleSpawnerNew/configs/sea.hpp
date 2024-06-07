class RuggedTerminal_01_VS_Sea: RuggedTerminal_01_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Sea Vehicle Spawner (Terminal)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_SeaSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Sea'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};
class B_Slingload_01_Repair_VS_Sea: B_Slingload_01_Repair_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Sea Vehicle Spawner (Container)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_SeaSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Sea'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};