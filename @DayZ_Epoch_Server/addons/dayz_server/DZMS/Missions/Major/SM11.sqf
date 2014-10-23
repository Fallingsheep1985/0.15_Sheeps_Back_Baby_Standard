/*
	HMMWV Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_vehicle","_vehicle1"];

//Name of the Mission
_missName = "HMMWV's";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Two HMMWV's has broken down! Secure their firepower for yourself!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal
_vehicle = createVehicle ["HMMWV_M998_crows_MK19_DES_EP1_DZE",[(_coords select 0) + 10, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle ["HMMWV_M998_crows_MK19_DES_EP1_DZE",[(_coords select 0) + 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
[_vehicle1] call DZMSSetupVehicle;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,5,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,5,1] ExecVM DZMSAISpawn;
sleep 5;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30  } count playableunits > 0};

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM DZMSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors secured the HMMWV's!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM3 Medical Camp Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;