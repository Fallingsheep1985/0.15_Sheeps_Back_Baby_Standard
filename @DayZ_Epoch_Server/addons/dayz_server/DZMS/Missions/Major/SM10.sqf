/*
	CH47 Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "CH47 Mission";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A CH47 has crash landed! Secure it's firepower for yourself!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that ad
//Create the vehicles
_vehicle = createVehicle ["CH_47F_EP1_DZE",[(_coords select 0) + 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;
	
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
[nil,nil,rTitleText,"Good work you've secured the helicopter!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Major SM10 CH47 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;