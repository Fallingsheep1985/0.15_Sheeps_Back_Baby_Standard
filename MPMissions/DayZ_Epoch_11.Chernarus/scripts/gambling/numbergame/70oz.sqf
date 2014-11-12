//Sheeps random number game
Private["_randomnumber","_result","_number","_bet","_win"];
//variables
GearAdd = (vehicle player);
_bet = "ItemBriefcase70oz";
_win = false;

//remove bet
GearAdd removeMagazine _bet;

//inform player of bet amount
cutText [format["\n You have Bet: %1", _bet],"PLAIN DOWN"];
systemChat format ["You have Bet: %1", _bet];

//house rolled
_randomnumber = random 70; 
//players rolled
_number = random 70;
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

//check if numbers match
if (_result1 == _result2)then{
	_win = true;
	//alert player they have won
	cutText [format["\n Congratulations! You won: 2x %1", _bet],"PLAIN DOWN"];
	systemChat format ["CongratulationsYou won: 2x %1", _bet];
}else{
	_win = false;
	//alert player they have lost
	cutText [format["\n Bad luck, You lost: %1 !", _bet],"PLAIN DOWN"];
	systemChat format ["Bad luck, You lost: %1", _bet];
};
//Pay player if they win
if(_win)then{
GearAdd addMagazine _bet;
GearAdd addMagazine _bet;
};
