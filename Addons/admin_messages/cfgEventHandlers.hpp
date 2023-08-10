class Extended_PostInit_EventHandlers {
	class oni_core_admin_messages {
		serverInit = "call compile preprocessFileLineNumbers '\x\vs_oni_c\admin_messages\XEH_postInit.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class oni_core_admin_messages {
		clientInit = "call compile preprocessFileLineNumbers '\x\vs_oni_c\admin_messages\XEH_preClientInit.sqf'";
	};
};
