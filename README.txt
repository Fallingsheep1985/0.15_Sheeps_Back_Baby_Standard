SHEEPS EPOCH REPACK
0.15 - Sheeps Back Baby!


INSTALL GUIDE
REQUIREMENTS
AN EXISTING EPOCH 1.0.5.1 SERVER
STEAM BETA 125548
ACCESS TO SERVER PBO AND MPMISSION FOLDER

INSTALLATION
REPLACE YOUR SERVER PBO WITH THE ONE INCLUDED
REPLACE YOUR MPMISSON PBO WITH THE ONE INCLUDED(IF YOU DONT USE A MPMISSION PBO REPLACE THE MISSON FOLDER)
THAT’S IT START YOUR EPOCH SERVER AND ENJOY!
!!!!IMPORTANT!!!!
YOU HAVE TO RENAME THE PBO TO MATCH THE ONE YOU ALREADY USE!

KNOWN BUGS
1. There is some delay when going from one trader to the next trader.
2. Ground fog / Wind Dust / Snow can cause low FPS and server lag












ADMIN SETUP
(OPTIONAL)
ADD THE 2 DLLS IN THE DLL FOLDER TO YOUR ROOT DIRECTORY (SAME PLACE AS ARMAOA.EXE)
THIS ALLOWS ADMIN TOOL TO RIGHT A LOG FILE IN YOUR MPMISSIONS FOLDER

SUPER ADMINS

1. Open "admintools\AdminList.sqf"
2. Change 76561198087015545 to your UID
//Super Admins
SuperAdminList = [
"76561198087015545", // <Your In-Game Name here>
"999999999" // <S-Admin In-Game Name>
];

NORMAL ADMINS
Change 76561198087015545 to your admins UID

