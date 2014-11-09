/*
	File Name: FMission_M1_Assassination.sqf
	File Created: 2/26/2014
	File Version: 1.2
	File Author: Foamy 
	File Last Edit Date: 3/26/2014
	File Description: Assassination Mission (M1)
*/

// CHECK FOR ANOTHER MISSION 1 RUNNING START ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if (isNil "EPOCH_MISSION1_RUNNING") then 
	{
	EPOCH_MISSION1_RUNNING = false;
	};

	if (EPOCH_MISSION1_RUNNING) exitWith 
	{
	diag_log("MISSION 1 already running");
	};

// CHECK FOR ANOTHER MISSION 1 RUNNING END ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

private ["_missionSpawnChance","_spawnMarker","_spawnRadius","_markerRadius","_markerColor","_loot","_loot_lists","_loot_box","_wait_time","_spawnRoll","_position","_loot_pos","_base","_aiunit_spawn_pos","_aivehicle_spawn_pos","_aiheli_spawn_pos","_targetunitsAlive","_targetgroup","_target1","_attackgroup","_attacker1","_attacker2","_aiunit1","_aiunit2","_aiunit3","_aiunit4","_aiunit5","_timeout"];

diag_log("MISSION 1: Assassination - Script Started");

_missionSpawnChance =  .40;
_spawnRoll = random 1;

diag_log("MISSION 1: Assassination - Checking MissionSpawnChance");
if (_spawnRoll > _missionSpawnChance) exitWith 
{
diag_log format ["MISSION 1: Assassination - Failed with %1 it needed to be lower than %2",_spawnRoll,_missionSpawnChance];
};

sleep .5;
diag_log("MISSION 1: Assassination - Mission SpawnChance Success");

sleep .5;
diag_log("MISSION 1: Assassination - Mission Script Started");

EPOCH_MISSION1_RUNNING = true;

