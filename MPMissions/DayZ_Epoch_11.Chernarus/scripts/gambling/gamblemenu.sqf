_EXECscript1 = 'player execVM "scripts\gambling\numbergame\%1"';
_EXECscript2 = 'player execVM "scripts\gambling\highestnumbergame\%1"';
_EXECscript3 = 'player execVM "scripts\gambling\guessinggame\%1"';

gamblemenu = [
	["",true],
		["Choose Game", [],"", -5, [["expression", ""]], "1", "0"],
		["Match Number - Pays 3-1", [], "#USER:Match", -5, [["expression", ""]], "1", "1"],
		["Highest Number - Pays 2-1", [], "#USER:HighestNumber", -5, [["expression", ""]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"]
	];
	
Match = [
	["",true],
		["Match Number", [],"", -5, [["expression", ""]], "1", "0"],
		["Bet: 10oz", [],"", -5, [["expression", format[_EXECscript1,"10oz.sqf"]]], "1", "1"],
		["Bet: 20oz", [],"", -5, [["expression", format[_EXECscript1,"20oz.sqf"]]], "1", "1"],
		["Bet: 30oz", [],"", -5, [["expression", format[_EXECscript1,"30oz.sqf"]]], "1", "1"],
		["Bet: 40oz", [],"", -5, [["expression", format[_EXECscript1,"40oz.sqf"]]], "1", "1"],
		["Bet: 50oz", [],"", -5, [["expression", format[_EXECscript1,"50oz.sqf"]]], "1", "1"],
		["Bet: 60oz", [],"", -5, [["expression", format[_EXECscript1,"60oz.sqf"]]], "1", "1"],
		["Bet: 70oz", [],"", -5, [["expression", format[_EXECscript1,"70oz.sqf"]]], "1", "1"],
		["Bet: 80oz", [],"", -5, [["expression", format[_EXECscript1,"80oz.sqf"]]], "1", "1"],
		["Bet: 90oz", [],"", -5, [["expression", format[_EXECscript1,"90oz.sqf"]]], "1", "1"],
		["Bet: 100oz", [],"", -5, [["expression", format[_EXECscript1,"100oz.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:gamblemenu", -5, [["expression", ""]], "1", "1"]
	];
HighestNumber = [
	["",true],
		["Highest Number", [],"", -5, [["expression", ""]], "1", "0"],
		["Bet: 10oz", [],"", -5, [["expression", format[_EXECscript2,"10oz.sqf"]]], "1", "1"],
		["Bet: 20oz", [],"", -5, [["expression", format[_EXECscript2,"20oz.sqf"]]], "1", "1"],
		["Bet: 30oz", [],"", -5, [["expression", format[_EXECscript2,"30oz.sqf"]]], "1", "1"],
		["Bet: 40oz", [],"", -5, [["expression", format[_EXECscript2,"40oz.sqf"]]], "1", "1"],
		["Bet: 50oz", [],"", -5, [["expression", format[_EXECscript2,"50oz.sqf"]]], "1", "1"],
		["Bet: 60oz", [],"", -5, [["expression", format[_EXECscript2,"60oz.sqf"]]], "1", "1"],
		["Bet: 70oz", [],"", -5, [["expression", format[_EXECscript2,"70oz.sqf"]]], "1", "1"],
		["Bet: 80oz", [],"", -5, [["expression", format[_EXECscript2,"80oz.sqf"]]], "1", "1"],
		["Bet: 90oz", [],"", -5, [["expression", format[_EXECscript2,"90oz.sqf"]]], "1", "1"],
		["Bet: 100oz", [],"", -5, [["expression", format[_EXECscript2,"100oz.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:gamblemenu", -5, [["expression", ""]], "1", "1"]
	];
	
showCommandingMenu "#USER:gamblemenu";