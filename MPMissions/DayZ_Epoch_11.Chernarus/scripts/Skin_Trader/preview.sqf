private ["_oldskin"];

// by Boyd
if(not local player) exitWith{};
#include "config.sqf"
#include "dialog\definitions.sqf"
disableSerialization;

_display = findDisplay SKINS_DIALOG;
_listbox = _display displayCtrl SKINS_UNITLIST;
_sel = lbCurSel _listbox; if(_sel < 0) exitWith{};

_unittype = Men_Clothing select _sel;
_typename = lbtext [SKINS_UNITLIST,_sel];

_oldskin = player;
_hasGPS = false;
_hasCompass = false;
_hasRadio = false;
_hasWatch = false;
_hasMap = false;

if (!isNull (unitBackpack player)) then {
	
			cutText ["You cannot change your Skin while wearing a backpack", "PLAIN"];
				}else{
					cutText ["You have 10 seconds to choose.", "PLAIN"];
					
			[dayz_playerUID,dayz_characterID,_unittype] spawn player_humanityMorph;
			sleep 1;
			vehicle player switchCamera 'EXTERNAL';
			sleep 10;
			
			[dayz_playerUID,dayz_characterID,_oldskin] spawn player_humanityMorph;
			vehicle player switchCamera 'EXTERNAL';
			sleep 0.1;
			createDialog "RecruitUnitsDialogS";
			
			};