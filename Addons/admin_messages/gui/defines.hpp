#define ONI_CORE_ADMIN_MESSAGES_IDC_SENDBUTTON		33500
#define ONI_CORE_ADMIN_MESSAGES_IDC_CUSTOMCHATTEXT	33601

#define ONI_CORE_ADMIN_MESSAGES_UISIZESMALL		0.55
#define ONI_CORE_ADMIN_MESSAGES_UISCALE			((getResolution select 5)/ONI_CORE_ADMIN_MESSAGES_UISIZESMALL)

#define ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y		((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
#define ONI_CORE_ADMIN_MESSAGES_SCALESUMMAND_Y	(safezoneY)

#define ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_X		(((safezoneW / safezoneH) min 1.2) / 40)
#define ONI_CORE_ADMIN_MESSAGES_SCALESUMMAND_X	(safezoneX)

#define ONI_CORE_ADMIN_MESSAGES_SPACER_Y			(0.1 * ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y)

#define ONI_CORE_ADMIN_MESSAGES_TITLE_Y			(1 * ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y + ONI_CORE_ADMIN_MESSAGES_SCALESUMMAND_Y)
#define ONI_CORE_ADMIN_MESSAGES_TITLE_X			(1 * ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_X + ONI_CORE_ADMIN_MESSAGES_SCALESUMMAND_X)

#define ONI_CORE_ADMIN_MESSAGES_ELEMENT_H			(1 * ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y)
#define ONI_CORE_ADMIN_MESSAGES_TOTAL_W			(15 * ONI_CORE_ADMIN_MESSAGES_SCALEFACTOR_X)

#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y		(ONI_CORE_ADMIN_MESSAGES_TITLE_Y + ONI_CORE_ADMIN_MESSAGES_ELEMENT_H + ONI_CORE_ADMIN_MESSAGES_SPACER_Y)
#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_H		((8 * ONI_CORE_ADMIN_MESSAGES_ELEMENT_H) / ONI_CORE_ADMIN_MESSAGES_UISCALE)

#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y	((0.5 * ONI_CORE_ADMIN_MESSAGES_ELEMENT_H) / ONI_CORE_ADMIN_MESSAGES_UISCALE)
#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_H			(ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_H - 2 * ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y)
#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_Y			(ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y)

#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X	(0.5 * (((safezoneW / safezoneH) min 1.2) / 40))
#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_X			(ONI_CORE_ADMIN_MESSAGES_TITLE_X + ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X)
#define ONI_CORE_ADMIN_MESSAGES_EDITBOX_W			(ONI_CORE_ADMIN_MESSAGES_TOTAL_W - 2 * ONI_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X)

#define ONI_CORE_ADMIN_MESSAGES_SENDBUTTON_Y		(ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_H + ONI_CORE_ADMIN_MESSAGES_SPACER_Y)
#define ONI_CORE_ADMIN_MESSAGES_SENDBUTTON_Y_2	(ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + ONI_CORE_ADMIN_MESSAGES_EDITBOX_BG_H + 2*ONI_CORE_ADMIN_MESSAGES_SPACER_Y + ONI_CORE_ADMIN_MESSAGES_ELEMENT_H)
