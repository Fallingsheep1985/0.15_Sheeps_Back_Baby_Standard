/*
	File Name: FMission_Launcher3.sqf
	File Created: 12/25/2013
	File Version: 1.1
	File Author: Foamy 
	File Last Edit Date: 3/23/2014
	File Description: Foamy Missions Launcher 3

Variables to set:
_missionSpawnChance = xx; <--- is the % chance it will spawn (example: .50 = 50%)

*/

private ["_spawnRoll", "_missionSpawnChance", "_scriptselected", "_scriptslist"];

_missionSpawnChance =  1;
_spawnRoll = random 1;

diag_log("FMission Launcher 3: Checking Spawn Chance");
if (_spawnRoll > _missionSpawnChance) exitWith 
{
diag_log format ["FMission Launcher 3: Spawn Chance Failed with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
};

diag_log format ["FMission Launcher 3: Spawn Chance Succeeded with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
sleep .5;
diag_log("FMission Launcher 3: Selecting script and launching");

_scriptslist = 
		[
		"\z\addons\dayz_server\addons\Fmission\Missions\M3\FMission_M3_DeathWish.sqf",
		"\z\addons\dayz_server\addons\Fmission\Missions\M3\FMission_M3_WellsFargo.sqf"
		];
_scriptselected = _scriptslist select (floor(random(count _scriptslist)));
diag_log format ["FMission Launcher 3: Launching Mission: %1",_scriptselected];
[] execVM _scriptselected;
