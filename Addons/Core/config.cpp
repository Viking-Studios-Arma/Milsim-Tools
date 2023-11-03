class CfgPatches {
	class ONI_core {
		// Addon identity
		name = "ONI Recon - Core";
		author = "Viking Studios";
		authors[] = {"Amateur-god","Arend","2BNB"};
		url = "https://discord.gg/bkdGvUNFbb";
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		requiredAddons[] = {"A3_Modules_F","cba_settings","ace_arsenal","3DEN"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
	};
};
class CfgFunctions {
	class oni_core {
		class common {
			file = "\x\vs_oni_c\core\functions\common";
			class addDeployActions {};
			class addFullHeal {};
			class addSpectator {};
			class changeSpeakVolume {};
			class edenLoadSettings {};
			class edenCreateAssets {};
			class getCurators {};
			class getDeadPlayers {};
			class getDeployAnimations {};
			class isCurator {};
			class listDeadPlayers {};
			class notifyZeus {};
			class setDefaultLoadouts {};
			class openTimerUI {};
			class setRespawnTimer {};
			class getArsenalFilter {};
			class Arsenal {};
			class fullHeal {};
			class teleport {};
		};

		class zeus_modules {
			file = "\x\vs_oni_c\core\functions\zeus_modules";
			class addBarracks {};
			class forceRespawn {};
			class addMusicRadio {};
		};

		class eden_modules {
			file = "\x\vs_oni_c\core\functions\eden_modules";
			class barracksModule {};
		};

		class utilities {
			file = "\x\vs_oni_c\core\functions\utilities";
			class arrayFlatten {};
			class log {};
			class strToArray {};
			class toBoolean {};
		};
	};
};

class Extended_PreInit_EventHandlers {
	class oni_core_preInit {
		init = "call compile preprocessFileLineNumbers '\x\vs_oni_c\core\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class oni_core_postInit {
		init = "call compile preprocessFileLineNumbers '\x\vs_oni_c\core\XEH_postInit.sqf'";
	};
};

// Config features/fixes
#include "configs\CfgDefines.hpp"
#include "configs\CfgDirectConnect.hpp"
#include "configs\CfgEdenGUI.hpp"
#include "configs\CfgEdenLoadouts.hpp"
#include "configs\CfgEdenModules.hpp"
#include "configs\CfgEdenTools.hpp"
#include "configs\CfgEnableDebug.hpp"
#include "configs\CfgLadderTweak.hpp"
#include "configs\CfgMedicalEquipment.hpp"
#include "configs\CfgUnitTrainerTools.hpp"
#include "configs\CfgVehicleDeploy.hpp"
#include "configs\CfgZenMenu.hpp"
#include "configs\CfgZeusActions.hpp"
#include "Configs\CfgDirectConnect.hpp"