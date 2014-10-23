/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_vehicle","_crate","_crate2"];

//Name of the Mission
_missName = "C-130 Crash";

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

[nil,nil,rTitleText,"A C-130 has crash landed! Secure it's cargo for yourself!", "PLAIN",10] call RE;

_vehicle = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 35, (_coords select 1) - 5,0],[], 0, "NONE"];
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 20, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["USVehicleBox",[(_coords select 0) + 20, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weap"] ExecVM DZMSBoxSetup;
[_crate2,"meds"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,4,2] ExecVM DZMSAISpawn;
sleep 5;
[_coords,4,3] ExecVM DZMSAISpawn;
sleep 5;

//Wait until the player is within 30meters
waitUntil{ {isPlayer _x && _x distance _coords <= 30 } count playableunits > 0 }; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The gear cache has been found, nice work, enjoy the spoils!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM8 C130 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;