/*
	Ural Wreck by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_crash","_crate"];

//Name of the Mission
_missName = "Ural Wreck";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A truck has crashed! Kill any survivors and secure the loot!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add the scenery
_crash = createVehicle ["uralwreck", _coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 1;
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 1;
[_coords,3,3] ExecVM DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30  } count playableunits > 0}; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM12 Ural Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;
