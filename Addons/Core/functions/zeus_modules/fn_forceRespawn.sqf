/* ----------------------------------------------------------------------------
Function: oni_core_fnc_forceRespawn

Description:
	Forces all the dead people to respawn immediately.
	After that the respawn is once again set to default timer value.

Parameters:
	Nothing

Returns:
	Nothing

Examples:
	[] call oni_core_fnc_forceRespawn;

Author:
	Ford
	Arend
---------------------------------------------------------------------------- */
{
	setPlayerRespawnTime 0;
	sleep 2;
	setPlayerRespawnTime oni_core_respawn_timer;
} remoteExec ["BIS_fnc_call", 0];