//Admins
AdminList = [
"76561198087015545", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
MODERATORS
//Mods
ModList = [
"76561198087015545", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];
TURN SCRIPTS ON/OFF
1. Open "scriptcontrol.sqf" and edit to your liking

true = on;
false = off;
    

WELCOME CREDITS    
1.    Open "scripts\ServerWelcomeCredits.sqf"
2.    Read the comments in the file.

SERVER WATERMARK    
1.    Open "scriptcontrol.sqf" 
2.    Find server_name = "Sheeps Epoch Repack";
3.    Change Sheeps Epoch Repack to your liking


CHANGE LOAD SCREEN    
1. To change the loading screen make a JPG image 
     make sure it is one of following resolutions 512x256, 1024x512, 2048x1024

2. Save it in pictures in the mission folder as "loadscreen.jpg"
    (overwrite the one thats there, its the repack default)

 CHANGE DEATH SCREEN    
1.To change the death screen make a PAA image, first make a JPG then open 
   it with TexView2 and saves as PAA.
   you can get TexView2 as part of BI TOOLS here .
   make sure it is one of following resolutions 512x256, 1024x512, 2048x1024

2. Save it in pictures in the mission folder as "deathscr.paa"
    (overwrite the one thats there, its the repack default)    

DEBUG MONITOR
CHANGE DEBUG MONITOR
1.    open "scripts\DebugMonitor\debug_monitor.sqf"

DEBUG MONITOR SERVER RESTART TIME
1.   open "scripts\DebugMonitor\debug_monitor.sqf"
2.  find this line (round(240-(serverTime)/60)) and change the 240 to how many minutes before restart
    EG: if you restart every 2 hours you would change 240 to 120

BATTLE EYE
1.    Replace you current BE filters with the ones included.

AI
DZAI 2.1.3 
WAI 2.1.4 
MISSIONS
DZMS 1.1
DZMSHotSpots 
SPAWN SELECT
ESS (Enhanced Spawn Select)

CUSTOM LOOT TABLES
To change loot open the following 3 files

scripts\customloot\CfgBuildingLoot.hpp
scripts\customloot\cfgLoot.hpp
scripts\customloot\CfgLootSmall.hpp

EXAMPLE 
Open scripts \custom_loot\Configs\cfgLoot.hpp
At the top of the file you will see this
trash[] = {
        {"TrashTinCan",0.5}
        ,{"TrashJackDaniels",0.05}
        ,{"ItemSodaEmpty",0.25}
        ,{"ItemTrashToiletpaper",0.1}
        ,{"ItemTrashRazor",0.1}
    };

So whats it mean?
Basically “TrashTinCan” has a 0.5 chance to spawn in the loot table trash
So if you wanted it to appear more often in trash piles increase the number

To add a new item to spawn add it like so
trash[] = {
        {"TrashTinCan",0.5}
        ,{"TrashJackDaniels",0.05}
        ,{"ItemSodaEmpty",0.25}
        ,{"ItemTrashToiletpaper",0.1}
        ,{"ItemTrashRazor",0.1}
        ,{"ItemTrashRazor",0.1} <---- New Item
    };
CREDITS
Development  
FallingSheep - Donate  
Matt L - Donate
Sgt M Everlast
SchwEde (aka Shiny sonic) - Donate
Alexlawson- www.armageddongaming.co 
Brave Sir Robin - NAPF Version
Carl
ShootingBlanks
Evangelium
Mike
Kaysio (aka J0k3r)  
Testers
BUckENbooz
Geekin
Bejasc3D 
Winter189
Kr1lle
BootCamp
Hands Of God
Trust37
WarklanTD
Draftkid
Daefera
xBowBii
Quentix
Disciple
Bitcoin
m0nk3y
Kimzer
cen
[TJ]
Dohja
dzrealkiller
Keller
Sabione
FoRcE72?
    
    
SCRIPTS 
Epoch Admin Tools 1.9.1 (NoxSicarius) 
A Plot for Life v2.23 (Rimblock)
Build Vectors v3 (strike)
Snap Pro 1.4.1 (RayMix)
Admin Fast Build
Custom Loot (Shootex)
Watermark (MadHatter05)
Welcome Credits 1.3.7 ( IT07)
Custom Loadscreen (jasonpointer)
Custom Death Screen(Jokaru)
ESS (Enhanced Spawn Select) (ebay)
Debug Monitor 
Burn Tents (soul)
Deploy Bike
Crafting
Suicide ( Grafzahl)
Buy Gems from traders
Binocular Fog (alexlawson)
Carepackage on self (MattL)
Carepackage on map (MattL)
Animated MV22 \SUV (ebay)
Sirens
Nitro (Sandbird)
Regen Blood (Schwede)
Fast Rope (=BTC= & sabbath)
CAGN (safezones)
Harvest Hemp (infiSTAR, FragZ, Shogun338)
DZGM ( Group Management) (ebay)
Drink Water (Mamu1234)
Arrest/Investigate (Inkko)
Tent Sleep Healing 1.1 (Krixes)
Zombie Bait/Bomb (Freaking Fred)
Anti Zombie emitter (Freaking Fred)
VASP 1.2 (OtterNas3)
fast trade (gr8_boi52)
Trade from vehicle + Backpack (Csus)
Door Management (Zupa)
Paint Vehicles (0verHeat)
EVR Blow Out (Sumrak-Namaslk creator, JOoPs for how to)
Elevator (Axecop)
Journal (jOoPs)
Craft In Shed (Barra81)
DZAI 2.1.3 (Buttface)
DZAI Boat Patrols (rockeumel)
WAI 2.1.4 (f3cuk)
Extra Loot Postions (General Zaroff)
Animated C130 Crashes (Gorsy)
Animated AN2 Crashes (Gorsy)
AN2 Carepackage Drops (Gorsy)
Animate Heli Crashes (Grafzahl)
DZMS 1.1 (TheVampire)
DZMSHotSpots (ekroemer)
Tow + Lift (Nightmare)
Bury Body (seaweeduk)
Cannibalism (seaweeduk)
Take Clothes 2.0 (Zabn)
Custom Hud (Cen)
Zombie Trucks
Hero perks (MattL)
Walk Amongst Dead (Sandbird)
Bank Robbery 2.9 (Darihon & Spodermayt)
Service points (Axe Cop)
JAEM (OtterNas3)
Snow (Audio Rejectz)
Ground Fog (Andrew_S90)
Advanced Alchemy Building (hogscraper)

OTHERS
The entire DAYZ EPOCH team
The entire ARMA2 team
Dean "Rocket" Hall
The entire DayZ team
The entire Open Dayz team & community!
The entire Epoch Mod Forums team & community!
