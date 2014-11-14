//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_80ozBet = false;
GUESSBET = "";
if ("ItemBriefcase80oz" in magazines player) then {
    _80ozBet = true;
	GUESSBET = "ItemBriefcase80oz";
} else {
    _80ozBet = false;
};
if (_80ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase80oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 80oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
execVM 
}else{
	titleText ["You need 1x 80oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};