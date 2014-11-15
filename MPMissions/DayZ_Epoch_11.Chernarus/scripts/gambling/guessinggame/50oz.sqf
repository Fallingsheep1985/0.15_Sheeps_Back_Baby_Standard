//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_50ozBet = false;
GUESSBET = "";
if ("ItemBriefcase50oz" in magazines player) then {
    _50ozBet = true;
	GUESSBET = "ItemBriefcase50oz";
} else {
    _50ozBet = false;
};
if (_50ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase50oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 50oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
player execVM "scripts\gambling\guessinggame\guessmenu.sqf"; 
}else{
	titleText ["You need 1x 50oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};