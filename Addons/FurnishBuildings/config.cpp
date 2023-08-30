class CfgPatches {
	class ONI_core_FursnishBuildings{
    author = "Tinter";
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {}; //
	};
};
class CfgFunctions {
  #include "furniture\func.hpp"
};
class Extended_PreInit_EventHandlers {
    class tinter_furniture_pre_init {
        init = "call compile preprocessFileLineNumbers 'x\vs_oni_c\Furnish_Buildings\furniture\XEH_preInit.sqf'";
    };
};
