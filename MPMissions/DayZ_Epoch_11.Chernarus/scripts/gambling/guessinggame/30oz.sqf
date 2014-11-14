//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_30ozBet = false;
GUESSBET = "";
if ("ItemBriefcase30oz" in magazines player) then {
    _30ozBet = true;
	GUESSBET = "ItemBriefcase30oz";
} else {
    _30ozBet = false;
};
if (_30ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase30oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 30oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
execVM 
}else{
	titleText ["You need 1x 30oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};