/*
	Angry Axemans by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords"];

//Name of the Mission
_missName = "Angry Axeman's";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Angry Axeman's !Watch out before they catch you!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,6,0] ExecVM DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30  } count playableunits > 0}; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Finally! THEY died! Check the body for medical supplies!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM13 Psycho's Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;