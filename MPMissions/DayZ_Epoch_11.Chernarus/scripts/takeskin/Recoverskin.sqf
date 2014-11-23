//MattL and Zabns code merged/edited by fallingsheep
private ["_pos","_box","_skin","_okSkin","_result"];

if (!isNil "DZE_ActionInProgress") then { // check if this is dayz epoch
if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.
};

_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["You can't perform this action while on a ladder!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not take clothes while in a vehicle", "PLAIN DOWN"]};

player removeAction s_clothes;
s_clothes = -1;

_body = _this select 3;
_playerbody =		player;
_skin = (typeOf _playerbody);
_skin = "Skin_" + _skin;
_okSkin = isClass (configFile >> "CfgMagazines" >> _skin);
_clothesTaken = _body getVariable["clothesTaken",false];

if(!_clothesTaken) then {
	if (_okSkin) then {
	sleep 0.5;
	_body setVariable["clothesTaken",true,true];
	 _result = [player,_skin] call BIS_fnc_invAdd;
		if (_result) then {
		
		} else {
			_bp = unitBackpack player;
			_bp addMagazineCargoGlobal [_skin,1];	
		};
	}else{
	cutText [format["Currently %1 is not supported by the steal skin script.",_skin], "PLAIN DOWN"];
	};
}else{
	cutText ["This Skin has already been taken!", "PLAIN DOWN"];
};






