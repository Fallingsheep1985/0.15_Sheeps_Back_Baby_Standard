/*
	File Name: XXXXX.sqf
	File Created: X/X/XXXX
	File Version: X
	File Author: X 
	File Last Edit Date: X/X/XXXX
	File Description: XXXXXX (M3)
	Template by: Foamy

*/

// CHECK FOR ANOTHER MISSION 3 RUNNING START ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if (isNil "EPOCH_MISSION3_RUNNING") then 
	{
	EPOCH_MISSION3_RUNNING = false;
	};

	if (EPOCH_MISSION3_RUNNING) exitWith 
	{
	diag_log("MISSION 3 already running");
	};

// CHECK FOR ANOTHER MISSION 3 RUNNING END ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Don't forget to add all your "_names" to the private section
private ["_missionSpawnChance","_spawnMarker","_spawnRadius","_markerRadius","_markerColor","_item","_debug","_loot","_loot_lists","_loot_box","_wait_time","_spawnRoll","_position","_loot_pos","_loot_box","_textMarker_IconType","_markerText","_markerBrush"];

diag_log("MISSION 3: Mission Name - Script Started");

_missionSpawnChance =  .50; //Set Spawn Chance Here 1 = always
_spawnRoll = random 1;

diag_log("MISSION 3: Mission Name - Checking MissionSpawnChance");
if (_spawnRoll > _missionSpawnChance) exitWith 
{
diag_log format ["MISSION 3: Mission Name - Failed with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
};

sleep .5;
diag_log("MISSION 3: Mission Name - Mission SpawnChance Success");

sleep .5;
diag_log("MISSION 3: Mission Name - Mission Script Started");

EPOCH_MISSION3_RUNNING = true;


/*
// Edit Loot Box Contents Below
// Format is:
// 1st row = Weapons, Tools ( Compass, etc)
// 2nd row = Ammo, Food items etc
// 3rd row = Backpacks

The loot example in this template has 2 loadouts to choose from, you can add as many as you want. The more you add the more 
variety you will have.
Each addition will use a block like this:
[
["DMR","NVGoggles","Binocular_Vector"],
["20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","ItemSodaMdew","ItemSodaR4z0r","ItemAntibiotic"],
["DZ_Backpack_EP1"]
], <---- The , is NOT needed on last loot block, see example below where the , is only used to separate the 
first block from the second block. There is no , at the end of the second block as it is the last block in 
the list.

*/

//---------------------------------------------------------------------------------

// Loot Box Setup
_loot_box = "GuerillaCacheBox";
_loot_lists = [
[
["DMR","NVGoggles","Binocular_Vector"],
["20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","ItemSodaMdew","ItemSodaR4z0r","ItemAntibiotic"],
["DZ_Backpack_EP1"]
],
[
["M4A1_AIM_SD_CAMO","ItemGPS","Binocular"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","ItemSodaRbull"],
["DZ_ALICE_Pack_EP1"]
]
];

//---------------------------------------------------------------------------------

_loot = _loot_lists call BIS_fnc_selectRandom;

// Mission Variables
mission_despawn_timer = 1200; // This sets the Timeout if a timer is used.
_wait_time = 900; // This is how long the loot box will stay once it spawns.
_spawnRadius = 5000; // This is the distance from Center - Used to determine the radius in which missions will spawn
_spawnMarker = 'center'; // DO NOT Change this, UNLESS you need a hard coded center loc for custom purposes
_markerRadius = 350; // This sets marker radius and the area the loot can spawn in
_markerColor = "ColorBlue"; // This sets the Marker Color
_textMarker_IconType = "mil_objective"; // This sets the "Icon Type" (https://community.bistudio.com/wiki/cfgMarkers)
_markerText = "Mission: Blah Blah"; // Text to display at Marker (Leave "" blank if you dont want a message)
_markerBrush = "SOLID"; // Marker Brush - How the marker is filled in

// This sets the global position coords the mission needs to run, do not change.
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,20,0] call BIS_fnc_findSafePos;
_loot_pos = [_position,0,(_markerRadius - 100),10,0,20,0] call BIS_fnc_findSafePos;

// Use these if using AI, Vehicles or Helis
_aiunit_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_aivehicle_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_aiheli_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;

//---------------------------------------------------------------------------------
// Mission Body STARTS Here
// Read General Script Instructions for Variable Usage per script.

// Add a Marker? Make sure to use FMarker3.sqf for M3 Missions
[_position,_loot_pos,_markerRadius,_markerColor,false,_textMarker_IconType,_markerText,_markerBrush] execVM "\z\addons\dayz_server\addons\FMission\FMarker\FMarker3.sqf";

// Add a base?
_base = createVehicle ["Land_fortified_nest_big",_loot_pos,[], 0, "CAN_COLLIDE"];
_base setPos _loot_pos;

// Add some AI to patrol?
_aiunitX = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,M1] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

// Add a one off custom AI?
	_attackgroup = createGroup east;
	
		_attacker1 = _attackgroup createUnit ["TK_INS_Soldier_3_EP1", _base, [], 0, "Form"];
			_attacker1 setUnitPos "AUTO";
			[_attacker1] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
			_attacker1 setUnitPos "Middle";

// Add a Heli Patrol?
_aiHeli = [_aiheli_spawn_pos,_loot_pos,250,"M1"] execVM "\z\addons\dayz_server\addons\FAI\FMission\FAI_Create_Heli.sqf";

// Add a Vehicle patrols?
_aiVehicle = [_aivehicle_spawn_pos,_loot_pos,100,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Vehicle.sqf";


// Create a loot box?
		// Create loot box
		diag_log("MISSION 3: Mission Name - Creating loot box");
		_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
		_loot_box setPos _loot_pos;
		clearMagazineCargoGlobal _loot_box;
		clearWeaponCargoGlobal _loot_box;
		clearBackpackCargoGlobal _loot_box;
				 
		// Add loot
		diag_log("MISSION 3: Mission Name - Loot box created, adding loot to loot box");
		{
		_loot_box addWeaponCargoGlobal [_x,1];
		} forEach (_loot select 0);
		{
		_loot_box addMagazineCargoGlobal [_x,1];
		} forEach (_loot select 1);
		{
		_loot_box addBackpackCargoGlobal [_x,1];
		} forEach (_loot select 2);

// Wait for awhile so loot can be collected?
sleep _wait_time;


// Mission Body ENDS here
// ---------------------------------------------------------------------------------


// Add additional deleteVehicle _xxx; for each item that needs to be deleted.
// Add additional deleteVehicle _xxgroup; to delete the AI units
// Clean up
		EPOCH_MISSION3_RUNNING = false;
		
		deleteVehicle _loot_box;
		{ deleteVehicle _x } forEach units _attackgroup;
		deleteGroup _attackgroup;
		
		
		diag_log("MISSION 3: Mission Name - Script Finished");	