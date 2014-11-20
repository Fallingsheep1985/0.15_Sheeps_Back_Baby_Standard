// By Zabn 2014
private["_itemNew","_isFemale","_PlayeritemNew","_PlayerokSkin","_Playerskin","_PlayeritemNewName","_result2","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result","_animState","_takeClothesUsageTime","_started","_finished","_takeClothesUseTime"];

if (!isNil "DZE_ActionInProgress") then { // check if this is dayz epoch
if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.
};

_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["You can't perform this action while on a ladder!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not take clothes while in a vehicle", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = (typeOf _body);
// get skin of player
_Playerskin = (typeOf player);
_itemNew = _skin;
//
_PlayeritemNew = _Playerskin;
// lets exit script if player is already wearing the skin he is trying to steal...
if (_skin == _Playerskin) exitwith {cutText [format["You are already wearing this skin!"], "PLAIN DOWN"];};

switch (_itemNew) do {
case "Survivor3_DZ": {
_itemNew = "Survivor2_DZ";
};
case "Bandit1_DZ": {
_itemNew = "Survivor2_DZ";
};
};
// switching humanity models that have no parcel for giving back parcels on non supported skins,
// add aditional above and below if additional skin parcels exist.
switch (_PlayeritemNew) do {
case "Survivor3_DZ": {
_PlayeritemNew = "Survivor2_DZ";
};
case "Bandit1_DZ": {
_PlayeritemNew = "Survivor2_DZ";
};
};
// female check on player
_isFemale = ((_Playerskin == "SurvivorW2_DZ") || (_Playerskin == "BanditW1_DZ"));
_itemNew = "Skin_" + _itemNew;
// Adding parcel name value
_PlayeritemNew = "Skin_" + _PlayeritemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);
// checking new name against configs
_PlayerokSkin = isClass (configFile >> "CfgMagazines" >> _PlayeritemNew);

_takeClothesUseTime = 6;

r_interrupt = false;
r_doLoop = true;
_takeClothesUsageTime = time;
_animState = animationState player;
_started = false;
_finished = false;
// if body skin has parcel, or player is not a female.
if((_okSkin) || (!_isFemale)) then {
_clothesTaken = _body getVariable["clothesTaken",false];
if(!_clothesTaken) then {
while {r_doLoop} do {
private ["_isMedic"];

_clothesTaken = _body getVariable["clothesTaken",false];
_animState = animationState player;
_isMedic = ["medic",_animState] call fnc_inString;
if(_clothesTaken) then {
r_doLoop = false;
};
if (_isMedic) then {
_started = true;
};
if(!_isMedic && !r_interrupt && (time - _takeClothesUsageTime) < _takeClothesUseTime) then {
player playActionNow "Medic";
_isMedic = true;
};
if (_started && !_isMedic && (time - _takeClothesUsageTime) > _takeClothesUseTime) then {
r_doLoop = false;
_finished = true;
};
if (r_interrupt) then {
r_doLoop = false;
};
sleep 0.1;
};
r_doLoop = false;
if(_finished) then {
// If skin has parcel. Add parcel to body.
if (_okSkin) then {
_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
_result = [player,_itemNew] call BIS_fnc_invAdd;
if (_result) then {
_body setVariable["clothesTaken",true,true];
cutText [format["One %1 has been added to your inventory!",_itemNewName], "PLAIN DOWN"];
} else {

};
} else {
// If no parcel can be obtained from body, humanitymorph to directly wear skin.
// Checking if current player skin can be moved to inventory and player not female.
if (_PlayerokSkin && !_isFemale) then {
_PlayeritemNewName = getText (configFile >> "CfgMagazines" >> _PlayeritemNew >> "displayName");
_result2 = [player,_PlayeritemNew] call BIS_fnc_invAdd;
// If parcel can be made from currently worn skin, added to inventory and humanitymorph to new skin.
if (_result2) then {
cutText [format["You have packed your %1 up and decided to try on your new clothes instead!",_PlayeritemNewName], "PLAIN DOWN"];
sleep 0.5;
_body setVariable["clothesTaken",true,true];
// maybe add something that changes model of body to regular survivor so players don't try multiple uses?
[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
} else {
cutText [format["You didn't have enough room to store a %1 !",_itemNewName], "PLAIN DOWN"];
};
} else {
// If parcel from players worn skin cannot be found, humanity morph and lose skin player was wearing.
cutText [format["You lost your %1 you were wearing, but you atleast put on your new clothes!",_Playerskin], "PLAIN DOWN"];
sleep 0.5;
_body setVariable["clothesTaken",true,true];
// maybe add something that changes model of body to what player was wearing?
[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
};
};
} else {
if(_clothesTaken) then {
player switchMove "";
player playActionNow "stop";
cutText ["This Skin has already been taken!", "PLAIN DOWN"];
} else {
r_interrupt = false;
player switchMove "";
player playActionNow "stop";
cutText [format["You have interrupted taking clothes!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
};
};
} else {
cutText ["This Skin has already been taken!", "PLAIN DOWN"];
};
} else {
cutText [format["Currently %1 is not supported by the steal skin script.",_skin], "PLAIN DOWN"];
};