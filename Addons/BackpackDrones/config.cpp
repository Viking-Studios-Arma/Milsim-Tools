class CfgPatches {
	class VS_C_Backpack_Drones {
		// Addon identity
		name = "Viking Studios - Backpack Drone Items";
		author = "Viking Studios";
		authors[] = {"Amateur-god"};
		url = "https://discord.gg/bkdGvUNFbb";
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		requiredAddons[] = {"A3_Modules_F","cba_settings","ace_arsenal","3DEN","ace_medical"};
		units[] = {"VS_ED_1E","VS_ED_1D","VS_AR_2"};
		weapons[] = {"VS_C_ED_1D_Item","VS_C_ED_1E_Item","VS_C_AR2_Item"};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
	};
};

class CfgVehicles {
	class B_UGV_02_Demining_F;
	class B_UGV_02_Science_F;
	class B_UAV_01_F;
	class O_UGV_02_Demining_F;
	class O_UGV_02_Science_F;
	class O_UAV_01_F;
	class I_UGV_02_Demining_F;
	class I_UGV_02_Science_F;
	class I_UAV_01_F;
	class C_IDAP_UGV_02_Demining_F;
	class C_IDAP_UAV_01_F;
    class ItemCore;
    class CBA_MiscItem_ItemInfo;
	class Man;
#include "Configs\Ace.hpp"
#include "Configs\Drones.hpp"
};

#include "Configs\CfgWeapons.hpp"

class CfgFunctions {
	class VS_C_Drone {
		class Place {
            tag = "VS_C_drones";
            file = "x\VS_C\Backpack-Drones\Functions";
			class ED1D_Create {};
			class ED1E_Create {};
			class AR2_Create {};
        };
		class Pack {
            tag = "VS_C_drones";
            file = "x\VS_C\Backpack-Drones\Functions";
			class ED1D_Pack {};
			class ED1E_Pack {};
			class AR2_Pack {};
        };
    };
};
class Extended_PostInit_EventHandlers
{
	class ADDON
	{
		clientInit = "call compile preprocessFileLineNumbers 'x\VS_C\Backpack-Drones\Player_init.sqf'";
	};
};
