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
DZE_CLICK_ACTIONS = [
	["ItemToolbox","Deploy Bike","[] execVM 'scripts\spawnbike\deploy_init.sqf';","true"],
		["ItemMachete","Clear Grass","[] execVM 'scripts\crafting\clearbrush.sqf';","true"],
	["ItemKnife","Make Arrows","[] execVM 'scripts\crafting\makearrow.sqf';","true"],
	["ItemKnife","Make Bandage","[] execVM 'scripts\crafting\makebandage.sqf';","true"],
	["ItemToolbox","Make Knife","[] execVM 'scripts\crafting\makeknife.sqf';","true"],
	["ItemToolbox","Make Bow","[] execVM 'scripts\crafting\makebow.sqf';","true"],
	["ItemToolbox","Make Hatchet","[] execVM 'scripts\crafting\makehatchet.sqf';","true"]
];                                               