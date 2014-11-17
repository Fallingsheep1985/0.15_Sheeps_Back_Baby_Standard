if (!isDedicated) then {
	player_build = 					compile preprocessFileLineNumbers "scripts\snap_pro\player_build.sqf";
	snap_build = 					compile preprocessFileLineNumbers "scripts\snap_pro\snap_build.sqf";
	dayz_spaceInterrupt = 			compile preprocessFileLineNumbers "fixes\dayz_spaceInterrupt.sqf";
	
	fnc_usec_damageActions =		compile preprocessFileLineNumbers "scripts\PlotForLifev2\fn_damageActions.sqf";		//Checks which actions for nearby casualty
	fnc_usec_selfActions =			compile preprocessFileLineNumbers "fixes\fn_selfActions.sqf";		//Checks which actions for self
	player_packTent =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\player_packTent.sqf";
	player_packVault =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\player_packVault.sqf";
	player_unlockVault =			compile preprocessFileLineNumbers "scripts\PlotForLifev2\player_unlockVault.sqf";
	player_removeObject =			compile preprocessFileLineNumbers "scripts\PlotForLifev2\remove.sqf";
	player_lockVault =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\player_lockVault.sqf";
	player_updateGui =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\player_updateGui.sqf";
	player_tentPitch =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\tent_pitch.sqf";
	player_vaultPitch =				compile preprocessFileLineNumbers "scripts\PlotForLifev2\vault_pitch.sqf";

	//Craft from sheds
	player_craftItem =			compile preprocessFileLineNumbers "fixes\player_craftItem.sqf";
	//Paint
	VehicleColourPaint =			compile preprocessFileLineNumbers "scripts\Paint\vehicleColourPaint.sqf";
	VehicleColourUpdate =			compile preprocessFileLineNumbers "scripts\Paint\VehicleColourUpdate.sqf";
	VehicleColourUpdate2 =			compile preprocessFileLineNumbers "scripts\Paint\VehicleColourUpdate2.sqf";
	player_paint =				compile preprocessFileLineNumbers "scripts\Paint\player_paint.sqf";
	
	player_death =               	compile preprocessFileLineNumbers "fixes\player_death.sqf";
	
	//player_switchModel = 			compile preprocessFileLineNumbers "fixes\player_switchModel.sqf";
	//player_wearClothes  = compile preprocessFileLineNumbers "fixes\player_wearClothes.sqf"; 
	player_humanityMorph =		compile preprocessFileLineNumbers "fixes\player_humanityMorph.sqf";	
	
	FillSkinList  = compile preprocessFileLineNumbers "scripts\takeskin\getList.sqf";
	ApplySkinList  = compile preprocessFileLineNumbers "scripts\takeskin\changeClothes.sqf";
	player_wearClothes  = compile preprocessFileLineNumbers "scripts\takeskin\player_wearClothes.sqf"; 
	player_switchModel  = compile preprocessFileLineNumbers "scripts\takeskin\player_switchModel.sqf";
};

//Journal
//playerstats
    horde_epeen_fnc_fill_page = compile preProcessFile "scripts\journal\playerstats\fill_page_fnc.sqf";
    horde_epeen_determine_humanity_fnc = compile preProcessFile "scripts\journal\playerstats\determine_humanity_fnc.sqf";
    horde_epeen_setText_journal_fnc = compile preProcessFile "scripts\journal\playerstats\epeen_setText_journal.sqf";
    horde_epeen_setText_humanity_fnc = compile preProcessFile "scripts\journal\playerstats\epeen_setText_humanity.sqf";
    horde_epeen_setText_stats_fnc = compile preProcessFile "scripts\journal\playerstats\epeen_setText_stats.sqf";
    horde_epeen_show_humanity_fnc = compile preProcessFile "scripts\journal\playerstats\show_humanity_fnc.sqf";

/*DoorManagement Zupa*/
DoorGetFriends 		= compile preprocessFileLineNumbers "scripts\doorManagement\doorGetFriends.sqf";
DoorNearbyHumans 	= compile preprocessFileLineNumbers "scripts\doorManagement\doorNearbyHumans.sqf";
DoorAddFriend 		= compile preprocessFileLineNumbers "scripts\doorManagement\doorAddFriend.sqf";
DoorRemoveFriend 	= compile preprocessFileLineNumbers "scripts\doorManagement\doorRemoveFriend.sqf";
player_unlockDoor       = compile preprocessFileLineNumbers "scripts\doorManagement\player_unlockDoor.sqf";
player_unlockDoorCode = compile preprocessFileLineNumbers "scripts\doorManagement\player_unlockDoorCode.sqf";
player_manageDoor       = compile preprocessFileLineNumbers "scripts\doorManagement\initDoorManagement.sqf";
player_enterCode       = compile preprocessFileLineNumbers "scripts\doorManagement\player_enterCode.sqf";
player_changeCombo = compile preprocessFileLineNumbers "scripts\doorManagement\player_changeCombo.sqf"; 
/*DoorManagement End*/
	
//VASP
// trader menu code
	if (DZE_ConfigTrader) then {
		call compile preprocessFileLineNumbers "scripts\VASP\player_traderMenuConfig.sqf";
	}else{
		call compile preprocessFileLineNumbers "scripts\VASP\player_traderMenuHive.sqf";
	};
	//Zombie Bait/Bomb
zombie_findTargetAgent =    		compile preprocessFileLineNumbers "fixes\zombie_findTargetAgent.sqf";


//Remove junk from roads
stream_locationFill = compile preprocessFileLineNumbers "fiexs\stream_locationFill.sqf";
initialized = true;