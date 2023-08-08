// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX x
#define PREFIX VS_ONI_C

#define AUTHOR QUOTE(Viking Studios)
#define MOD_NAME_BEAUTIFIED QUOTE(ONI Recon - Core)

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.06
#define REQUIRED_CBA_VERSION {3,15,6}
#define REQUIRED_ACE_VERSION {3,14,0,63}
#define REQUIRED_TFAR_VERSION {1,-1,0,328}

#define RELEASE_BUILD

#ifndef RELEASE_BUILD

#endif

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(ONI Recon - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(ONI Recon - COMPONENT)
#endif
