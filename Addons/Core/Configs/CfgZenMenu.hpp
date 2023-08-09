/* ----------------------------------------------------------------------------
Config: ZEN Menu

Description:
	Registers ZEN Context Menu items to be used by Zeus when right clicking.

Author:
	Arend
---------------------------------------------------------------------------- */
class zen_context_menu_actions {
	class bnb_es_barracksFunction {
		displayName = "Add Barracks Functions";
		icon = "\a3\ui_f\data\logos\a_64_ca.paa";
		iconColor = [1,0.27,0,1];
		condition = "!(_objects isEqualTo [])";
		statement = "[_position, _objects] call bnb_es_core_fnc_addBarracks;";

		class bnb_es_fullHeal {
			displayName = "Add Full Heal";
			icon = "x\vs_oni\core\red-cross.paa";
			statement = "[_objects] remoteExec ['oni_core_fnc_fullHeal', 2];['Full Heal added!'] call bnb_es_core_fnc_notifyZeus;";
		};

		class bnb_es_spectator {
			displayName = "Add Spectator";
			icon = "x\vs_oni\core\camera.paa";
			statement = "[_objects] remoteExec ['bnb_es_core_fnc_addSpectator', 2];['Spectator added!'] call bnb_es_core_fnc_notifyZeus;";
		};
	};
};
