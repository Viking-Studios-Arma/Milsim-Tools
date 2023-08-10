#include "..\gui\defines.hpp"

params [["_ctrl",controlNull]];

if !([] call oni_core_admin_messages_fnc_isAdminOrZeus) exitWith {};

_ctrl ctrlSetPosition [ONI_CORE_ADMIN_MESSAGES_TITLE_X,ONI_CORE_ADMIN_MESSAGES_SENDBUTTON_Y_2];
_ctrl ctrlCommit 0;
