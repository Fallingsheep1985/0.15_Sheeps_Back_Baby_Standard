/*
	Constructors Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_crate","_crate2","_vehicle","_base1","_base2"];

//Name of the Mission
_missName = "Constructors";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Intel suggests bandits may be trying to build a base nearby, locate and terminate before they get fortified.", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Create the loot
_crate = createVehicle ["USVehicleBox",[(_coords select 0) + 25, (_coords select 1),0],[], 0, "CAN_COLLIDE"];
[_crate,"meds"] ExecVM DZMSBoxSetup;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,3,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,3,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,3,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,3,1] ExecVM DZMSAISpawn;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30  } count playableunits > 0};

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM DZMSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors flew with all the base building parts.", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM13 Constructors Mission Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;