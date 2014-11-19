
//Variables
_credits = 0;
_reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];
//prizes for payout
_prize1 = "ItemGoldBar";
_prize2 = "ItemGoldBar10oz";
_prize3 = "ItemBriefcase20oz";
_prize4 = "ItemBriefcase40oz";
_prize5 = "ItemBriefcase60oz";
_prize6 = "ItemBriefcase80oz";
_prize7 = "ItemBriefcase100oz";

fnc_add_3_credits {
	//check if player has required item
	if ("ItemGoldBar" in magazines player) then{
		//remove cost
		player removeMagazine "ItemGoldBar";
		//add credit
		_credits = _credits + 3;
	}else{
		titleText ["You need 1x Goldbar to add a credits!","PLAIN DOWN"]; titleFadeOut 3;
	};
};

fnc_add_30_credits {
	//check if player has required item
	if ("ItemGoldBar10oz" in magazines player) then{
		//remove cost
		player removeMagazine "ItemGoldBar10oz";
		//add credits
		_credits = _credits + 30;
	}else{
		titleText ["You need 1x 10oz Goldbar to add 30 credits!","PLAIN DOWN"]; titleFadeOut 3;
	};
};
fnc_check_credits {
	if (_credits <= 0) then {
		titleText ["You have no credits!","PLAIN DOWN"]; titleFadeOut 3;
	};
};

fnc_spin {
	//remove credit
	_credits = _credits - 1;
	//randomise reels
	_reel1 = _reelArray call BIS_fnc_selectRandom;
	_reel1 = _reelArray call BIS_fnc_selectRandom;
	_reel1 = _reelArray call BIS_fnc_selectRandom;
	//check if win or lose
	call fnc_payout;
};


fnc_payout {
	if ((_reel1 = _reel2) && (_reel2 = _reel3)) then {
		if (_reel1 = "cherry") then {
			titleText ["You won 1 gold bar!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize1;
		};
		if (_reel1 = "lemon") then {
			titleText ["You won 10oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize2;
		};
		if (_reel1 = "grape") then {
			titleText ["You won 20oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize3;
		};
		if (_reel1 = "watermelon") then {
			titleText ["You won 40oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize4;
		};
		if (_reel1 = "orange") then {
			titleText ["You won 60oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize5;
		};
		if (_reel1 = "bar") then {
			titleText ["You won 80oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize6;
		};
		if (_reel1 = "seven") then {
			titleText ["Jackpot! You won 100oz gold!","PLAIN DOWN"]; titleFadeOut 3;
			player addMagazine _prize7;
		};
		if (_reel1 = "diamond") then {
			_credits = _credits + 5;
			titleText ["You won 5 free spins!","PLAIN DOWN"]; titleFadeOut 3;
		};
	}else{
		titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 3;
	};
};
