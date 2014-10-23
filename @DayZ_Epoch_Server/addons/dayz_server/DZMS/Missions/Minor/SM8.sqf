/*
	Bandit Party by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_crash","_tent"];

//Name of the Mission
_missName = "Bandit Party";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Another bandit party has started!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,4,1] ExecVM DZMSAISpawn;
sleep 1;
[_coords,4,2] ExecVM DZMSAISpawn;
sleep 1;


//This function is !! Not tested !!
_tent = createVehicle ["TentStorage",_coords select 1,[], 0, "NONE"];
_tent call DZMSProtectObj;
sleep 1;

_tent addWeaponCargoGlobal   ["ItemCompass", 2];
_tent addWeaponCargoGlobal   ["ItemGPS", 3];
_tent addWeaponCargoGlobal   ["NVGoggles", 1];
_tent addMagazineCargoGlobal ["FoodCanBakedBeans", 4];
_tent addMagazineCargoGlobal ["ItemBandage", 4];
_tent addMagazineCargoGlobal ["ItemMorphine", 4];
_tent addMagazineCargoGlobal ["ItemPainkiller", 4];
_tent addMagazineCargoGlobal ["ItemAntibiotic", 2];
_tent addWeaponCargoGlobal   ["ItemKnife", 2];
_tent addWeaponCargoGlobal   ["ItemToolbox", 2];
_tent addWeaponCargoGlobal   ["ItemMatches", 2];
_tent addMagazineCargoGlobal ["ItemBloodbag", 2];
_tent addMagazineCargoGlobal ["ItemJerryCan", 2];
_tent addMagazineCargoGlobal ["MP5A5", 2];
_tent addMagazineCargoGlobal ["30Rnd_9x19_MP5", 5];
_tent addMagazineCargoGlobal ["glock17_EP1", 2];
_tent addMagazineCargoGlobal ["17Rnd_9x19_glock17", 4];

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30 } count playableunits > 0}; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Bandit party rushed by survivors!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM8 Bandit Party Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;