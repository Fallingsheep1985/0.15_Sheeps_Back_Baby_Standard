/*
	File Name: FMission_Launcher2.sqf
	File Created: 12/25/2013
	File Version: 1.1
	File Author: Foamy 
	File Last Edit Date: 3/23/2014
	File Description: Foamy Missions Launcher 2

Variables to set:
_missionSpawnChance = xx; <--- is the % chance it will spawn (example: .50 = 50%)

*/

private ["_spawnRoll", "_missionSpawnChance", "_scriptselected", "_scriptslist"];

_missionSpawnChance =  1;
_spawnRoll = random 1;

diag_log("FMission Launcher 2: Checking Spawn Chance");
if (_spawnRoll > _missionSpawnChance) exitWith 
{
diag_log format ["FMission Launcher 2: Spawn Chance Failed with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
};

diag_log format ["FMission Launcher 2: Spawn Chance Succeeded with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
sleep .5;
diag_log("FMission Launcher 2: Selecting script and launching");

_scriptslist = 
		[
		"\z\addons\dayz_server\addons\Fmission\Missions\M2\Foamy\mission_name.sqf",
		"\z\addons\dayz_server\addons\Fmission\Missions\M2\Foamy\mission_name.sqf",
		"\z\addons\dayz_server\addons\Fmission\Missions\M2\Foamy\mission_name.sqf",
		"\z\addons\dayz_server\addons\Fmission\Missions\M2\Foamy\mission_name.sqf"
		];
_scriptselected = _scriptslist select (floor(random(count _scriptslist)));
diag_log format ["FMission Launcher 2: Launching Mission: %1",_scriptselected];
[] execVM _scriptselected;
