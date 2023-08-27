class CfgPatches {
	class MRHSpawner{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {""}; //
	};
};

#include "x\vs_oni_c\MRHVehicleSpawner\DialogsHPP\definesSPAWNER.hpp"
#include "x\vs_oni_c\MRHVehicleSpawner\DialogsHPP\dialogsSPAWNER.hpp"

/////=========cfgFunctions========
class CfgFunctions
{
	#include "x\vs_oni_c\MRHVehicleSpawner\cfghpp\cfgfunctions.hpp"
};
////=============fincfgFunctions
////=============fincfgFunctions
class Extended_PreInit_EventHandlers
{
   class MRHSpawnerInit
   {
      serverInit = "call compile preProcessFileLineNumbers 'x\vs_oni_c\MRHVehicleSpawner\Functions\fn_Spawner_SpawnerInit.sqf'";
   };
};