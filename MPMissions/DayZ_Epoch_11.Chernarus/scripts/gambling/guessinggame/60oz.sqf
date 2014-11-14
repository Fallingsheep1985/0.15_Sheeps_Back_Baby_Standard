//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_60ozBet = false;
GUESSBET = "";
if ("ItemBriefcase60oz" in magazines player) then {
    _60ozBet = true;
	GUESSBET = "ItemBriefcase60oz";
} else {
    _60ozBet = false;
};
if (_60ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase60oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 60oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
execVM 
}else{
	titleText ["You need 1x 60oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};