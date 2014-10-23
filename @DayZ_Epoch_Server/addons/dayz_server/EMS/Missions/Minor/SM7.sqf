/*  Sniper team script Created by TheSzerdi Edited by Falcyn [QF]
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords"];

//Name of the Mission
_missName = "Bandit Weapons Truck";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Sniper's !Pay attention!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

[_coords,3,0] ExecVM DZMSAISpawn;
sleep 1;
[_coords,3,0] ExecVM DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30 } count playableunits > 0}; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The snipers moved over!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM7 Sniper Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;