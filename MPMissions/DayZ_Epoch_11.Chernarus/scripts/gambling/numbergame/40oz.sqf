//Sheeps random number game
Private["_randomnumber","_result","_number","_win"];

if ("ItemBriefcase40oz" in magazines player) then {
    40ozBet = true;
} else {
    40ozBet = false;
};
if (40ozBet) then {  

//remove bet
player removeMagazine "ItemBriefcase40oz";
sleep 0.01;
//inform player of bet amount
titleText ["You Bet 40oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;

//house rolled
_randomnumber = random 40; 
//players rolled
_number = random 40;
//round off numbers
_result1 = round _randomnumber;
_result2 = round _number;

//alert player of house roll
cutText [format["\n House Rolled: %1", _result1],"PLAIN DOWN"];
systemChat format ["House Rolled: %1", _result1];
//wait before showing player roll
sleep 1;
//alert player of house roll
cutText [format["\n You Rolled: %1", _result2],"PLAIN DOWN"];
systemChat format ["You Rolled: %1", _result2];
sleep 1;
//check if numbers match
if (_result1 == _result2)then{
	_win = true;
	//alert player they have won
titleText ["You won 2x 40oz briefcase.","PLAIN DOWN"]; titleFadeOut 5;
}else{
	_win = false;
	//alert player they have lost
titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 5;
};
//Pay player if they win
if(_win)then{
player addMagazine "ItemBriefcase40oz";
player addMagazine "ItemBriefcase40oz";
};
}else{
	titleText ["You need 1x 40oz briefcase to place this bet!","PLAIN DOWN"]; titleFadeOut 5;
};
