/*
	File Name: FLoot_Bandit.sqf
	File Created: 2/5/2014
	File Version: 1.0
	File Author: Foamy 
	File Last Edit Date: 2/6/2014
	File Description: FLoot Bandit Loadout Array Script

Parameters: [unitname]
[unitname] execVM "\z\addons\dayz_server\addons\FMission\FLoot\FLoot_Bandit.sqf";
*/

private ["_unitname","_lootChance","_diceRoll","_weaponrnd","_weapon","_magazine","_weaponslist","_magazinelist","_itemFood","_itemDrink","_itemMeds","_itemMisc","_itemslistFood","_itemslistDrink","_itemslistMeds","_itemslistMisc","_i"];

_unitname = _this select 0;
_lootChance = .20;
_diceRoll = random 1;

// Weapon Array
_weaponslist = ["M4A1","M16A2","M4A3_CCO_EP1","LeeEnfield","AK_47_M"];

// Magazine Array 
_magazinelist = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","10x_303","30Rnd_762x39_AK47"];

// Items Arrays
_itemslistFood = ["FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodCanUnlabeled","FoodMRE","FoodNutmix","FoodPistachio"];

_itemslistDrink = ["ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaMdew","ItemSodaOrangeSherbet","ItemSodaPepsi","ItemSodaRbull","ItemWaterbottle","ItemWaterbottleUnfilled","ItemWaterbottleUnfilled"];

_itemslistMeds = ["ItemAntibiotic","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemHeatPack","ItemMorphine","ItemPainkiller"];

_itemslistMisc = ["Skin_Bandit1_DZ","TrashJackDaniels","TrashJackDaniels","Skin_Bandit2_DZ","TrashJackDaniels","TrashJackDaniels","Skin_BanditW1_DZ","TrashJackDaniels","TrashJackDaniels","Skin_BanditW2_DZ","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","TrashJackDaniels","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","ItemSodaEmpty","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","TrashTinCan","ItemSodaEmpty","ItemTrashRazor","ItemTrashToiletpaper","TrashJackDaniels","TrashTinCan","ItemTinBar","ItemCopperBar","ItemSilverBar","ItemGoldBar","ItemTent","ItemTentDomed","ItemTentDomed2","ItemTentOld","ItemCanvas"];

_weaponrnd = floor random (count _weaponslist);
_weapon = _weaponslist select _weaponrnd;
_magazine = _magazinelist select _weaponrnd;

removeAllWeapons _unitname;
removeAllItems _unitname;

for [{_i=1},{_i<=3},{_i=_i+1}] do {
	_unitname addMagazine _magazine;
	};
	_unitname addWeapon _weapon;
	
_itemFood = _itemslistFood call BIS_fnc_selectRandom;
_unitname addMagazine _itemFood;
	
_itemDrink = _itemslistDrink call BIS_fnc_selectRandom;
_unitname addMagazine _itemDrink;
	
if (_diceRoll < _lootChance) then
{
	diag_log("FLoot: Extra Loot Chance Success");
	_itemMeds = _itemslistMeds call BIS_fnc_selectRandom;
	_unitname addMagazine _itemMeds;
	
	_itemMisc = _itemslistMisc call BIS_fnc_selectRandom;
	_unitname addMagazine _itemMisc;
	sleep 1;
}
else
{
diag_log("FLoot: Extra Loot Chance Failed");
sleep 1;
};
