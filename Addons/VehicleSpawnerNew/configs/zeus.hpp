class VS_Spawner_Module: Module_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "VS Vehicle Spawner";
    category = "VS_Spawner";
    function = "VS_fnc_Module_Spawn";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;
    curatorCanAttach = 1;
    class Arguments {
        class SpawnerType {
            displayName = "Spawner Type";
            description = "Select the type of spawner to create.";
            typeName = "STRING";
            class Values {
				class All {
                    name = "All Vehicle Spawner";
                    value = "All";
                };
                class Air {
                    name = "Air Spawner";
                    value = "Air";
                };
                class Land {
                    name = "Land Spawner";
                    value = "Land";
                };
				class Sea {
                    name = "Sea Spawner";
                    value = "Sea";
                };
            };
        };
    };
    class ModuleDescription {
        description = "Spawns a selected vehicle spawner.";
    };
};