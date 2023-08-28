class CfgPatches {
	class MRHSpawner{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
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
class Extended_PreInit_EventHandlers
{
   class MRHSpawnerInit
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHVehicleSpawner\Functions\fn_Spawner_SpawnerInit.sqf'";
   };
};