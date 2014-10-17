//Script Control - Allows you to customize the repack by turning certain scripts on or off - true = on /false = off

// DayZ Epoch config
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
spawnShoremode = 0;
spawnArea= 1500; // Default = 1500

MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 

dayz_fullMoonNights = true;

dayz_spawnselection = 0;
dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = true; // Default: False

DZE_requireplot = 1;
DZE_teleport = [14000,14000,14000,14000,14000];
DZE_StaticConstructionCount = 1;
DZE_FriendlySaving = true;
DZE_TRADER_SPAWNMODE = false;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgTitleText = true;
DZE_DeathMsgSide = true;
DZE_BackpackGuard = false; //Default = true, true to enable, false to disable - wipes backpack on combat/ALT+F4 logging
DZE_ForceNameTagsOff = false;
DZE_R3F_WEIGHT = false; //use weight system
DZE_PlotPole = [100,115];	
DZE_BuildingLimit = 400;//how many items can a player build
DZE_PlayerZed = false; // should players have chance of becoming a ZOMBIE when they respawn after death
DZE_LootSpawnTimer = 10;// in minutes
DZE_MissionLootTable = true; //Custom Loot Tables
DZE_ConfigTrader = true;//Config based traders
DZE_selfTransfuse = true; //Self blood bag
DZE_selfTransfuse_Values = [
6000, //Blood amount
 10,  // Chance of Infection
300 //Cooldown Timer
];

DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Admin Build (Add all SuperAdmins/Admins)
WG_adminBuild = [
"11111111111",
"76561198087015545"
];
//Super Admins
SuperAdminList = [
"111111111", // <Your In-Game Name here>
"76561198087015545" // <S-Admin In-Game Name>
];
//Admins
AdminList = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
//Mods
ModList = [
"999999999", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];

//set adminlist to be all admins
AdminList = AdminList + SuperAdminList; // DONT CHANGE!!!

//////////////////////SCRIPTS////////////////////
//Server watermark
WaterMarkScript = true; //Watermark on/off
server_name = "0.15 - Sheeps Back Baby!"; //Watermark Text

//Welcome Credits
ServerWelcomeCreditsScript = true;
//Admin Tools
AdmintoolsScript = true;
//Debug Monitor
DebugMonitorScript = true;
//deploy Bike
DeployBikeScript = true;
//Burn Tents
BurnTentsScript = true;
//Crafting
craftingScript = true;
//Suicide
SuicideScript = true;
//Binocular Fog
BinocularScript = true;
//Carepackage on self
carepackageSELFScript = true;
//Carepackage on map
carepackageMAPScript = true;
//Sirens
SirenScript = true;
//Animate MV22 wings
AnimateMV22script = true;
//Animate SUV Hatch
AnimateSUVscript = true;
//Nitro
NOSScript = true;
//Regen Blood
RegenBloodScript = true;
//Fast Rope
FastropeScript = true;
//Safezones
SafezoneScripts = true;
//Harvest Hemp
HarvestHempScript = true;
//DZGM (Group Management)
DZGMScript = true;
//Drink Water
DrinkWaterScript = true;
//Tent Sleep Healing
TentHealScript = true;
//Arrest
ArrestScript = true;
//Trade from Vehicles
TradeFromVehicleScript = true;
