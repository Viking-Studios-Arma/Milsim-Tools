params ["_sender","_UID","_message",["_receiveCondition",{[] call oni_core_admin_messages_fnc_isAdminOrZeus}],["_receiveConditionParams",[]]];

if !(hasInterface) exitWith {};
if !(_receiveConditionParams call _receiveCondition) exitWith {};
if (profileName == _sender) exitWith {};

if (isNil "oni_core_admin_messages_latestConvos") then {oni_core_admin_messages_latestConvos = []};
if (oni_core_admin_messages_latestConvos find [toUpper _sender,_UID] < 0) then {
	reverse oni_core_admin_messages_latestConvos;
	oni_core_admin_messages_latestConvos pushBack [toUpper _sender,_UID];
	reverse oni_core_admin_messages_latestConvos;
};
if (count oni_core_admin_messages_latestConvos > 5) then {oni_core_admin_messages_latestConvos resize 5};

[_sender,_message] call oni_core_admin_messages_fnc_displayMessage;

playSound "3DEN_notificationWarning";
