////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Wataty)
////////////////////////////////////////////////////////
class ONISpawner
{
	idd=2121;
	movingenable=false;
	
	class controls 
	{

class ONISpawnerLaptop: RscPictureONISpawner
{
	idc = 1200;
	text = "x\vs_oni_c\spawner\paa\laptop.paa";
	x = 0.00125001 * safezoneW + safezoneX;
	y = -0.00399999 * safezoneH + safezoneY;
	w = 0.9975 * safezoneW;
	h = 1.008 * safezoneH;
};

class ONISpawnButton: RscButtonONISpawner
{
	idc = 1600;
	text = $STR_ONI_SPAWNER_SPAWNBUTTON;
	x = 0.677188 * safezoneW + safezoneX;
	y = 0.528 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.042 * safezoneH;
	action = "call oni_core_fnc_Spawner_Spawn";
};
class ONIquitter: RscButtonONISpawner
{
	idc = 1601;
	text = $STR_ONI_SPAWNER_CLOSEBUTTON;
	x = 0.677188 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.042 * safezoneH;
	action = "closedialog 0";
};
class ONIPreview: RscPictureONISpawner
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.276 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.21 * safezoneH;
};
class ONICTRLGRP: RscControlsGroupONISpawner
{
	idc = 2301;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.206 * safezoneH + safezoneY;
	w = 0.295312 * safezoneW;
	h = 0.378 * safezoneH;
	class Controls
	{
		class ONIlist: RscListboxONISpawner
{
	idc = 1500;
	x = 0;
	y = 0;
	w = 0.295312 * safezoneW;
	h = 0.378 * safezoneH;
	onMouseButtonClick = "call oni_core_fnc_Spawner_Refresh";
};
	};
};

class ONIName: RscStructuredTextONISpawner
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.028 * safezoneH;
};

class ONIIcon: RscPictureONISpawner
{
	idc = 1203;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.605 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
class ONICatergorycchoice: RscComboONISpawner
{
	idc = 2100;
	text = ""; //--- ToDo: Localize;
	x = 0.26375 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.275625 * safezoneW;
	h = 0.028 * safezoneH;
	onLBSelChanged = "_ONIvalue = _this select 1; [_ONIvalue] call oni_core_fnc_Spawner_SelectType;";
};
class ONIDLCSelect: RscComboONISpawner
{
	idc = 2101;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.528 * safezoneH + safezoneY;
	w = 0.124687 * safezoneW;
	h = 0.028 * safezoneH;
	tooltip = $STR_ONI_SPAWNER_SELECTMODTOOLTIP;
	onLBSelChanged = "_ONIvalue = _this select 1; [_ONIvalue] call oni_core_fnc_Spawner_UserSelectedDLC;";
};
class ONIFactionSelect: RscComboONISpawner
{
	idc = 2102;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.124687 * safezoneW;
	h = 0.028 * safezoneH;
	tooltip = $STR_ONI_SPAWNER_SELECTFACTIONTOOLTIP; //--- ToDo: Localize;
	onLBSelChanged = "_ONIvalue = _this select 1; [_ONIvalue] call oni_core_fnc_UserSelectedFaction;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};