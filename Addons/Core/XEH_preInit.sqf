private _oni_core_settings = [
	[
		"oni_core_debug",
		"CHECKBOX",
		["Enable Debug", "Tick enable ONI debug messages to appear in RPT and systemChat"],
		["ONI Common", "Development"],
		false
	],
	[
		"oni_core_arsenal_objects",
		"EDITBOX",
		["Arsenal Objects", "Classnames, separated by commas and without double quotations, of objects that are spawnable by ""Add Filtered Arsenal"" module"],
		["ONI Zeus", "Modules"],
		"C_supplyCrate_F,B_Slingload_01_Ammo_F"
	],
	[
		"oni_core_respawn_timer",
		"SLIDER",
		["Respawn Timer (seconds)", "Number of seconds player waves need to wait before respawn (0 -> 600 (10 minutes))"],
		["ONI Zeus", "Respawn"],
		[1, 600, 5, 0],
		1,
		{
			setPlayerRespawnTime _this;
		}
	],
	[
		"oni_core_map_volume",
		"SLIDER",
		["Map Volume", "Volume to set when in a vehicle and looking at the map (so that you don't have to listen to loud as fuck helicopter rotors)"],
		"ONI Common",
		[0, 1, 0.20, 2]
	],
	[
		"oni_core_arsenal_whitelist_mission",
		"EDITBOX",
		["Mission", "Mission specific equipment whitelist"],
		["ONI Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
        "oni_core_arsenal_whitelist_standard",
        "EDITBOX",
        ["Standard", "Standard equipment whitelist"],
        ["ONI Arsenal", "Arsenal Whitelists"],
        "[OPTRE_FC_VX19_Helmet,OPTRE_UNSC_VX16_Helmet_Mask_uwu,OPTRE_UNSC_Navy_Uniform_ONI,OPTRE_HUD_w_Glasses,OPTRE_HUD_r_Glasses,OPTRE_HUD_p_Glasses,OPTRE_HUD_Glasses,OPTRE_HUD_g_Glasses,OPTRE_HUD_b_Glasses,OPTRE_EyePiece,OPTRE_NVGT_C,OPTRE_NVG,OPTRE_FC_NVG,OPTRE_NVG_UL,OPTRE_NVG_CNM,OPTRE_NVG_HUL,OPTRE_NVG_HURS,OPTRE_NVG_HURS_HUL,OPTRE_NVG_HURS_CNM,OPTRE_NVG_MVI,OPTRE_NVG_MVI_CNM,OPTRE_NVG_MVI_HUL,OPTRE_NVG_MVI_UL,OPTRE_NVG_MVI_UL_CNM,OPTRE_NVG_MVI_UL_HUL,OPTRE_NVG_UA_CNM,OPTRE_NVG_UA_HURS,OPTRE_NVG_UA_HUL,OPTRE_NVG_UA_HURS_CNM,OPTRE_NVG_UA_HURS_HUL,OPTRE_NVG_UA_UL,OPTRE_NVG_UA_UL_CNM,OPTRE_NVG_UAB_CNM,OPTRE_NVG_UAB_HUL,OPTRE_NVG_UAB_UL,OPTRE_NVG_UAB_UL_CNM,OPTRE_NVG_UAB_UL_HUL,OPTRE_NVG_UL_CNM,OPTRE_NVG_UL_HUL,OPTRE_NVG_UA,OPTRE_NVG_UA_Spartan,OPTRE_NVG_UAB,OPTRE_NVG_UAB_Spartan,OPTRE_Smartfinder,OPTRE_Binoculars,ItemMap,ItemCompass,ACE_Altimeter,ItemGPS,OPTRE_M9_Frag,SmokeShellGreen,SmokeShellBlue,SmokeShellRed,ACE_CTS9,OPTRE_M2_Smoke,UNSCMine_Range_Mag,ACE_adenosine,ACE_elasticBandage,ACE_packingBandage,ACE_bloodIV,ACE_bloodIV_250,ACE_bloodIV_500,OPTRE_Biofoam,ACE_bodyBag,ACE_CableTie,ACE_Canteen,ACE_DefusalKit,ACE_EarPlugs,ACE_EntrenchingTool,ACE_epinephrine,ACE_HuntIR_monitor,ACE_IR_Strobe_Item,ACE_M26_Clacker,ACE_Clacker,ACE_Flashlight_XL50,ACE_MapTools,ACE_morphine,MineDetector,OPTRE_Medigel,ACE_plasmaIV,ACE_plasmaIV_250,ACE_plasmaIV_500,ACE_rope12,ACE_rope15,ACE_rope18,ACE_rope27,ACE_rope3,ACE_rope36,ACE_rope6,ACE_salineIV,ACE_salineIV_250,ACE_salineIV_500,ACE_SpareBarrel_Item,ACE_surgicalKit,ACE_tourniquet,ACE_UAVBattery,ACE_wirecutter,ACE_SpraypaintRed,ACE_SpraypaintGreen,ACE_SpraypaintBlue,ACE_SpraypaintBlack,ACE_SpottingScope,ACE_Tripod,C7_Remote_Mag,C12_Remote_Mag,OPTRE_FC_BubbleShield,TFAR_anprc152,OPTRE_UNSC_M52A_Armor_Pilot_AF,ONI_Recon_Helmet_SF_Carmichael,ONI_Recon_Helmet_SF_Medic,ONI_Recon_Helmet_SF,ONI_Recon_Helmet_SF_Storm,ONI_Recon_Pilot_CPT_Helmet_VBB,ONI_Recon_Pilot_CPT_Helmet_VAB,ONI_Recon_Pilot_LT_Helmet_VA,ONI_Recon_Pilot_LT_Helmet_VBB,ONI_Recon_Flight_Pilot_two,ONI_Recon_Flight_Pilot,ONI_Recon_Pilot_Helmet_VA,ONI_Recon_Uniform_Blk_Slim,ONI_Recon_Uniform_BlkMar_Slim,ONI_Recon_Uniform_BlkUrb_Slim,ONI_Recon_Uniform_BlkWdl_Slim,ONI_Recon_Uniform_Mar_Slim,ONI_Recon_Uniform_MarBlk_Slim,ONI_Recon_Uniform_MarUrb_Slim,ONI_Recon_Uniform_MarWdl_Slim,ONI_Recon_Uniform_Urb_Slim,ONI_Recon_Uniform_UrbBlk_Slim,ONI_Recon_Uniform_UrbMar_Slim,ONI_Recon_Uniform_UrbWdl_Slim,ONI_Recon_Uniform_Wdl_Slim,ONI_Recon_Uniform_WdlBlk_Slim,ONI_Recon_Uniform_WdlMar_Slim,ONI_Recon_Uniform_WdlUrb_Slim,ONI_Recon_Armour_Crew,ONI_Recon_Armour_SF,ONI_Recon_Armour_SF_Carmichael,ONI_Recon_Armour_SF_Demo,ONI_Recon_Armour_SF_Mx,ONI_Recon_Armour_SF_Medic,ONI_Recon_Armour_SF_Scout,ONI_Recon_Armour_SF_Sniper,ONI_Recon_Armour_SF_Storm,ONI_Recon_Rucksack_IC,ONI_Recon_Rucksack_Medic,ONI_Recon_Rucksack,VES_HUD_Balaclava_G_Black,VES_HUD_Balaclava_G_Gray,VES_HUD_Balaclava_G_White,VES_HUD_Visor,VES_HUD_APR_01,VES_HUD_APR_02,VES_HUD_APR_03,TFAR_microdagr,ChemicalDetector_01_watch_F,ItemWatch,ACE_M84,APERSMineDispenser_Mag,SLAMDirectionalMine_Wire_Mag,APERSTripMine_Wire_Mag,ACE_FlareTripMine_Mag,ACE_fieldDressing,TCF_Biofoam,optic_Nightstalker,optic_tws,optic_tws_mg,optic_NVS,optic_dms,optic_LRPS,optic_AMS,optic_AMS_snd,optic_AMS_khk,optic_KHS_blk,optic_KHS_tan,optic_KHS_hex,optic_KHS_old,optic_SOS,optic_MRCO,optic_Arco,optic_Aco,optic_ACO_grn,optic_Aco_smg,optic_ACO_grn_smg,optic_Hamr,optic_Holosight,optic_Holosight_smg,optic_Hamr_khk_F,optic_SOS_khk_F,optic_Arco_ghex_F,optic_Arco_blk_F,optic_DMS_ghex_F,optic_ERCO_blk_F,optic_ERCO_khk_F,optic_ERCO_snd_F,optic_LRPS_ghex_F,optic_LRPS_tna_F,optic_Holosight_blk_F,optic_Holosight_khk_F,optic_Holosight_smg_blk_F,optic_Holosight_smg_khk_F,OPTRE_M392_Scope,OPTRE_BR55HB_Scope,OPTRE_M7_Sight,OPTRE_M393_Scope,OPTRE_M393_ACOG,OPTRE_M393_EOTECH,OPTRE_BR45_Scope,optic_Arco_AK_blk_F,optic_Yorris,optic_ico_01_black_f,optic_MRD_black,ACE_optic_Arco_2D,ACE_optic_Arco_PIP,ACE_optic_LRPS_2D,ACE_optic_LRPS_PIP,ACE_optic_SOS_2D,ACE_optic_SOS_PIP,ACE_optic_MRCO_2D,ACE_optic_Hamr_2D,ACE_optic_Hamr_PIP,OPTRE_SRS99_Scope,OPTRE_SRS99C_Scope,OPTRE_M73_SmartLink,OPTRE_HMG38_CarryHandle,OPTRE_M6C_Scope,OPTRE_M6G_Scope,OPTRE_BMR_Scope,OPTRE_M12_Optic,OPTRE_MA5_BUIS,OPTRE_MA5_SmartLink,OPTRE_MA5C_SmartLink,OPTRE_SRM_Sight,TCF_SENT_CG,TCF_REC_holo,TCF_SENT_CGRed,TCF_SENT_CGGre,TCF_REC_holo_Red,TCF_REC_holo_Gre,TCF_SENT_white_CG,TCF_MA1B_AmmoCounter,TCF_MA1B_AmmoCounter_NoIS,TCF_M6D_Smartlink,TCF_MA5_SmartLink_v2,TCF_MA5C_SmartLink_v2,TCF_MA5_SmartLink_legacy,TCF_MA5C_SmartLink_legacy,TCF_M393_EOTECH_v2,OPTRE_MA37_Smartlink_Scope,MA_BR55HB_Scope,TCF_Pilum_Scope,TCF_M57_QAS2,acc_pointer_IR,acc_flashlight,TCF_M6_Flashlight_IR,TCF_Rifle_Flashlight_IR,TCF_M7_Flashlight_IR,TCF_MA1B_Flashlight,OPTRE_BMR_Laser,OPTRE_BMR_Flashlight,OPTRE_M7_Laser,OPTRE_M7_Flashlight,OPTRE_M12_Laser,OPTRE_M6G_Flashlight,OPTRE_M6C_Laser,OPTRE_M45_Flashlight,OPTRE_M45_Flashlight_red,OPTRE_M45_Flashlight_green,OPTRE_M45_Flashlight_blue,OPTRE_DMR_Light,ACE_acc_pointer_green,acc_flashlight_pistol,muzzle_snds_H_MG_blk_F,muzzle_snds_L,OPTRE_MA5Suppressor,OPTRE_M7_silencer,OPTRE_M6_silencer,OPTRE_M393_Suppressor,OPTRE_M12_Suppressor,OPTRE_MA37KSuppressor,OPTRE_M6C_compensator,OPTRE_SRS99D_Suppressor,ACE_muzzle_mzls_B,muzzle_snds_65_TI_blk_F,bipod_01_F_snd,bipod_01_F_blk,bipod_01_F_mtp,bipod_01_F_khk,bipod_02_F_blk,bipod_02_F_tan,bipod_02_F_hex,bipod_02_F_lush,bipod_02_F_arid,bipod_03_F_blk,bipod_03_F_oli,OPTRE_BR45Grip,Commando_20Rnd_65_Mag,Commando_20Rnd_65_TracerY_Mag,Command_20Rnd_65_TracerR_Mag,Commando_20Rnd_65_ReloadY_Mag,Commando_20Rnd_65_ReloadR_Mag,TCF_20Rnd_65x48_Mag_Tracer,TCF_20Rnd_65x48_Mag_AP,TCF_20Rnd_65x48_Mag_APT,TCF_20Rnd_65x48_Mag_JHP,TCF_20Rnd_65x48_Mag_JHPT,TCF_20Rnd_65x48_Mag_SS,TCF_20Rnd_65x48_Mag_SLAP,TCF_20Rnd_65x48_Mag_SLAPT,OPTRE_100Rnd_762x51_Box,OPTRE_100Rnd_762x51_Box_Tracer,OPTRE_100Rnd_762x51_Box_Tracer_Yellow,OPTRE_400Rnd_762x51_Box_Tracer,TCF_100Rnd_762x51_Box_AP,TCF_100Rnd_762x51_Box_APT,TCF_200Rnd_762x51_Box_AP,TCF_200Rnd_762x51_Box_APT,TCF_300Rnd_762x51_Box_AP,TCF_300Rnd_762x51_Box_APT,TCF_400Rnd_762x51_Box_AP,TCF_400Rnd_762x51_Box_APT,OPTRE_15Rnd_762x51_Mag,OPTRE_15Rnd_762x51_Mag_Tracer,OPTRE_15Rnd_762x51_Mag_Tracer_Yellow,TCF_15Rnd_762x51_Mag_AP,TCF_15Rnd_762x51_Mag_APT,TCF_15Rnd_762x51_Mag_JHP,TCF_15Rnd_762x51_Mag_JHPT,TCF_15Rnd_762x51_Mag_SS,TCF_15Rnd_762x51_Mag_SLAP,TCF_15Rnd_762x51_Mag_SLAPT,TCF_32Rnd_762x51_Mag_AP,TCF_32Rnd_762x51_Mag_APT,TCF_32Rnd_762x51_Mag_JHP,TCF_32Rnd_762x51_Mag_JHPT,TCF_32Rnd_762x51_Mag_SS,TCF_32Rnd_762x51_Mag_SST,OPTRE_25Rnd_762x51_Mag,OPTRE_25Rnd_762x51_Mag_Tracer,OPTRE_25Rnd_762x51_Mag_Tracer_Yellow,TCF_UGL_8Gauge_Pellet,TCF_UGL_8Gauge_Slug,TCF_UGL_8Gauge_Beanbag,TCF_UGL_FlareBlue_F,TCF_3Rnd_UGL_8Gauge_Pellet,TCF_3Rnd_UGL_8Gauge_Slug,TCF_3Rnd_UGL_8Gauge_Beanbag,TCF_3Rnd_UGL_FlareBlue_F,1Rnd_HE_Grenade_shell,UGL_FlareWhite_F,UGL_FlareGreen_F,UGL_FlareRed_F,UGL_FlareYellow_F,UGL_FlareCIR_F,1Rnd_Smoke_Grenade_shell,1Rnd_SmokeRed_Grenade_shell,1Rnd_SmokeGreen_Grenade_shell,1Rnd_SmokeYellow_Grenade_shell,1Rnd_SmokePurple_Grenade_shell,1Rnd_SmokeBlue_Grenade_shell,1Rnd_SmokeOrange_Grenade_shell,3Rnd_HE_Grenade_shell,3Rnd_UGL_FlareWhite_F,3Rnd_UGL_FlareGreen_F,3Rnd_UGL_FlareRed_F,3Rnd_UGL_FlareYellow_F,3Rnd_UGL_FlareCIR_F,3Rnd_Smoke_Grenade_shell,3Rnd_SmokeRed_Grenade_shell,3Rnd_SmokeGreen_Grenade_shell,3Rnd_SmokeYellow_Grenade_shell,3Rnd_SmokePurple_Grenade_shell,3Rnd_SmokeBlue_Grenade_shell,3Rnd_SmokeOrange_Grenade_shell,TCF_signalsmokePnk,TCF_signalsmokeYlw,TCF_signalsmokeRed,TCF_signalsmokeGrn,OPTRE_1Rnd_Smoke_Grenade_shell,OPTRE_1Rnd_SmokeRed_Grenade_shell,OPTRE_1Rnd_SmokeGreen_Grenade_shell,OPTRE_1Rnd_SmokeYellow_Grenade_shell,OPTRE_1Rnd_SmokePurple_Grenade_shell,OPTRE_1Rnd_SmokeBlue_Grenade_shell,OPTRE_1Rnd_SmokeOrange_Grenade_shell,OPTRE_signalSmokeR,OPTRE_signalSmokeO,OPTRE_signalSmokeY,OPTRE_signalSmokeG,OPTRE_signalSmokeB,OPTRE_signalSmokeP,ACE_40mm_Flare_white,ACE_40mm_Flare_red,ACE_40mm_Flare_green,ACE_40mm_Flare_ir,ACE_HuntIR_M203,OPAEX_M_D20_GL,OPTRE_3Rnd_Smoke_Grenade_shell,OPTRE_3Rnd_SmokeRed_Grenade_shell,OPTRE_3Rnd_SmokeGreen_Grenade_shell,OPTRE_3Rnd_SmokeYellow_Grenade_shell,OPTRE_3Rnd_SmokePurple_Grenade_shell,OPTRE_3Rnd_SmokeBlue_Grenade_shell,OPTRE_3Rnd_SmokeOrange_Grenade_shell,TCF_15Rnd_762x51_Mag_SST,OPTRE_6Rnd_8Gauge_Pellets,TCF_6Rnd_8Gauge_Beanbag,TCF_6Rnd_8Gauge_Incendiary,TCF_6Rnd_8Gauge_FR,OPTRE_6Rnd_8Gauge_Slugs,OPTRE_6Rnd_8Gauge_HEDP,OPTRE_12Rnd_8Gauge_Pellets,OPTRE_12Rnd_8Gauge_Slugs,OPTRE_12Rnd_8Gauge_HEDP,TCF_12Rnd_8Gauge_HEDP,TCF_12Rnd_8Gauge_Beanbag,TCF_12Rnd_8Gauge_Incendiary,TCF_12Rnd_8Gauge_FR,OPTRE_42Rnd_95x40_Mag,OPTRE_42Rnd_95x40_Mag_Tracer,OPTRE_42Rnd_95x40_Mag_Tracer_Yellow,TCF_42Rnd_95x40_Mag_JHP,TCF_42Rnd_95x40_Mag_JHPT,TCF_42Rnd_95x40_Mag_SS,TCF_42Rnd_95x40_Mag_SST,OPTRE_60Rnd_5x23mm_Mag,OPTRE_60Rnd_5x23mm_Mag_tracer,OPTRE_60Rnd_5x23mm_Mag_tracer_yellow,OPTRE_48Rnd_5x23mm_Mag,OPTRE_48Rnd_5x23mm_Mag_tracer,OPTRE_48Rnd_5x23mm_Mag_tracer_yellow,OPTRE_48Rnd_5x23mm_JHP_Mag,OPTRE_48Rnd_5x23mm_FMJ_Mag,TCF_60Rnd_5x23mm_Mag_HV,TCF_60Rnd_5x23mm_Mag_HVT,TCF_60Rnd_5x23mm_Mag_JHP,TCF_60Rnd_5x23mm_Mag_JHPT,TCF_60Rnd_5x23mm_Mag_SS,TCF_60Rnd_5x23mm_Mag_SST,TCF_48Rnd_5x23mm_Mag_HV,TCF_48Rnd_5x23mm_Mag_HVT,TCF_48Rnd_5x23mm_Mag_JHP,TCF_48Rnd_5x23mm_Mag_JHPT,TCF_48Rnd_5x23mm_Mag_SS,TCF_48Rnd_5x23mm_Mag_SST,OPTRE_100Rnd_95x40_Box,OPTRE_100Rnd_95x40_Box_Tracer,OPTRE_100Rnd_95x40_Box_Tracer_Yellow,TCF_100Rnd_95x40_Box_JHP,TCF_100Rnd_95x40_Box_JHPT,TCF_100Rnd_95x40_Box_SS,TCF_100Rnd_95x40_Box_SST,OPTRE_200Rnd_95x40_Box,OPTRE_200Rnd_95x40_Box_Tracer,OPTRE_200Rnd_95x40_Box_Tracer_Yellow,TCF_200Rnd_95x40_Box_JHP,TCF_200Rnd_95x40_Box_JHPT,TCF_200Rnd_95x40_Box_SS,TCF_200Rnd_95x40_Box_SST,OPTRE_7Rnd_20mm_APFSDS_Mag,OPTRE_7Rnd_20mm_HEDP_Mag,OPTRE_60Rnd_762x51_Mag,OPTRE_32Rnd_762x51_Mag,OPTRE_32Rnd_762x51_Mag_Tracer,OPTRE_32Rnd_762x51_Mag_Tracer_Yellow,TCF_60Rnd_762x51_Mag_AP,TCF_60Rnd_762x51_Mag_APT,TCF_60Rnd_762x51_Mag_JHP,TCF_60Rnd_762x51_Mag_JHPT,OPTRE_60Rnd_762x51_Mag_Tracer,OPTRE_60Rnd_762x51_Mag_Tracer_Yellow,OPTRE_32Rnd_762x51_Mag_UW,OPTRE_10Rnd_127x99,OPTRE_5Rnd_127x99,OPTRE_4Rnd_145x114_APFSDS_Mag,OPTRE_4Rnd_145x114_HVAP_Mag,OPTRE_4Rnd_145x114_HEDP_Mag,TCF_4Rnd_145x114_Mag_APFSDST,TCF_4Rnd_145x114_Mag_HEDPT,TCF_4Rnd_145x114_Mag_HVAPT,TCF_4Rnd_145x114_Mag_SS,TCF_4Rnd_145x114_Mag_SST,TCF_4Rnd_145x114_Mag_NARQ,TCF_4Rnd_145x114_Mag_NARQT,OPTRE_4Rnd_145x114_APFSDS_Mag_D,OPTRE_4Rnd_145x114_HVAP_Mag_D,OPTRE_4Rnd_145x114_HEDP_Mag_D,MA_36Rnd_95x40_HPSAP_Mag,MA_36Rnd_95x40_HPSAP_Mag_Tracer,MA_36Rnd_95x40_Subsonic_Mag,MA_36Rnd_95x40_Subsonic_Mag_Tracer,GRL45_6rnd_HE,GRL45_6rnd_HEDP,GRL45_6rnd_Whistle,GRL45_6rnd_Smoke_White,GRL45_6rnd_Impact_White,GRL45_6rnd_Smoke_Red,GRL45_6rnd_Smoke_Green,GRL45_6rnd_Smoke_Yellow,GRL45_6rnd_Smoke_Purple,GRL45_6rnd_Smoke_Blue,GRL45_6rnd_Smoke_Orange,GRL45_6rnd_Impact_Red,GRL45_6rnd_Impact_Green,GRL45_6rnd_Impact_Yellow,GRL45_6rnd_Impact_Purple,GRL45_6rnd_Impact_Blue,GRL45_6rnd_Impact_Orange,GRL45_6rnd_Flare_White,GRL45_6rnd_Flare_Green,GRL45_6rnd_Flare_Red,GRL45_6rnd_Flare_Yellow,GRL45_6rnd_Flare_CIR,GRL45_6rnd_Flare_Blue,6Rnd_12Gauge_Pellets,6Rnd_12Gauge_Slug,ACE_6Rnd_12Gauge_Pellets_No0_Buck,ACE_6Rnd_12Gauge_Pellets_No1_Buck,ACE_6Rnd_12Gauge_Pellets_No2_Buck,ACE_6Rnd_12Gauge_Pellets_No3_Buck,ACE_6Rnd_12Gauge_Pellets_No4_Buck,ACE_6Rnd_12Gauge_Pellets_No4_Bird,OPAEX_M_D20_3GL,OPTRE_10RND_338_SP,OPTRE_10RND_338_VLD,OPTRE_10RND_338_AP,OPTRE_36Rnd_95x40_Mag,TCF_36Rnd_95x40_Mag_JHP,TCF_36Rnd_95x40_Mag_JHPT,TCF_36Rnd_95x40_Mag_SS,TCF_36Rnd_95x40_Mag_SST,OPTRE_36Rnd_95x40_Mag_Tracer,OPTRE_36Rnd_95x40_Mag_Tracer_Yellow,OPTRE_200Rnd_127x99_M247H_Etilka_Ball,OPTRE_200Rnd_127x99_M247H_Etilka,OPTRE_40Rnd_30x06_Mag,OPTRE_40Rnd_30x06_Mag_Tracer,TCF_30Rnd_30x06_Mag_Ball,TCF_30Rnd_30x06_Mag_Tracer,TCF_30Rnd_30x06_Mag_AP,TCF_30Rnd_30x06_Mag_AP_Tracer,TCF_30Rnd_30x06_Mag_JHP,TCF_30Rnd_30x06_Mag_JHP_Tracer,OPTRE_M41_Twin_HEAT,OPTRE_M41_Twin_HEAP,OPTRE_M41_Twin_HEAT_G,OPTRE_M41_Twin_HE,OPTRE_M41_Twin_HEAT_SALH,OPTRE_M41_Twin_HEAT_SACLOS,OPTRE_M41_Twin_HEAT_Thermal,OPTRE_M41_Twin_HE_SALH_ProximityFuse,OPTRE_M41_Twin_HE_SACLOS_ProximityFuse,OPTRE_M41_Twin_HE_Thermal_ProximityFuse,OPTRE_M41_Twin_Smoke_W,OPTRE_M41_Twin_Smoke_B,OPTRE_M41_Twin_Smoke_R,OPTRE_M41_Twin_Smoke_G,OPTRE_M41_Twin_Smoke_O,OPTRE_M41_Twin_Smoke_P,OPTRE_M41_Twin_Smoke_Y,TCF_M96_HEAT,TCF_2Rnd_50x137_HEAT,TCF_2Rnd_50x137_HE,TCF_2Rnd_50x137_PEN,TCF_2Rnd_50x137_THERMO,TCF_2Rnd_50x137_SACLOS,TCF_2Rnd_50x137_GUIDED,TCF_2Rnd_50x137_SALH,TCF_2Rnd_50x137_AA,OPTRE_8Rnd_127x40_Mag,OPTRE_8Rnd_127x40_Mag_Tracer,OPTRE_8Rnd_127x40_AP_Mag,TCF_8Rnd_127x40_Mag_FR,TCF_8Rnd_127x40_Mag_FG,TCF_12Rnd_127x40_Mag_AP,TCF_12Rnd_127x40_Mag_APT,TCF_12Rnd_127x40_Mag_JHP,TCF_12Rnd_127x40_Mag_JHPT,TCF_12Rnd_127x40_Mag_SAPHE,TCF_12Rnd_127x40_Mag_SAPHET,TCF_12Rnd_127x40_Mag_SS,TCF_12Rnd_127x40_Mag_SST,TCF_12Rnd_127x40_Mag_NARQ,TCF_12Rnd_127x40_Mag_NARQT,OPTRE_12Rnd_127x40_Mag,OPTRE_12Rnd_127x40_Mag_Tracer,OPTRE_16Rnd_127x40_Mag,OPTRE_16Rnd_127x40_Mag_Tracer,16Rnd_10mm_Ball,8Rnd_10mm_EXP,16Rnd_10mm_AP,32Rnd_10mm_Ball,4Rnd_454Casull,M168_Remote_Mag,ACE_Fortify,ToolKit,ONI_Weapon_ARM37,ONI_Weapon_ARM37_GL,ONI_Weapon_ARM37_SHT,ONI_Weapon_ARMX,ONI_Weapon_ARMX_GL,ONI_Weapon_ARMX_GL_light,ONI_Weapon_ARMX_light,ONI_Weapon_BR37,ONI_Weapon_BR45,ONI_Weapon_BR55,ONI_Weapon_BR55_HB,ONI_Weapon_BR55HB,ONI_Weapon_Commando,ONI_Weapon_Commando_Black,ONI_Weapon_Commando_Snow,ONI_Weapon_Commando_Tan,ONI_Weapon_GRL_45,ONI_Weapon_HMG38,ONI_Weapon_M247,ONI_Weapon_M247H_Etilka,ONI_Weapon_M295_BMR,ONI_Weapon_M295_BMR_Desert,ONI_Weapon_M295_BMR_Snow,ONI_Weapon_M295_BMR_Woodland,ONI_Weapon_M319n,ONI_Weapon_M319,ONI_Weapon_M392_DMR,ONI_Weapon_M393_DMR,ONI_Weapon_M393S_DMR,ONI_Weapon_M45,ONI_Weapon_M45A,ONI_Weapon_M45ATAC,ONI_Weapon_M45E,ONI_Weapon_M45TAC,ONI_Weapon_M58S,ONI_Weapon_M7,ONI_Weapon_M73,ONI_Weapon_M90A,ONI_Weapon_M99A2S3,ONI_Weapon_MA32,ONI_Weapon_MA32B,ONI_Weapon_MA32BGL,ONI_Weapon_MA32GL,ONI_Weapon_MA37,ONI_Weapon_MA37B,ONI_Weapon_MA37BGL,ONI_Weapon_MA37GL,ONI_Weapon_MA37K,ONI_Weapon_MA5A,ONI_Weapon_MA5AGL,ONI_Weapon_MA5B,ONI_Weapon_MA5BGL,ONI_Weapon_MA5C,ONI_Weapon_MA5CGL,ONI_Weapon_MA5K,ONI_Weapon_SRM77_S1,ONI_Weapon_SRM77_S2,ONI_Weapon_SRS99C,ONI_Weapon_SRS99D,ONI_Weapon_M57_Pilum,ONI_Weapon_M41_SSR,ONI_Weapon_M57_Pilum_b,ONI_Weapon_M96_LAW,ONI_Weapon_M96_LAW_Blk,ONI_Weapon_M96_LAW_Arc,ONI_Weapon_M96_LAW_Des,ONI_Weapon_hgun_comet_F,ONI_Weapon_hgun_sas10_F,ONI_Weapon_m3,ONI_Weapon_M319M,ONI_Weapon_M319S,ONI_Weapon_M6B,ONI_Weapon_M6C,ONI_Weapon_M7_Folded,ONI_Weapon_UNSC_Knife,ONI_Weapon_UNSC_Knife_reversed,ONI_Weapon_M6G,optic_Arco_AK_arid_F,optic_Arco_AK_lush_F,optic_Arco_arid_F,optic_Arco_lush_F,optic_Holosight_arid_F,optic_Holosight_lush_F,optic_DMS_weathered_F,optic_DMS_weathered_Kir_F,muzzle_snds_M,muzzle_snds_m_khk_F,muzzle_snds_m_snd_F,ACE_muzzle_mzls_L,OPTRE_FC_T25_Rifle_Battery,OPTRE_FC_T25J_Rifle_Battery,OPTRE_FC_T50_6rnd_mag,OPTRE_FC_T50_SRS_Battery,OPTRE_FC_T51_Ammo_Cartridge,OPTRE_FC_T51_Repeater_Battery,OPTRE_FC_T51J_Repeater_Battery]",
        1,
        {
            // One day this will re-init all arsenals that have this filter set
        },
        true
    ]
];
{_x call CBA_Settings_fnc_init;} forEach _oni_core_settings;
CHVD_allowNoGrass = false;
