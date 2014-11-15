_EXECscript3 = 'player execVM "scripts\gambling\guessinggame\%1"';

Guess = [
	["",true],
		["Pick A Number", [],"", -5, [["expression", ""]], "1", "0"],
		["1", [],"", -5, [["expression", format[_EXECscript3,"1.sqf"]]], "1", "1"],
		["2", [],"", -5, [["expression", format[_EXECscript3,"2.sqf"]]], "1", "1"],
		["3", [],"", -5, [["expression", format[_EXECscript3,"3.sqf"]]], "1", "1"],
		["4", [],"", -5, [["expression", format[_EXECscript3,"4.sqf"]]], "1", "1"],
		["5", [],"", -5, [["expression", format[_EXECscript3,"5.sqf"]]], "1", "1"],
		["6", [],"", -5, [["expression", format[_EXECscript3,"6.sqf"]]], "1", "1"],
		["7", [],"", -5, [["expression", format[_EXECscript3,"7.sqf"]]], "1", "1"],
		["8", [],"", -5, [["expression", format[_EXECscript3,"8.sqf"]]], "1", "1"],
		["9", [],"", -5, [["expression", format[_EXECscript3,"9.sqf"]]], "1", "1"],
		["1", [],"", -5, [["expression", format[_EXECscript3,"10.sqf"]]], "1", "1"]
	];

HouseGuess = round((random 9) +1);
	
showCommandingMenu "#USER:gamblemenu";