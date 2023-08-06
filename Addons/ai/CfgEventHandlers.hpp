class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_Local_EventHandlers {
    class CAManBase {
        class ADDON {
            local = QUOTE(call FUNC(localityChangedEH));
        };
    };
};
