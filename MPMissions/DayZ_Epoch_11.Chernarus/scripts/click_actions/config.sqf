//  DZE_CLICK_ACTIONS
//      This is where you register your right-click actions
//  FORMAT -- (no comma after last array entry)
//      [_classname,_text,_execute,_condition],
//  PARAMETERS
//  _classname  : the name of the class to click on 
//                  (example = "ItemBloodbag")
//  _text       : the text for the option that is displayed when right clicking on the item 
//                  (example = "Self Transfuse")
//  _execute    : compiled code to execute when the option is selected 
//                  (example = "execVM 'my\scripts\self_transfuse.sqf';")
//  _condition  : compiled code evaluated to determine whether or not the option is displayed
//                  (example = {true})
//  EXAMPLE -- see below for some simple examples
If(DeployBikeScript)then{
	DEPLOY_BIKE = [
		["ItemToolbox","Deploy Bike","[] execVM 'scripts\spawnbike\deploy_init.sqf';","true"]
	];
} else {
	DEPLOY_BIKE = [];
};
If(craftingScript)then{
	CRAFTING = [
		["ItemMachete","Clear Grass","[] execVM 'scripts\crafting\clearbrush.sqf';","true"],
		["ItemKnife","Make Arrows","[] execVM 'scripts\crafting\makearrow.sqf';","true"],
		["ItemKnife","Make Bandage","[] execVM 'scripts\crafting\makebandage.sqf';","true"],
		["ItemToolbox","Make Knife","[] execVM 'scripts\crafting\makeknife.sqf';","true"],
		["ItemToolbox","Make Bow","[] execVM 'scripts\crafting\makebow.sqf';","true"],
		["ItemToolbox","Make Hatchet","[] execVM 'scripts\crafting\makehatchet.sqf';","true"]
	];
} else {
	CRAFTING = [];
};
If(SuicideScript)then{
SUICIDE = [
	["glock17_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["M9","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["M9SD","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["Makarov","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["MakarovSD","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["revolver_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["UZI_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["SA61_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
	["Colt1911_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"]
];
} else {
	SUICIDE = [];
};

DZE_CLICK_ACTIONS = DEPLOY_BIKE + CRAFTING + SUICIDE;