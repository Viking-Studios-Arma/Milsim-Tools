class CfgPatches {
	class ONI_core_Spawner{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_settings"}; //
	};
};

#include "DialogsHPP\definesSPAWNER.hpp"
#include "DialogsHPP\dialogsSPAWNER.hpp"

/////=========cfgFunctions========
class CfgFunctions
{
	#include "cfgHPP\cfgfunctions.hpp"
};
////=============fincfgFunctions
////=============fincfgFunctions
class Extended_PostInit_EventHandlers
{
   class ONI_Core_Spawner_PostInit
   {
      Init = "call compile preProcessFileLineNumbers 'x\vs_oni_c\spawner\Functions\fn_Spawner_SpawnerInit.sqf'";
   };
};
