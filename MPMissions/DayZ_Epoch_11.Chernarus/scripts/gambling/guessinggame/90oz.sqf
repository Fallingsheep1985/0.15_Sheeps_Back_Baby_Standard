//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];
_90ozBet = false;
GUESSBET = "";
if ("ItemBriefcase90oz" in magazines player) then {
    _90ozBet = true;
	GUESSBET = "ItemBriefcase90oz";
} else {
    _90ozBet = false;
};
if (_90ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase90oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 90oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
player execVM "scripts\gambling\guessinggame\guessmenu.sqf";
}else{
	titleText ["You need 1x 90oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};