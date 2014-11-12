/*
	File Name: FAI_Create_Vehicle.sqf
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
	_aiVehicle = [_aivehicle_spawn_pos,_loot_pos,100,"M1"] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_Create_Vehicle.sqf";
	
*/

private ["_aispawnpos","_aigroup","_patrol_pos","_patrol_radius","_vehicletype","_aiVehicle","_aiVehicleObj","_aiVehicleDObj","_aiVehicleCrew","_aiVehicleGroup","_mission_type"];

//_aiVehicle = objNull;
_aigroup = createGroup EAST;
_aispawnpos = _this select 0;
_patrol_pos = _this select 1;
_patrol_radius = _this select 2;
_mission_type = _this select 3;


_vehicletype = ["ArmoredSUV_PMC_DZ","GAZ_Vodnik_DZ","HMMWV_M1151_M2_CZ_DES_EP1_DZ"] call BIS_fnc_selectRandom;

if (_vehicletype == "ArmoredSUV_PMC_DZ") then
	{
	_aiVehicle = [_aispawnpos, 180, "ArmoredSUV_PMC_DZ", _aigroup] call BIS_fnc_spawnVehicle;
	[_aigroup, _aispawnpos, _patrol_radius] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_fn_vehiclePatrol.sqf";
	_aiVehicleDObj = _aiVehicle select 0;
	_aiVehicleDObj setVehicleLock "LOCKED";
	};
	
if (_vehicletype == "GAZ_Vodnik_DZ") then
	{
	_aiVehicle = [_aispawnpos, 180, "GAZ_Vodnik_DZ", _aigroup] call BIS_fnc_spawnVehicle;
	[_aigroup, _aispawnpos, _patrol_radius] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_fn_vehiclePatrol.sqf";
	_aiVehicleDObj = _aiVehicle select 0;
	_aiVehicleDObj setVehicleLock "LOCKED";
	};

if (_vehicletype == "HMMWV_M1151_M2_CZ_DES_EP1_DZ") then
	{
	_aiVehicle = [_aispawnpos, 180, "HMMWV_M1151_M2_CZ_DES_EP1_DZ", _aigroup] call BIS_fnc_spawnVehicle;
	[_aigroup, _aispawnpos, _patrol_radius] execVM "\z\addons\dayz_server\addons\FMission\FAI\FAI_fn_vehiclePatrol.sqf";
	_aiVehicleDObj = _aiVehicle select 0;
	_aiVehicleDObj setVehicleLock "LOCKED";
	};	

// Report results to RPT File
diag_log format ["FAI Vehicle 1.0: -=%1=- Spawned @ Location: %2 | Patrol Radius: %3m",_vehicletype,_aispawnpos,_patrol_radius];	

if (_mission_type == "M1") then
{
	waitUntil 
	{
	(!EPOCH_MISSION1_RUNNING)
	};
	_aiVehicleObj = _aiVehicle select 0;
	_aiVehicleCrew = _aiVehicle select 1;
	_aiVehicleGroup = _aiVehicle select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj); 
	deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Vehicle Deleted");
};

if (_mission_type == "M2") then
{
	waitUntil 
	{
	(!EPOCH_MISSION2_RUNNING)
	};
	_aiVehicleObj = _aiVehicle select 0;
	_aiVehicleCrew = _aiVehicle select 1;
	_aiVehicleGroup = _aiVehicle select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj);
	deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Vehicle Deleted");
};

if (_mission_type == "M3") then
{
	waitUntil 
	{
	(!EPOCH_MISSION3_RUNNING)
	};
	_aiVehicleObj = _aiVehicle select 0;
	_aiVehicleCrew = _aiVehicle select 1;
	_aiVehicleGroup = _aiVehicle select 2;

	{ deleteVehicle _x } forEach (crew _aiVehicleObj);
	deleteVehicle _aiVehicleObj;

	diag_log("FAI Vehicle 1.0: AI Vehicle Deleted");
};