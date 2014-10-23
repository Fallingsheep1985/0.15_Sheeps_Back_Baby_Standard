/*
	Medical Supply Camp by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_vehicle","_vehicle1","_vehicle2"];

//Name of the Mission
_missName = "Bandit Medical Camp";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Three APC's broken down! Secure their firepower! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal
_vehicle = createVehicle ["BTR60_TK_EP1",[(_coords select 0) - 10, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle ["LAV25",[(_coords select 0) + 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_vehicle2 = createVehicle ["LAV25_HQ",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
[_vehicle1] call DZMSSetupVehicle;
[_vehicle2] call DZMSSetupVehicle;

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
[nil,nil,rTitleText,"Survivors have taken control of the APC's.", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM12 APC Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;