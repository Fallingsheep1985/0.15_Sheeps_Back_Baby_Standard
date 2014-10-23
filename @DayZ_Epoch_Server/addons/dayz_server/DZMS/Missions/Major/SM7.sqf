/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_crate"];

//Name of the Mission
_missName = "Large Ammo Cache";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A gear cache has been airdropped! Secure it for yourself!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weap"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,6,2] ExecVM DZMSAISpawn;
sleep 5;
[_coords,8,3] ExecVM DZMSAISpawn;
sleep 5;
[_coords,8,1] ExecVM DZMSAISpawn;
sleep 5;

//Wait until the player is within 30meters
waitUntil{ {isPlayer _x && _x distance _coords <= 30 } count playableunits > 0 }; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The gear cache has been found, nice work, enjoy the spoils!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM7 Weapon Cache Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;