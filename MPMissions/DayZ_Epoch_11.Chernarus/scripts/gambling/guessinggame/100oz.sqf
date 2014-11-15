//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_100ozBet = false;
GUESSBET = "";
if ("ItemBriefcase100oz" in magazines player) then {
    _100ozBet = true;
	GUESSBET = "ItemBriefcase100oz";
} else {
    _100ozBet = false;
};
if (_100ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase100oz";
sleep 0.01;
//show number choices
player execVM "scripts\gambling\guessinggame\guessmenu.sqf";
//inform player of bet amount
titleText ["You Bet 100oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
}else{
	titleText ["You need 1x 100oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};