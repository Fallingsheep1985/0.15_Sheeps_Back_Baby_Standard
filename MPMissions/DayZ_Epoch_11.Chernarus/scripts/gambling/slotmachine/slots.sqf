
//Variables
_credits = 0;
_reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];
//prizes for payout
_prize1 = "ItemGoldBar";
_prize2 = "ItemGoldBar10oz";
_prize3 = "ItemBriefcase20oz";
_prize4 = "ItemBriefcase40oz";
_prize5 = "ItemBriefcase60oz";
_prize6 = "ItemBriefcase80oz";
_prize7 = "ItemBriefcase100oz";
hasCredits = false;

fnc_add_1_credits = {
   //check if player has required item
   if ("ItemGoldBar" in magazines player) then{
     //remove cost
     player removeMagazine "ItemGoldBar";
     //add credit
     _credits = _credits + 1;
     //Update credits display
     ctrlSetText[1000, format ["%1" ,_credits]];
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
     _credits = _credits + 10;
     //Update credits display
     ctrlSetText[1000, format ["%1" ,_credits]];
   }else{
     titleText ["You need 1x 10oz Goldbar to add 10 credits!","PLAIN DOWN"]; titleFadeOut 3;
   };
};

fnc_check_credits = {
   if (_credits <= 0) then {
     hasCredits = false;
     titleText ["You have no credits!","PLAIN DOWN"]; titleFadeOut 3;
   }else{
     hasCredits = true;
   };
};

fnc_random_pictures = {

// "cherry","lemon","grape","watermelon","orange","bar","seven","diamond"
//reel1
 ctrlSetText [1200, "pictures\image1.paa"];
 ctrlSetText [1201, "pictures\image5.paa"];
 ctrlSetText [1202, "pictures\image8.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image2.paa"];
 ctrlSetText [1201, "pictures\image6.paa"];
 ctrlSetText [1202, "pictures\image7.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image3.paa"];
 ctrlSetText [1201, "pictures\image7.paa"];
 ctrlSetText [1202, "pictures\image6.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image4.paa"];
 ctrlSetText [1201, "pictures\image8.paa"];
 ctrlSetText [1202, "pictures\image5.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image5.paa"];
 ctrlSetText [1201, "pictures\image1.paa"];
 ctrlSetText [1202, "pictures\image4.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image6.paa"];
 ctrlSetText [1201, "pictures\image2.paa"];
 ctrlSetText [1202, "pictures\image3.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image7.paa"];
 ctrlSetText [1201, "pictures\image3.paa"];
 ctrlSetText [1202, "pictures\image2.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image8.paa"];
 ctrlSetText [1201, "pictures\image4.paa"];
 ctrlSetText [1202, "pictures\image1.paa"]; 
	sleep 0.1;
 ctrlSetText [1200, "pictures\image6.paa"];
 ctrlSetText [1201, "pictures\image2.paa"];
 ctrlSetText [1202, "pictures\image3.paa"];
 	sleep 0.1;
 ctrlSetText [1200, "pictures\image2.paa"];
 ctrlSetText [1201, "pictures\image6.paa"];
 ctrlSetText [1202, "pictures\image7.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image5.paa"];
 ctrlSetText [1201, "pictures\image1.paa"];
 ctrlSetText [1202, "pictures\image4.paa"];
 	sleep 0.1;
 ctrlSetText [1200, "pictures\image4.paa"];
 ctrlSetText [1201, "pictures\image8.paa"];
 ctrlSetText [1202, "pictures\image5.paa"];
  ctrlSetText [1200, "pictures\image1.paa"];
 ctrlSetText [1201, "pictures\image5.paa"];
 ctrlSetText [1202, "pictures\image8.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image2.paa"];
 ctrlSetText [1201, "pictures\image6.paa"];
 ctrlSetText [1202, "pictures\image7.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image3.paa"];
 ctrlSetText [1201, "pictures\image7.paa"];
 ctrlSetText [1202, "pictures\image6.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image4.paa"];
 ctrlSetText [1201, "pictures\image8.paa"];
 ctrlSetText [1202, "pictures\image5.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image5.paa"];
 ctrlSetText [1201, "pictures\image1.paa"];
 ctrlSetText [1202, "pictures\image4.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image6.paa"];
 ctrlSetText [1201, "pictures\image2.paa"];
 ctrlSetText [1202, "pictures\image3.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image7.paa"];
 ctrlSetText [1201, "pictures\image3.paa"];
 ctrlSetText [1202, "pictures\image2.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image8.paa"];
 ctrlSetText [1201, "pictures\image4.paa"];
 ctrlSetText [1202, "pictures\image1.paa"]; 
	sleep 0.1;
 ctrlSetText [1200, "pictures\image6.paa"];
 ctrlSetText [1201, "pictures\image2.paa"];
 ctrlSetText [1202, "pictures\image3.paa"];
 	sleep 0.1;
 ctrlSetText [1200, "pictures\image2.paa"];
 ctrlSetText [1201, "pictures\image6.paa"];
 ctrlSetText [1202, "pictures\image7.paa"];
	sleep 0.1;
 ctrlSetText [1200, "pictures\image5.paa"];
 ctrlSetText [1201, "pictures\image1.paa"];
 ctrlSetText [1202, "pictures\image4.paa"];
 	sleep 0.1;
 ctrlSetText [1200, "pictures\image4.paa"];
 ctrlSetText [1201, "pictures\image8.paa"];
 ctrlSetText [1202, "pictures\image5.paa"];
};

