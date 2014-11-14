//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_70ozBet = false;
GUESSBET = "";
if ("ItemBriefcase70oz" in magazines player) then {
    _70ozBet = true;
	GUESSBET = "ItemBriefcase70oz";
} else {
    _70ozBet = false;
};
if (_70ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase70oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 70oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
execVM 
}else{
	titleText ["You need 1x 70oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};