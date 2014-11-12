private["_chance"];
 
_chance = floor(random 100);
if ("ItemSandbag" in magazines player && "MortarBucket" in magazines player) then {
    hasCinderParts = true;
} else {
    hasCinderParts = false;
};
if (hasCinderParts) then {  
player playActionNow "Medic";
sleep 1;
titleText ["You are crafting some Cinder Blocks.","PLAIN DOWN"]; titleFadeOut 5;

	if (_chance > 25) then
		{
			_mypos = getposATL player;
			_dir = getdir player;
			_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
			_createCinder = createVehicle ["CinderBlocks", _mypos, [], 0, "CAN_COLLIDE"];
			_createCinder setDir _dir;
			_createCinder setposATL _mypos;

			sleep 1;
		   
			player removeMagazine "MortarBucket";
			player removeMagazine "ItemSandbag";
			sleep 0.01;
		   
			titleText ["Cinder Blocks crafted.","PLAIN DOWN"]; titleFadeOut 5;
		}
	else
		{  
			titleText ["You have made the mixture wrong and ruined it..","PLAIN DOWN"]; titleFadeOut 5;
		};
}else{
	titleText ["You need 1 x Mortar Bucket and 1x Sandbag to craft Cinder blocks!.","PLAIN DOWN"]; titleFadeOut 5;
};
