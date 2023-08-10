params [["_ctrl",controlNull]];

private _text = if ([] call oni_core_admin_messages_fnc_isAdminOrZeus) then {
	localize "STR_ONI_CORE_ADMIN_MESSAGES_SENDBOXTITLEADMIN"
} else {
	localize "STR_ONI_CORE_ADMIN_MESSAGES_SENDBOXTITLEPLAYER"
};

_ctrl ctrlSetText _text
