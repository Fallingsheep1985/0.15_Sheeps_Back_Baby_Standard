//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_40ozBet = false;
GUESSBET = "";
if ("ItemBriefcase40oz" in magazines player) then {
    _40ozBet = true;
	GUESSBET = "ItemBriefcase40oz";
} else {
    _40ozBet = false;
};
if (_40ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase40oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 40oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
player execVM "scripts\gambling\guessinggame\guessmenu.sqf";
}else{
	titleText ["You need 1x 40oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};