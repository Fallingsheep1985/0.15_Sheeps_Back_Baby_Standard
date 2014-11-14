//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_10ozBet = false;
GUESSBET = "";
if ("ItemBriefcase10oz" in magazines player) then {
    _10ozBet = true;
	GUESSBET = "ItemBriefcase10oz";
} else {
    _10ozBet = false;
};
if (_10ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase10oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 10oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
//bring up guess menu
player execVM "scripts\gambling\guessmenu.sqf";
}else{
	titleText ["You need 1x 10oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};
