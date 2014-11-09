/*
	File Name: FAI_Create_Heli.sqf
	File Created: 2/26/2014
	File Version: 1.1
	File Author: Foamy 
	File Last Edit Date: 3/23/2014
	File Description: Foamy AI Create Vehicle Script
	
	Variables:
	1. Position
	2. Patrol Position
	3. Patrol Radius
	4. Mission Type ( "M1", "M2", "M3")

	Example:
	_aiHeli = [_aiheli_spawn_pos,_loot_pos,250,"M1"] execVM "\z\addons\dayz_server\addons\FAI\FMission\FAI_Create_Heli.sqf";
	
*/

private ["_aispawnpos","_aigroup","_aiHeli","_patrol_radius","_helitype","_aiVehicleObj","_aiVehicleCrew","_aiVehicleGroup","_mission_type"];

_aiHeli = objNull;
_aigroup = createGroup EAST;
_aispawnpos = _this select 0;
_patrol_pos = _this select 1;
_patrol_radius = _this select 2;
_mission_type = _this select 3;

	_aiHeli = [_aispawnpos, 180, "UH1H_DZ", _aigroup] call BIS_fnc_spawnVehicle;
	[_aigroup, _patrol_pos, _patrol_radius] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_fn_heliPatrol.sqf";
	_helitype = "UH1H_DZ";
	_aiHeliDObj = _aiHeli select 0;
	_aiHeliDObj setVehicleLock "LOCKED";
	
// Report results to RPT File
diag_log format ["FAI Heli 1.0: -=%1=- Spawned @ Location: %2 | Patrol Radius: %3m",_helitype,_aispawnpos,_patrol_radius];

if (_mission_type == "M1") then
{
	waitUntil 
	{
	(!EPOCH_MISSION1_RUNNING)
	};
	_aiVehicleObj = _aiHeli select 0;
	_aiVehicleCrew = _aiHeli select 1;
	_aiVehicleGroup = _aiHeli select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj); deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Heli Deleted");
};

if (_mission_type == "M2") then
{
	waitUntil 
	{
	(!EPOCH_MISSION2_RUNNING)
	};
	_aiVehicleObj = _aiHeli select 0;
	_aiVehicleCrew = _aiHeli select 1;
	_aiVehicleGroup = _aiHeli select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj); deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Heli Deleted");
};

if (_mission_type == "M3") then
{
	waitUntil 
	{
	(!EPOCH_MISSION3_RUNNING)
	};
	_aiVehicleObj = _aiHeli select 0;
	_aiVehicleCrew = _aiHeli select 1;
	_aiVehicleGroup = _aiHeli select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj); deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Heli Deleted");
};	