fnc_spin  = {
   call fnc_check_credits;
   sleep 0.1;
   if (hasCredits) then {
     //remove credit
     _credits = _credits - 1;
     //update credits display     
     ctrlSetText[1000, format ["%1" ,_credits]];
     //randomise reels
     call fnc_random_pictures;
     //wait 5 seconds
     sleep 5;
     _reel1 = _reelArray call BIS_fnc_selectRandom;
     _reel2 = _reelArray call BIS_fnc_selectRandom;
     _reel3 = _reelArray call BIS_fnc_selectRandom;
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
   if (_reel1 == "cherry") then {
    ctrlSetText [1200, "pictures\image1.paa"];
   };
   if (_reel1 == "lemon") then {
    ctrlSetText [1200, "pictures\image2.paa"];
   };
   if (_reel1 == "grape") then {
    ctrlSetText [1200, "pictures\image3.paa"];
   };
   if (_reel1 == "watermelon") then {
    ctrlSetText [1200, "pictures\image4.paa"];
   };
   if (_reel1 == "orange") then {
    ctrlSetText [1200, "pictures\image5.paa"];
   };
   if (_reel1 == "bar") then {
    ctrlSetText [1200, "pictures\image6.paa"];
   };
   if (_reel1 == "seven") then {
    ctrlSetText [1200, "pictures\image7.paa"];
   };
   if (_reel1 == "diamond") then {
    ctrlSetText [1200, "pictures\image8.paa"];
   };
   //reel 2
   if (_reel2 == "cherry") then {
    ctrlSetText [1201,"pictures\image1.paa"];
   };
   if (_reel2 == "lemon") then {
    ctrlSetText [1201,"pictures\image2.paa"];
   };
   if (_reel2 == "grape") then {
    ctrlSetText [1201,"pictures\image3.paa"];
   };
   if (_reel2 == "watermelon") then {
    ctrlSetText [1201,"pictures\image4.paa"];
   };
   if (_reel2 == "orange") then {
    ctrlSetText [1201,"pictures\image5.paa"];
   };
   if (_reel2 == "bar") then {
    ctrlSetText [1201,"pictures\image6.paa"];
   };
   if (_reel2 == "seven") then {
    ctrlSetText [1201,"pictures\image7.paa"];
   };
   if (_reel2 == "diamond") then {
    ctrlSetText [1201,"pictures\image8.paa"];
   };
   //reel 3
   if (_reel3 == "cherry") then {
    ctrlSetText [1202,"pictures\image1.paa"];
   };
   if (_reel3 == "lemon") then {
    ctrlSetText [1202,"pictures\image2.paa"];
   };
   if (_reel3 == "grape") then {
    ctrlSetText [1202,"pictures\image3.paa"];
   };
   if (_reel3 == "watermelon") then {
    ctrlSetText [1202,"pictures\image4.paa"];
   };
   if (_reel3 == "orange") then {
    ctrlSetText [1202,"pictures\image5.paa"];
   };
   if (_reel3 == "bar") then {
    ctrlSetText [1202,"pictures\image6.paa"];
   };
   if (_reel3 == "seven") then {
    ctrlSetText [1202,"pictures\image7.paa"];
   };
   if (_reel3 == "diamond") then {
    ctrlSetText [1202,"pictures\image8.paa"];
   };
};

fnc_payout = {
   if ((_reel1 == _reel2) && (_reel2 == _reel3)) then {
     if (_reel1 == "cherry") then {
       titleText ["You won 1 gold bar!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize1;
     };
     if (_reel1 == "lemon") then {
       titleText ["You won 10oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize2;
     };
     if (_reel1 == "grape") then {
       titleText ["You won 20oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize3;
     };
     if (_reel1 == "watermelon") then {
       titleText ["You won 40oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize4;
     };
     if (_reel1 == "orange") then {
       titleText ["You won 60oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize5;
     };
     if (_reel1 == "bar") then {
       titleText ["You won 80oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize6;
     };
     if (_reel1 == "seven") then {
       titleText ["Jackpot! You won 100oz gold!","PLAIN DOWN"]; titleFadeOut 3;
       player addMagazine _prize7;
     };
     if (_reel1 == "diamond") then {
       _credits = _credits + 5;
       titleText ["You won 5 free credits!","PLAIN DOWN"]; titleFadeOut 3;
     };
   }else{
     titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 3;
   };
};