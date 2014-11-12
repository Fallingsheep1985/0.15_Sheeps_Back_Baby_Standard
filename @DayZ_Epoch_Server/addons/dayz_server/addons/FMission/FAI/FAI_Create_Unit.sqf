/*
	File Name: FAI_Create_Unit.sqf
	File Created: 2/26/2014
	File Version: 1.1
	File Author: Foamy 
	File Last Edit Date: 3/23/2014
	File Description: Foamy AI Create Unit Script
	
	Variables:
	1. position
	2. waypoint radius
	3. number of waypoints
	4. unit type ("Bandit", "Sniper", "Medic")
	5. Patrol Position
	6. Mission Type ( "M1", "M2", "M3")
	
	Example:
	_aiunitX = [_aiunit_spawn_pos,50,4,"Bandit",_loot_pos,M1] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Unit.sqf";
			
*/

private ["_aiunit","_xpos","_ypos","_unitpos","_aigroup","_wppos","_wpradius","_wpnum","_unit_type","_unit_loot_loadout","_unit_skill","_wp","_aispawnpos","_chance","_diceroll","_patrol_position","_mission_type"];

// Main Variables 
    _aiunit = objNull;
    _aigroup = createGroup EAST;
    _aispawnpos =_this select 0;
    _wpradius = _this select 1;
    _wpnum = _this select 2;
    _unit_type = _this select 3;
	_patrol_position = _this select 4;
	_mission_type = _this select 5;
	
    _xpos = _patrol_position select 0;
    _ypos = _patrol_position select 1;

// Create AI	
    if (_unit_type == "Bandit") then 
    {
		_chance = .50;
		_diceroll = random 1;
		if (_diceroll < _chance) then 
		{
		"BanditW2_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		}
		else
		{
		"Bandit1_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		};
		_null = [_aiunit] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
	};
	
	if (_unit_type == "Sniper") then 
    {
		_chance = .50;
		_diceroll = random 1;
		if (_diceroll < _chance) then 
		{
		"Sniper1_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		}
		else
		{
		"Camo1_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		};
		_null = [_aiunit] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Sniper.sqf";
	};
			
	if (_unit_type == "Medic") then 
    {
		_chance = .50;
		_diceroll = random 1;
		if (_diceroll < _chance) then 
		{
		"GUE_Soldier_Crew_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		}
		else
		{
		"GUE_Soldier_2_DZ" createUnit [_aispawnpos, _aigroup, "_aiunit=this;",1,"PRIVATE"];
		};
		_null = [_aiunit] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Medic.sqf";
	};	

// Set AI Variables	
	_aiunit enableAI "TARGET";
    _aiunit enableAI "AUTOTARGET";
    _aiunit enableAI "MOVE";
    _aiunit enableAI "ANIM";
    _aiunit enableAI "FSM";
    _aiunit allowDammage true;
    _aiunit setCombatMode "RED";
    _aiunit setBehaviour "COMBAT";

// Set Random Skill
_chance = .50;
_diceroll = random 1;
if (_diceroll < _chance) then
{	
	//set skills
    _aiunit setSkill ["aimingAccuracy",0.4];
    _aiunit setSkill ["aimingShake",0.5];
    _aiunit setSkill ["aimingSpeed",0.6];
    _aiunit setSkill ["endurance",0.7];
    _aiunit setSkill ["spotDistance",0.6];
    _aiunit setSkill ["spotTime",0.5];
    _aiunit setSkill ["courage",0.5];
    _aiunit setSkill ["reloadSpeed",0.4];
    _aiunit setSkill ["commanding",0.5];
    _aiunit setSkill ["general",0.5];
	
	_aiunit setRank "PRIVATE";
	_unit_skill = "Noob";
}
else
{
	_chance = .50;
	_diceroll = random 1;
	if (_diceroll < _chance) then
	{	
	//set skills
    _aiunit setSkill ["aimingAccuracy",0.5];
    _aiunit setSkill ["aimingShake",0.6];
    _aiunit setSkill ["aimingSpeed",0.7];
    _aiunit setSkill ["endurance",0.8];
    _aiunit setSkill ["spotDistance",0.7];
    _aiunit setSkill ["spotTime",0.5];
    _aiunit setSkill ["courage",0.6];
    _aiunit setSkill ["reloadSpeed",0.8];
    _aiunit setSkill ["commanding",0.7];
    _aiunit setSkill ["general",0.7];
	
	_aiunit setRank "SERGEANT";
	_unit_skill = "Skilled";
	}
	else
	{
		//set skills
    _aiunit setSkill ["aimingAccuracy",0.8];
    _aiunit setSkill ["aimingShake",0.8];
    _aiunit setSkill ["aimingSpeed",0.8];
    _aiunit setSkill ["endurance",0.9];
    _aiunit setSkill ["spotDistance",0.8];
    _aiunit setSkill ["spotTime",0.8];
    _aiunit setSkill ["courage",0.9];
    _aiunit setSkill ["reloadSpeed",0.8];
    _aiunit setSkill ["commanding",1];
    _aiunit setSkill ["general",1];

	_aiunit setRank "LIEUTENANT";
	_unit_skill = "Elite";
	};
	
};

// Add a Radio to Elite AI
if (_unit_skill == "Elite") then
{
_aiunit addWeapon "ItemRadio";
};
    
//Generate WayPoints
for [{ x=1 },{ x < _wpnum },{ x = x + 1; }] do 
{
_wppos = [_xpos+(x*20),_ypos+(x*20),_wpradius];
_wp = _aigroup addWaypoint [_wppos, _wpradius];
_wp setWaypointType "MOVE";
};
_wp = _aigroup addWaypoint [[_xpos,_ypos,0], _wpradius];
_wp setWaypointType "CYCLE";

// Report results to RPT File
diag_log format ["FAI Unit 1.1: -=%1=- %2 Spawned @ Location: %3 | Patrol Radius: %4m | Waypoints Assigned: %5",_unit_skill,_unit_type,_aispawnpos,_wpradius,_wpnum];


if (_mission_type == "M1") then
{
	waitUntil 
	{
	(!EPOCH_MISSION1_RUNNING)
	};
	{ deleteVehicle _x } forEach units _aigroup;
	deleteGroup _aigroup;
	diag_log("FAI Unit 1.1: AI Units Deleted");
};

if (_mission_type == "M2") then
{
	waitUntil 
	{
	(!EPOCH_MISSION2_RUNNING)
	};
	{ deleteVehicle _x } forEach units _aigroup;
	deleteGroup _aigroup;
	diag_log("FAI Unit 1.1: AI Units Deleted");
};

if (_mission_type == "M3") then
{
	waitUntil 
	{
	(!EPOCH_MISSION3_RUNNING)
	};
	{ deleteVehicle _x } forEach units _aigroup;
	deleteGroup _aigroup;
	diag_log("FAI Unit 1.1: AI Units Deleted");
};