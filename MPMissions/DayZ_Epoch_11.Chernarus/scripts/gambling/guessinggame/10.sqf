private["_guessbet"];
_guess = 10;
sleep 2;
cutText [format["\n The number was %1", HouseGuess],"PLAIN DOWN"];
systemChat format ["The number was %1", HouseGuess];
sleep 1;
if (_guess == HouseGuess)then{
	cutText [format["\n You win 2x %1 !", GUESSBET],"PLAIN DOWN"];
systemChat format ["You win 2x %1 !", GUESSBET];
	player addMagazine GUESSBET;
	player addMagazine GUESSBET;
}else{
	titleText ["You lost","PLAIN DOWN"]; titleFadeOut 5;
};
//reset bet
GUESSBET = "";