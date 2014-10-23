/*
	Hillbilly Mission by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_base","_base2","_base3"];

//Name of the Mission
_missName = "Hillbillies";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Hillbillies have moved into the area", "PLAIN",10] call RE;

_base = createVehicle ["land_housev_1i4",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["land_kbud",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base3 = createVehicle ["land_kbud",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,4,0] ExecVM DZMSAISpawn;
sleep 1;
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 1;
[_coords,6,2] ExecVM DZMSAISpawn;
sleep 1;
[_coords,4,3] ExecVM DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30 } count playableunits > 0}; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors raped the Hillbillies! Loot them!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM9 Hillbilly Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;