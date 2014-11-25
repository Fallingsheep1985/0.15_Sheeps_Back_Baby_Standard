
private ["_onLadder","_canDo","_cursorTarget","_typeOfCursorTarget","_isTarget","_isTrader","_man","_pos","_pos2","_angle","_man_damag"];

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
_cursorTarget = cursorTarget;
_typeOfCursorTarget = typeOf _cursorTarget;
_isTarget = (_cursorTarget isKindOf "Man" || _cursorTarget isKindOf "Animal" || _cursorTarget isKindOf "zZombie_base");
_isTrader = _typeOfCursorTarget in ["Hooker1","Hooker2","Hooker3","Hooker4","RU_Functionary1","RU_Citizen3","Rocker4","Profiteer4","Rita_Ensler_EP1","CIV_EuroMan01_EP1","CIV_EuroMan02_EP1","TK_GUE_Soldier_5_EP1","GUE_Soldier_MG","Worker2","Worker3","Woodlander1","UN_CDF_Soldier_Pilot_EP1","RU_WorkWoman1","Dr_Annie_Baker_EP1","RU_Citizen4","RU_WorkWoman5","RU_Citizen1","RU_Villager3","TK_CIV_Takistani04_EP1","Pilot_EP1","RU_Profiteer4","Woodlander3","Dr_Hladik_EP1","Doctor","HouseWife1","GUE_Woodlander2"];


_man = nearestObjects [ player , ["Man"], 2];

_pos = getpos player;
_pos2 = getpos _isTarget;
_angle =(((_pos2 select 0) - (_pos select 0)) atan2 ((_pos2 select 1)-(_pos select 1)));
player setdir _angle;

sleep 0.001;
if ( _isTarget && _canDo && !_isTrader && (player distance cursorTarget < 3) then {
	if (primaryWeapon player == "" && secondaryWeapon player == "") then {
		player switchmove "AmelPercMstpSnonWnonDnon_amaterUder3";
		sleep 1;
		_man_damag = getdammage _man;
		_man_damag = _man_damag + 0.6;
			if (getdammage _man < 0.5) then {
				_man switchmove "AmelPercMstpSnonWnonDnon_zasah6hlava";
				 // playSound "Sound1" //play punch sound
				_man setdamage _man_damag;
				_man dotarget player;
				_man dofire player;
				sleep 2.2;
			};
	}else{
		player switchmove "AmelPercMstpSlowWrflDnon_StrokeGun";
		sleep 1;
		_man_damag = getdammage _man;
		_man_damag = _man_damag + 0.6;
			if (getdammage _man < 0.5) then {
				_man switchmove "AmelPercMstpSnonWnonDnon_zasah6hlava";
				 // playSound "Sound1" //play punch sound
				_man setdamage _man_damag;
				_man dotarget player;
				_man dofire player;
				sleep 2.2;
			};
	};
};
