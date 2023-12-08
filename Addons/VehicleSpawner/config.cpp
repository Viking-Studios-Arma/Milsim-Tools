class CfgPatches {
	class VS_core_Spawner{
		name = "Viking Studios - Vehicle Spawner";
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
	#include "Configs\cfgfunctions.hpp"
};
////=============fincfgFunctions
////=============fincfgFunctions
class Extended_PostInit_EventHandlers
{
   class VS_Core_Spawner_PostInit
   {
      Init = "call compile preProcessFileLineNumbers 'x\VS_C\spawner\Functions\fn_Spawner_SpawnerInit.sqf'";
   };
};
