/*
	File Name: FMission_M1_Hostage_Rescue.sqf
	File Created: 12/29/2013
	File Version: 1.4
	File Author: Foamy 
	File Last Edit Date: 3/26/2014
	File Description: Hostage Rescue Mission (M1)
*/

// CHECK FOR ANOTHER MISSION1 RUNNING START ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if (isNil "EPOCH_MISSION1_RUNNING") then 
	{
	EPOCH_MISSION1_RUNNING = false;
	};

	if (EPOCH_MISSION1_RUNNING) exitWith 
	{
	diag_log("Mission1 already running");
	};

// CHECK FOR ANOTHER MISSION1 RUNNING END ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


private ["_missionSpawnChance","_spawnMarker","_spawnRadius","_markerRadius","_item","_debug","_wait_time","_spawnRoll","_position","_event_marker","_loot_pos","_timeout","_hostagegroup","_hostage1","_hostage2","_attackgroup","_attacker1","_attacker2","_attacker3","_attacker4","_hostageunitsAlive","_attackerunitsAlive","_hostagecamp","_markerColor"];


diag_log("MISSION 1: Hostage Rescue - Script Started");

_missionSpawnChance =  .40;
_spawnRoll = random 1;

diag_log("MISSION 1: Hostage Rescue - Checking MissionSpawnChance");
if (_spawnRoll > _missionSpawnChance) exitWith 
{
diag_log format ["MISSION 1: Hostage Rescue - Failed with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
};

sleep .5;
diag_log("MISSION 1: Hostage Rescue - MissionSpawnChance Success");

sleep .5;
diag_log("MISSION 1: Hostage Rescue - Mission Script Started");

EPOCH_MISSION1_RUNNING = true;


_loot_box = "GuerillaCacheBox";
_loot_lists = 
[
	[
	["ItemMachete","ItemFlashlight"],
	["Skin_Rocker1_DZ","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemCanvas","ItemCanvas","ItemCanvas"]
	],
	
	[
	["ItemCrowbar"],
	["ItemAntibiotic","SmokeShell","SmokeShell","ItemGoldBar10oz","ItemGoldBar10oz","Skin_Rocket_DZ"]
	],
	
	[
	["Binocular_Vector"],
	["ItemSeaBassCooked","ItemSeaBassCooked","ItemSandbag","ItemGoldBar","ItemGoldBar","Skin_Drake_Light_DZ","ItemHeatPack"]
	],
	
	[
	["Binocular"],
	["ItemLightBulb","ItemBriefcase100oz"]
	],
	
	[
	["ItemRadio"],
	["ItemCanvas","ItemTent","ItemCanvas","ItemSilverBar","ItemCopperBar","Skin_Rocker3_DZ","ItemCopperBar"]
	],
	
	[
	["NVGoggles"],
	["ItemBloodbag","ItemHeatPack","ItemPainkiller","ItemCopperBar","ItemCopperBar","Skin_Rocker1_DZ"]
	],
	
	[
	["ItemEtool"],
	["SmokeShellRed","SmokeShellGreen","ItemCopperBar","ItemCanvas","ItemTentDomed","ItemBurlap"]
	]
];

_loot = _loot_lists call BIS_fnc_selectRandom;

 
mission_despawn_timer = 1200;
_wait_time = 900; 
_spawnRadius = 5000;
_spawnMarker = 'center';
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_markerColor = "ColorGreen";
_textMarker_IconType = "mil_objective";
_markerText = "Mission: Hostage Rescue";
_markerBrush = "SOLID";

// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,20,0] call BIS_fnc_findSafePos;
_loot_pos = [_position,0,(_markerRadius - 100),10,0,20,0] call BIS_fnc_findSafePos;

// FMarker Launch
[_position,_loot_pos,_markerRadius,_markerColor,false,_textMarker_IconType,_markerText,_markerBrush] execVM "\z\addons\dayz_server\addons\FMission\FMarker\FMarker1.sqf";

diag_log(format["MISSION 1: Hostage Rescue - Loot event setup, waiting for %1 seconds", _wait_time]);

// Spawn Hostage Camp
diag_log("MISSION 1: Hostage Rescue - Creating Hostage Camp");
	_hostagecamp = createVehicle ["CampEast_EP1",_loot_pos,[], 0, "CAN_COLLIDE"];


// Spawn Hostages
diag_log("MISSION 1: Hostage Rescue - Spawning Hostages");
	_hostagegroup = createGroup civilian;
		_hostage1 = _hostagegroup createUnit ["TK_CIV_Woman03_EP1", _hostagecamp, [], 0, "Form"];
			_hostage1 setUnitPos "Middle";
			removeAllItems _hostage1;
						
		_hostage2 = _hostagegroup createUnit ["TK_CIV_Woman01_EP1", _hostagecamp, [], 0, "Form"];
			_hostage2 setUnitPos "Middle";
			removeAllItems _hostage2;
						
// Spawn Attackers

diag_log("MISSION 1: Hostage Rescue - Spawning Attackers");
	_attackgroup = createGroup east;
	
		_attacker1 = _attackgroup createUnit ["TK_INS_Soldier_3_EP1", _hostagecamp, [], 0, "Form"];
			_attacker1 setUnitPos "AUTO";
			_null = [_attacker1] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
			
		_attacker2 = _attackgroup createUnit ["TK_Soldier_Medic_EP1", _hostagecamp, [], 0, "Form"];
			_attacker2 setUnitPos "AUTO";
			_null = [_attacker2] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Medic.sqf";
			
		_attacker3 = _attackgroup createUnit ["TK_INS_Soldier_EP1", _hostagecamp, [], 0, "Form"];
			_attacker3 setUnitPos "AUTO";
			_null = [_attacker3] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
			
		_attacker4 = _attackgroup createUnit ["TK_INS_Soldier_EP1", _hostagecamp, [], 0, "Form"];
			_attacker4 setUnitPos "AUTO";
			_null = [_attacker4] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Sniper.sqf";
			
			_attackgroup setCombatMode "RED";
			_attackgroup setBehaviour "COMBAT";

[_attackgroup, _loot_box] call BIS_fnc_taskDefend;

diag_log("MISSION 1: Hostage Rescue - Loading -=FAI Units=- Started");

_aiunit_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;

_aiunit1 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit2 = [_aiunit_spawn_pos,50,4,"Sniper",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit3 = [_aiunit_spawn_pos,50,4,"Medic",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit4 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit5 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

[nil,nil,rTitleText,"A camp holding local women hostage has been reported. These camps move quickly so hero up and save these women! Check your map for the camp's reported vicinity.", "PLAIN",10] call RE;

// <<<<<<This pauses script until it times out or a unit is killed>>>>>>
diag_log("MISSION 1: Hostage Rescue - Waiting...");

_timeout = time + mission_despawn_timer;

waitUntil{
_attackerunitsAlive = {alive _x} count (units _attackgroup);
_hostageunitsAlive = {alive _x} count (units _hostagegroup);
((time > _timeout) || (_hostageunitsAlive < 2) || (_attackerunitsAlive < 1))
};

// Wait condition has been satisfied
	diag_log("MISSION 1: Hostage Rescue - Wait condition satisfied");

[nil,nil,rTitleText,"Checking Mission Status...", "PLAIN",10] call RE;
_attackerunitsAlive = {alive _x} count (units _attackgroup);
_hostageunitsAlive = {alive _x} count (units _hostagegroup);

diag_log("MISSION 1: Hostage Rescue - Starting Timeout Check");
if ((_hostageunitsAlive == 2) && (_attackerunitsAlive == 4)) then
	{
	diag_log("MISSION 1: Hostage Rescue - Mission Timed Out");
	[nil,nil,rTitleText,"Mission has timed out", "PLAIN",10] call RE;
	sleep 5;
	EPOCH_MISSION1_RUNNING = false;
	//deleteMarker _event_marker;
	{ deleteVehicle _x } forEach units _attackgroup;
	deleteGroup _attackgroup;
	{ deleteVehicle _x } forEach units _hostagegroup;
	deleteGroup _hostagegroup;
	deleteVehicle _hostagecamp;
	}
	else
	{
	if ((_attackerunitsAlive < 1) && (_hostageunitsAlive > 1)) then
		{
		[nil,nil,rTitleText,"The captors have been eliminated and the hostages survived", "PLAIN",10] call RE;
		
		// Create loot box
		diag_log("MISSION 1: Hostage Rescue - Hostages survived creating loot box");
		_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
		_loot_box setPos _loot_pos;
		clearMagazineCargoGlobal _loot_box;
		clearWeaponCargoGlobal _loot_box;
		clearBackpackCargoGlobal _loot_box;
				 
		// Add loot
		diag_log("MISSION 1: Hostage Rescue - Loot box created, adding loot to loot box");
		{
		_loot_box addWeaponCargoGlobal [_x,1];
		} forEach (_loot select 0);
		{
		_loot_box addMagazineCargoGlobal [_x,1];
		} forEach (_loot select 1);
		{
		_loot_box addBackpackCargoGlobal [_x,1];
		} forEach (_loot select 2);
		// Wait
		sleep _wait_time;
 
		// Clean up
		EPOCH_MISSION1_RUNNING = false;
		deleteVehicle _hostagecamp;
		deleteVehicle _loot_box;
		{ deleteVehicle _x } forEach units _hostagegroup;
		deleteGroup _hostagegroup;
		}
		else
		{
		if (_hostageunitsAlive < 2) then
			{
			diag_log("MISSION 1: Hostage Rescue - Mission Failed, a hostage was killed.");
			[nil,nil,rTitleText,"A hostage was killed... the mission has failed", "PLAIN",10] call RE;
			sleep 15;
			EPOCH_MISSION1_RUNNING = false;
			deleteVehicle _hostagecamp;
			{ deleteVehicle _x } forEach units _attackgroup;
			deleteGroup _attackgroup;
			{ deleteVehicle _x } forEach units _hostagegroup;
			deleteGroup _hostagegroup;
			};
		};
	};
	
 diag_log("MISSION 1: Hostage Rescue - Script Ended");