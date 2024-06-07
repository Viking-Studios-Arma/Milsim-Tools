class RuggedTerminal_01_VS_Land: RuggedTerminal_01_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Land Vehicle Spawner (Terminal)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_LandSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Land'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};
class B_Slingload_01_Repair_VS_Land: B_Slingload_01_Repair_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Land Vehicle Spawner (Container)";
    editorCategory = "VS_Spawners";
    editorSubcategory = "VS_LandSpawner";
    class EventHandlers {
        init = "[_this select 0, 'Land'] call compile preprocessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_Spawner.sqf';";
    };
};