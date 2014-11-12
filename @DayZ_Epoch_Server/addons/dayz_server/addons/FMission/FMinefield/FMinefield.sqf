/*
	File Name: FMinefield.sqf
	File Created: 3/1/2014
	File Version: 1.1
	File Author: Foamy 
	File Last Edit Date: 3/23/2014
	File Description: Creates a mine field around a position
	Based on a Script by Zonekiller
	
	Variables:
	1. Minefield Center (Location of Field Center)
	2. Faction of Base (Who's field is it?)
	3. Spawn Chance (Chance of Minefield Spawning at the specified position)
	
	Example:
	[_loot_pos,east,.30] execVM "\z\addons\dayz_server\addons\FMission\FMinefield\FMinefield.sqf";
	
*/

if !(isServer) exitwith {};

private ["_minefield_center","_signpos","_s1","_side","_pos","_spread","_initCode","_height","_mine","_minefield","_minepos","_bombpos","_mtrigger","_minePH","_mine_count","_mine_countdown","_minefield_SpawnChance","_spawnRoll"];

_minefield_center = _this select 0;
_minefield_faction = _this select 1;
_minefield_SpawnChance = _this select 2;
_side = "";
_spawnRoll = random 1;

diag_log("FMinefield: Checking Mine Field Spawn Chance");
sleep .5;
if (_spawnRoll > _minefield_SpawnChance) exitWith 
{
diag_log format ["FMinefield 1.0: Spawn Chance Failed with %1 it needed to be lower than %2",_spawnRoll,_minefield_SpawnChance];
};

diag_log format ["FMinefield 1.0: Spawn Chance Succeeded with %1 it needed to be lower than %2",_spawnRoll,_minefield_SpawnChance];

if (_minefield_faction == west) then {_side = "((resistance countside thislist > 0) or (east countside thislist > 0))"};
if (_minefield_faction == east) then {_side = "((resistance countside thislist > 0) or (west countside thislist > 0))"};
if (_minefield_faction == resistance) then {_side = "((east countside thislist > 0) or (west countside thislist > 0))"};
 
_minefield_spawn_PH = createVehicle ["HeliHEmpty", _minefield_center, [], 0, ""];
_pos = getPosATL _minefield_spawn_PH;

_initCode = "";
_minefield = [];

_signpos = [(_pos select 0) + 50, (_pos select 1),0];
_s1 = "Sign_Danger" createVehicle _signpos;
_minefield = _minefield + [_s1];
_s1 setdir 90;

_signpos = [(_pos select 0) - 50, (_pos select 1),0];
_s2 = "Sign_Danger" createVehicle _signpos;
_minefield = _minefield + [_s2];
_s2 setdir 270;

_signpos = [(_pos select 0) , (_pos select 1) + 50,0];
_s3 = "Sign_Danger" createVehicle _signpos;
_minefield = _minefield + [_s3];
_s3 setdir 0;

_signpos = [(_pos select 0) , (_pos select 1) - 50,0];
_s4 = "Sign_Danger" createVehicle _signpos;
_minefield = _minefield + [_s4];
_s4 setdir 180;

_i = 1;
_mine = 0;
_mine_count = 50;
_height = 0;
_spread = 50;

while {_mine < _mine_count} do
	{
		
	_minepos = [(_pos select 0) + (random (_spread*2)) - _spread, (_pos select 1) + (random (_spread*2)) -_spread, _height];
	_bombpos = [(_minepos select 0), (_minepos select 1), _height];
	_initCode = "'B_25mm_HE' createVehicle ";
	_initCode = _initCode + format["%1",_bombpos];
	_minePH = createVehicle ["MineE", _bombpos, [], 0, ""];
	_minePH setvehiclevarName "minePH_"+ str _i;
	call compile format["%1 = _minePH","minePH_"+ str _i];	
	
	// Report results to RPT File
	diag_log format ["FMinefield 1.0: -=Mine=- Spawned @ Location: %1",_bombpos];
		
	_mtrigger = createTrigger["EmptyDetector", _minepos];
	_mtrigger setTriggerArea[1.5,1.5,0,true];
	_mtrigger setTriggerActivation["ANY","PRESENT",false];
	_mtrigger setTriggerTimeout[0,0,0, true ];
	_mtrigger setTriggerStatements[_side, _initCode ,""];
	_minefield = _minefield + [_mtrigger];
	_mtrigger setvehiclevarName "mtrigger_"+ str _i;
	call compile format["%1 = _mtrigger","mtrigger_"+ str _i];
	
	_mine = _mine + 1;
	_i = _i +1;
	
	};