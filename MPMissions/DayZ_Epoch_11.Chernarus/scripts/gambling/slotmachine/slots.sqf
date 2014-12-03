
//Variables
PlayerCredits = 0;
reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];

hasCredits = false;

fnc_add_1_credits = {
   //check if player has required item
   if ("ItemGoldBar" in magazines player) then{
     //remove cost
     player removeMagazine "ItemGoldBar";
     //add credit
     PlayerCredits = PlayerCredits + 1;
     //Update credits display
     ctrlSetText[1001, format ["%1" ,PlayerCredits]];
   }else{
     titleText ["You need 1x Goldbar to add 1 credit!","PLAIN DOWN"];
     titleFadeOut 3;
   };
};

fnc_add_10_credits = {
   //check if player has required item
   if ("ItemGoldBar10oz" in magazines player) then{
     //remove cost
     player removeMagazine "ItemGoldBar10oz";
     //add credits
     PlayerCredits = PlayerCredits + 10;
     //Update credits display
     ctrlSetText[1001, format ["%1" ,PlayerCredits]];
   }else{
     titleText ["You need 1x 10oz Goldbar to add 10 credits!","PLAIN DOWN"]; titleFadeOut 3;
   };
};

fnc_random_pictures = {
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
	reel1 = reelArray call BIS_fnc_selectRandom;
    reel2 = reelArray call BIS_fnc_selectRandom;
    reel3 = reelArray call BIS_fnc_selectRandom;
	call fnc_display_pictures;
};

fnc_spin  = {
   if (PlayerCredits <= 0) then {
     hasCredits = false;
     titleText ["You have no credits!","PLAIN DOWN"]; titleFadeOut 3;
   }else{
     hasCredits = true;
   };
   if (hasCredits) then {
     //remove credit
     PlayerCredits = PlayerCredits - 1;
     //update credits display     
     ctrlSetText[1001, format ["%1" ,PlayerCredits]];
     //randomise reels
     call fnc_random_pictures;
     //wait 5 seconds
     sleep 3;
     reel1 = reelArray call BIS_fnc_selectRandom;
     reel2 = reelArray call BIS_fnc_selectRandom;
     reel3 = reelArray call BIS_fnc_selectRandom;
     //display pictures
     call fnc_display_pictures;
     //wait
     sleep 0.2;
     //check if win or lose
     call fnc_payout;
   };
};
fnc_display_pictures = {
//reel 1
   if (reel1 == "cherry") then {
    ctrlSetText [1200, "pictures\image1.paa"];
   };
   if (reel1 == "lemon") then {
    ctrlSetText [1200, "pictures\image2.paa"];
   };
   if (reel1 == "grape") then {
    ctrlSetText [1200, "pictures\image3.paa"];
   };
   if (reel1 == "watermelon") then {
    ctrlSetText [1200, "pictures\image4.paa"];
   };
   if (reel1 == "orange") then {
    ctrlSetText [1200, "pictures\image5.paa"];
   };
   if (reel1 == "bar") then {
    ctrlSetText [1200, "pictures\image6.paa"];
   };
   if (reel1 == "seven") then {
    ctrlSetText [1200, "pictures\image7.paa"];
   };
   if (reel1 == "diamond") then {
    ctrlSetText [1200, "pictures\image8.paa"];
   };
   //reel 2
   if (reel2 == "cherry") then {
    ctrlSetText [1201,"pictures\image1.paa"];
   };
   if (reel2 == "lemon") then {
    ctrlSetText [1201,"pictures\image2.paa"];
   };
   if (reel2 == "grape") then {
    ctrlSetText [1201,"pictures\image3.paa"];
   };
   if (reel2 == "watermelon") then {
    ctrlSetText [1201,"pictures\image4.paa"];
   };
   if (reel2 == "orange") then {
    ctrlSetText [1201,"pictures\image5.paa"];
   };
   if (reel2 == "bar") then {
    ctrlSetText [1201,"pictures\image6.paa"];
   };
   if (reel2 == "seven") then {
    ctrlSetText [1201,"pictures\image7.paa"];
   };
   if (reel2 == "diamond") then {
    ctrlSetText [1201,"pictures\image8.paa"];
   };
   //reel 3
   if (reel3 == "cherry") then {
    ctrlSetText [1202,"pictures\image1.paa"];
   };
   if (reel3 == "lemon") then {
    ctrlSetText [1202,"pictures\image2.paa"];
   };
   if (reel3 == "grape") then {
    ctrlSetText [1202,"pictures\image3.paa"];
   };
   if (reel3 == "watermelon") then {
    ctrlSetText [1202,"pictures\image4.paa"];
   };
   if (reel3 == "orange") then {
    ctrlSetText [1202,"pictures\image5.paa"];
   };
   if (reel3 == "bar") then {
    ctrlSetText [1202,"pictures\image6.paa"];
   };
   if (reel3 == "seven") then {
    ctrlSetText [1202,"pictures\image7.paa"];
   };
   if (reel3 == "diamond") then {
    ctrlSetText [1202,"pictures\image8.paa"];
   };
};

fnc_payout = {
	//prizes for payout
	_prize1 = "ItemGoldBar";
	_prize2 = "ItemGoldBar10oz";
	_prize3 = "ItemBriefcase20oz";
	_prize4 = "ItemBriefcase40oz";
	_prize5 = "ItemBriefcase60oz";
	_prize6 = "ItemBriefcase80oz";
	_prize7 = "ItemBriefcase100oz";
   if ((reel1 == reel2) && (reel2 == reel3)) then {
     if (reel1 == "cherry") then {
       titleText ["You won 1 gold bar!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize1;
     };
     if (reel1 == "lemon") then {
       titleText ["You won 10oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize2;
     };
     if (reel1 == "grape") then {
       titleText ["You won 20oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize3;
     };
     if (reel1 == "watermelon") then {
       titleText ["You won 40oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize4;
     };
     if (reel1 == "orange") then {
       titleText ["You won 60oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize5;
     };
     if (reel1 == "bar") then {
       titleText ["You won 80oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize6;
     };
     if (reel1 == "seven") then {
       titleText ["Jackpot! You won 100oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize7;
     };
     if (reel1 == "diamond") then {
       PlayerCredits = PlayerCredits + 5;
       titleText ["You won 5 free credits!","PLAIN DOWN"]; titleFadeOut 3;
     };
   }else{
     titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 3;
   };
};