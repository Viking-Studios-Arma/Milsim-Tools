#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[QGVAR(populateAO), {_this call FUNC(populateAO)}] call CBA_fnc_addEventHandler;

ADDON = true;
