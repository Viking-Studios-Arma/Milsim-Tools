class oni_core_PopulateAO_Factions {
    class Default {
        scope = 0;
        displayName = "";
        side = -1;
        requiredAddons[] = {};

        groupPath[] = {};

        Inf_Groups[] = {};
        Inf_AA_Groups[] = {};
        Inf_AT_Groups[] = {};
        Sniper_Groups[] = {};

        Veh_Light_List[] = {};
        Veh_Heavy_List[] = {};

        Air_List[] = {};
    };

    class civilian_internal: Default {
        scope = 1;
        displayName = "[ONI] Civilian";
        side = 3;
        requiredAddons[] = {"OPTRE_Vehicles_genet", "OPTRE_Vehicles_Warthog" };

        groupPath[] = {"Empty", "oni_core_civ_v1", "single_units"};

        Inf_Groups[] = {
            "C_man_p_beggar_F",
            "C_man_1",
            "C_Man_casual_1_F",
            "C_Man_casual_2_F",
            "C_Man_casual_3_F",
            "C_Man_casual_4_v2_F",
            "C_Man_casual_5_v2_F",
            "C_Man_casual_6_v2_F",
            "C_Man_casual_7_F",
            "C_Man_casual_8_F",
            "C_Man_casual_9_F",
            "C_Man_formal_1_F",
            "C_Man_formal_2_F",
            "C_Man_formal_3_F",
            "C_Man_formal_4_F",
            "C_Man_smart_casual_1_F",
            "C_Man_smart_casual_2_F",
            "C_man_sport_1_F",
            "C_man_sport_2_F",
            "C_man_sport_3_F",
            "C_Man_casual_4_F",
            "C_Man_casual_5_F",
            "C_Man_casual_6_F",
            "C_man_polo_1_F",
            "C_man_polo_2_F",
            "C_man_polo_3_F",
            "C_man_polo_4_F",
            "C_man_polo_5_F",
            "C_man_polo_6_F",
            "C_man_shorts_1_F",
            "C_man_1_1_F",
            "C_man_1_2_F",
            "C_man_1_3_F",
            "C_man_p_fugitive_F",
            "C_man_p_shorts_1_F",
            "C_man_hunter_1_F",
            "C_man_shorts_2_F",
            "C_man_shorts_3_F",
            "C_man_shorts_4_F",
            "C_man_w_worker_F",
            "C_scientist_01_informal_F",
            "C_scientist_02_informal_F",
        };
        Inf_AA_Groups[] = {};
        Inf_AT_Groups[] = {};
        Sniper_Groups[] = {};

        Veh_Light_List[] = {
            "C_Van_01_fuel_F",
            "C_Hatchback_01_F",
            "C_Hatchback_01_sport_F",
            "C_Offroad_02_unarmed_F",
            "C_Truck_02_fuel_F",
            "C_Truck_02_box_F",
            "C_Truck_02_transport_F",
            "C_Truck_02_covered_F",
            "C_Offroad_01_F",
            "C_Offroad_01_covered_F",
            "C_Offroad_01_repair_F",
            "C_Quadbike_01_F",
            "C_SUV_01_F",
            "C_Tractor_01_F",
            "C_Van_01_transport_F",
            "C_Van_01_box_F",
            "C_Van_02_transport_F",
            "OPTRE_M12_CIV",
            "OPTRE_Genet",
            "OPTRE_M12_CIV2"
        };
        Veh_Heavy_List[] = {};

        Air_List[] = {};
    };
};