_loot_box = "GuerillaCacheBox";
_loot_lists = [
[
["M9SD","ItemMachete","Binocular"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemTrashToiletpaper"],
["DZ_CivilBackpack_EP1"]
],
[
["DMR","NVGoggles","Binocular_Vector"],
["20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","ItemSodaMdew","PipeBomb","ItemAntibiotic","ItemGoldBar10oz"],
["DZ_GunBag_EP1"]
],
[
["MP5SD","ItemFlashlightRed","ItemCompass"],
["30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","ItemSodaMdew","ItemWire","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz"],
["DZ_TerminalPack_EP1"]
],
[
["SVD_CAMO","ItemWatch","Binocular"],
["10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","ItemSodaMdew","ItemBurlap","ItemGoldBar","ItemGoldBar","ItemGoldBar"],
["DZ_Backpack_EP1"]
],
[
["M4A1_AIM_SD_CAMO","ItemGPS","Binocular"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","ItemSodaRbull","ItemGoldBar10oz","ItemGoldBar10oz"],
["DZ_ALICE_Pack_EP1"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;

mission_despawn_timer = 1200;
_wait_time = 900;
_spawnRadius = 5000;
_spawnMarker = 'center';
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_markerColor = "ColorBlue";
_textMarker_IconType = "mil_objective";
_markerText = "Mission: Assassination";
_markerBrush = "SOLID";

// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,20,0] call BIS_fnc_findSafePos;
_loot_pos = [_position,0,(_markerRadius - 100),10,0,20,0] call BIS_fnc_findSafePos;

// FMarker Launch
[_position,_loot_pos,_markerRadius,_markerColor,false,_textMarker_IconType,_markerText,_markerBrush] execVM "\z\addons\dayz_server\addons\FMission\FMarker\FMarker1.sqf";

diag_log(format["MISSION 1: Assassination - Spawning loot event at %1", _position]);
 
_aiunit_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_aivehicle_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_aiheli_spawn_pos = [_loot_pos, 30, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
	
_base = createVehicle ["Land_fortified_nest_big",_loot_pos,[], 0, "CAN_COLLIDE"];
_base setPos _loot_pos;

sleep 1;

diag_log("MISSION 1: Assassination - Loading -=FAI Units=- Started");

_aiunit1 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit2 = [_aiunit_spawn_pos,50,4,"Sniper",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit3 = [_aiunit_spawn_pos,50,4,"Medic",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit4 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

_aiunit5 = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";

sleep 10;
diag_log("MISSION 1: Assassination - Loading -=FAI=- Completed");

sleep .5;
diag_log("MISSION 1: Assassination - Loading -=FAI Vehicle=- Started");
_aiVehicle = [_aivehicle_spawn_pos,_loot_pos,150,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Vehicle.sqf";
sleep 1;
diag_log("MISSION 1: Assassination - Loading -=FAI Vehicle=- Completed");

sleep .5;
diag_log("MISSION 1: Assassination - Loading -=FAI Heli=- Started");
_aiHeli = [_aiheli_spawn_pos,_loot_pos,250,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Heli.sqf";
sleep 1;
diag_log("MISSION 1: Assassination - Loading -=FAI Heli=- Completed");

sleep 1;

diag_log("MISSION 1: Assassination - Creating Assassination Target");
// Add Assassination Target
_targetgroup = createGroup civilian;
		_target1 = _targetgroup createUnit ["Hooker4", _base, [], 0, "Form"];
			_target1 setUnitPos "DOWN";
			_target1 disableAI "MOVE";
			_target1 setCaptive true;
			removeAllItems _target1;
			
// Add Interior Guards
diag_log("MISSION 1: Assassination - Spawning Interior Attackers");
	_attackgroup = createGroup east;
	
		_attacker1 = _attackgroup createUnit ["TK_INS_Soldier_3_EP1", _base, [], 0, "Form"];
			_attacker1 setUnitPos "AUTO";
			_null = [_attacker1] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
			_attacker1 setUnitPos "Middle";
		
		_attacker2 = _attackgroup createUnit ["TK_Soldier_Medic_EP1", _base, [], 0, "Form"];
			_attacker2 setUnitPos "AUTO";
			_null = [_attacker2] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Medic.sqf";
			_attacker2 setUnitPos "Middle";
			
			_attackgroup setCombatMode "RED";
			_attackgroup setBehaviour "STEALTH";

// Add a chance to spawn a Mine Field
[_loot_pos,east,.50] execVM "\z\addons\dayz_server\addons\FMission\FMinefield\FMinefield.sqf";

[nil,nil,rTitleText,"MISSION: Assassination - A high profile target has been located at a temporary camp. Assassinate the target before they leave the area!", "PLAIN",10] call RE;			
			
diag_log("MISSION 1: Assassination - Waiting...");
_timeout = time + mission_despawn_timer;
waitUntil 
{
_targetunitsAlive = {alive _x} count (units _targetgroup);
((time > _timeout) || (_targetunitsAlive < 1))
};

_targetunitsAlive = {alive _x} count (units _targetgroup);
if (_targetunitsAlive < 1) then
{
[nil,nil,rTitleText,"MISSION: Target Eliminated, Good Job.", "PLAIN",10] call RE;

		// Create loot box
		diag_log("MISSION 1: Assassination - Target eliminated creating loot box");
		_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
		_loot_box setPos _loot_pos;
		clearMagazineCargoGlobal _loot_box;
		clearWeaponCargoGlobal _loot_box;
		clearBackpackCargoGlobal _loot_box;
				 
		// Add loot
		diag_log("MISSION 1: Assassination - Loot box created, adding loot to loot box");
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
		deleteVehicle _base;
		deleteVehicle _loot_box;
		{ deleteVehicle _x } forEach units _targetgroup;
		deleteGroup _targetgroup;
		{ deleteVehicle _x } forEach units _attackgroup;
		deleteGroup _attackgroup;
		diag_log("MISSION 1: Assassination - Script Finished");
}			
else
{
[nil,nil,rTitleText,"MISSION: Assassination Failed - The target escaped.", "PLAIN",10] call RE;
		// Clean up
		EPOCH_MISSION1_RUNNING = false;
		deleteVehicle _base;
		{ deleteVehicle _x } forEach units _targetgroup;
		deleteGroup _targetgroup;
		{ deleteVehicle _x } forEach units _attackgroup;
		deleteGroup _attackgroup;
		diag_log("MISSION 1: Assassination - Script Finished");
};