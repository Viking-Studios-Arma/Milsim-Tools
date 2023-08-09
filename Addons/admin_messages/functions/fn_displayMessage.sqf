#include "..\gui\defines.hpp"

params [["_info",""],["_message",""]];

"oni_core_admin_messages_customChatLayer" cutRsc ["oni_core_admin_messages_rscCustomChat","PLAIN",-1,true];
private _customChatTitleDisplay = uiNamespace getVariable ["oni_core_admin_messages_rscCustomChat",displayNull];
private _ctrlText = _customChatTitleDisplay displayCtrl ONI_CORE_ADMIN_MESSAGES_IDC_CUSTOMCHATTEXT;

_ctrlText ctrlSetStructuredText parseText format ["<t color='#E51919'>%1</t> %2",format [localize "STR_ONI_CORE_ADMIN_MESSAGES_CHANNEL",_info],_message];

private _textHeight = ctrlTextHeight _ctrlText;
/* private _textWidth = ctrlTextWidth _ctrlText; */

(ctrlPosition _ctrlText) params ["_origX","_origY","_origW","_origH"];

_ctrlText ctrlSetPosition [_origX,_origY - _textHeight,_origW,_textHeight];
_ctrlText ctrlCommit 0;


// add message to chat either way >> user can check chat history on map, if enabled
oni_core_admin_messages_channel radioChannelAdd [player];
oni_core_admin_messages_channel radioChannelSetCallsign format [localize "STR_ONI_CORE_ADMIN_MESSAGES_CHANNEL",_info];

player customChat [oni_core_admin_messages_channel, _message];
oni_core_admin_messages_channel radioChannelRemove [player];
