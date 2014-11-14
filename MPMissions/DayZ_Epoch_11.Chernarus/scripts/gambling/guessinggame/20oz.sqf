//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_20ozBet = false;
GUESSBET = "";
if ("ItemBriefcase20oz" in magazines player) then {
    _20ozBet = true;
	GUESSBET = "ItemBriefcase20oz";
} else {
    _20ozBet = false;
};
if (_20ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase20oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 20oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
execVM 
}else{
	titleText ["You need 1x 20oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};