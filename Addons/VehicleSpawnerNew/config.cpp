class CfgPatches {
	class VS_Core_Spawner{
		name = "Viking Studios - Vehicle Spawner";
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 1.0; //
		requiredAddons[] = {"cba_settings"}; //
	};
};

#include "hpp\definesSPAWNER.hpp"
#include "hpp\dialogsSPAWNER.hpp"

class CfgEditorCategories {
    class VS_Spawners {
        displayName = "VS Spawners";
    };
};

class CfgEditorSubcategories {
    class VS_AirSpawner {
        displayName = "Air Spawner";
    };
    class VS_LandSpawner {
        displayName = "Land Spawner";
    };
    class VS_SeaSpawner {
        displayName = "Sea Spawner";
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class VS_Spawner: NO_CATEGORY {
        displayName = "VS Spawners";
        priority = 2;
        side = 7;
    };
};

class CfgVehicles {
    #include "configs\parents.hpp"
    #include "configs\land.hpp"
    #include "configs\air.hpp"
    #include "configs\sea.hpp"
    #include "configs\zeus.hpp"
};

class CfgFunctions {
   	#include "configs\functions.hpp"
};

class Extended_PostInit_EventHandlers
{
   class VS_Core_Spawner_PostInit
   {
      Init = "call compile preProcessFileLineNumbers 'x\VS_C\spawner\Functions\general\fn_SpawnerInit.sqf'";
   };
};