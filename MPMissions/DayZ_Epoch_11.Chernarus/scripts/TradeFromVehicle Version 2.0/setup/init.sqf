
/* TradeFromVehicle Variables.																														 */
/* Modify these variables as you see fit.                               																			 */

if ((isServer) || (isDedicated)) exitWith {diag_log "TFV, ERROR :: Tried to launch serverside where it does not belong!";};
waitUntil {!isNil "dayz_animalCheck"};

TFV_ATFV = true;   // Allow trading from vehicles?
TFV_ATFB = true;   // Allow trading from backpack?
TFV_ACC =  true;   // Allow combining currency? This attempts to sort the player's money into as few items as possible, e.g. 10 * 10oz Gold into 1 * Gold Briefcase.
TFV_WIPS =    5;   // *How many weapons can be sold per stage of trading? Each stage of trading is the length of time to perform the standard trading animation.
TFV_MIPS =    8;   // *How many magazines can be sold per stage of trading?
TFV_ATIS = true;   // Allow toolbelt items to be sold? Toolbelt items are classed as weapons and will be sold without warning when weapons are sold. Keys will ALWAYS be safe.

// * When using the "Trade All Items" action, it uses the average of TFV_MIPS and TFV_WIPS to calculate the required amount of stages.

call compile preprocessFileLineNumbers "scripts\TradeFromVehicle Version 2.0\system\functions.sqf";
call compile preprocessFileLineNumbers "scripts\TradeFromVehicle Version 2.0\system\variables.sqf";

sleep 0.5;

ExecVM "scripts\TradeFromVehicle Version 2.0\monitor.sqf";