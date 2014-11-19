_credits = 0;
_spins = _credits;

if (_spins <= 0 ) then {
	//message no more spins
	sleep 3;
	exitWith{};
};

fnc_add_credit = {
	//add 1 credit
	_credits = _credits + 1;
	_spins = _credits;
};

fnc_spin_reels = {
	_reel1 = _reelArray call BIS_fnc_selectRandom;
	_reel2 = _reelArray call BIS_fnc_selectRandom;
	_reel3 = _reelArray call BIS_fnc_selectRandom;
	// REMOVE 1 CREDIT
	_credits = _credits - 1;
};

//Prizes
_prize1 = "ItemGoldBar";
_prize2 = "ItemGoldBar10oz";
_prize3 = "ItemBriefcase20oz";
_prize4 = "ItemBriefcase30oz";
_prize5 = "ItemBriefcase40oz";
_prize6 = "ItemBriefcase50oz";
_prize7 = "ItemBriefcase60oz";
_prize8 = "ItemBriefcase70oz";
_prize9 = "ItemBriefcase80oz";
_prize10 = "ItemBriefcase90oz";
_prize11 = "ItemBriefcase100oz";

//possible symbols
_reelArray =["cherry","lemon","grapes","plum","watermelon","orange","bar","bell","seven","diamond"];

// 2 match
if (((_reel1 == _reel2) && !(_reel2 == _reel3)) || ((_reel2 == _reel3) && !(_reel1 == _reel2))) then {
	 if (_reel1 = "cheery") then{

	 };
	 if (_reel1 = "lemon") then{

	 };
	 if (_reel1 = "grapes") then{

	 };
	 if (_reel1 = "plum") then{

	 };
	 if (_reel1 = "watermelon") then{

	 };
	 if (_reel1 = "orange") then{

	 };
	 if (_reel1 = "bar") then{
;
	 };
	 if (_reel1 = "bell") then{

	 };
	 if (_reel1 = "seven") then{

	 };
	 if (_reel1 = "diamond") then{
		//FREE SPINS 
	 };
};

//all 3 match
if ((_reel1 == _reel2) && (_reel == _reel3))then {
	if (_reel1 = "cheery") then{
	
	};
	if (_reel1 = "lemon") then{
	
	};
	if (_reel1 = "grapes") then{
	
	};
	if (_reel1 = "plum") then{
	
	};
	if (_reel1 = "watermelon") then{
	
	};
	if (_reel1 = "orange") then{
	
	};
	if (_reel1 = "bar") then{
	
	};
	if (_reel1 = "bell") then{
	
	};
	if (_reel1 = "seven") then{
	
	};
	if (_reel1 = "diamond") then{
		//FREE SPINS 
	};
};