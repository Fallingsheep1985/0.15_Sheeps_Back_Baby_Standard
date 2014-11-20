
If (isServer) then{
_run = true;
while {_run} do
{
	//Sector FNG
	if (sectorfngMarker) then {
	_sectorfng = createMarker ["sectorfng", [6611.9756, 14201.991]];
	_sectorfng setMarkerText "Sector FNG";
	_sectorfng setMarkerShape "RECTANGLE";
	_sectorfng setMarkerType "Flag";
	_sectorfng setMarkerColor "ColorRed";
	_sectorfng setMarkerBrush "Solid";
	_sectorfng setMarkerSize [230, 180];
	sectorfng = _sectorfng;
	};
	//Altar Miltary Base
	if (altarmilitarybaseMarker) then {
	_altarmilitarybase = createMarker ["altarmilitarybase", [8137.84, 9180.96]];
	_altarmilitarybase setMarkerText "Altar Military Base";
	_altarmilitarybase setMarkerType "DOT";
	_altarmilitarybase setMarkerColor "ColorBlack";
	_altarmilitarybase setMarkerBrush "Solid";
	_altarmilitarybase setMarkerSize [1, 1];
	altarmilitarybase = _altarmilitarybase;
	};
	//Black Lake Castle
	if (blacklakecastlerMarker) then {
	_blacklakecastle = createMarker ["blacklakecastle", [13376.6, 12000.2]];
	_blacklakecastle setMarkerText "Black Lake Castle";
	_blacklakecastle setMarkerType "DOT";
	_blacklakecastle setMarkerColor "ColorBlack";
	_blacklakecastle setMarkerBrush "Solid";
	_blacklakecastle setMarkerSize [1, 1];
	blacklakecastle = _blacklakecastle;
	};
	//Beached Carrier
	if (beachedcarrierMarker) then {
	_beachedcarrier = createMarker ["beachedcarrier", [7469.71,2713.64]];
	_beachedcarrier setMarkerText "Beached Carrier";
	_beachedcarrier setMarkerType "DOT";
	_beachedcarrier setMarkerColor "ColorBlack";
	_beachedcarrier setMarkerBrush "Solid";
	_beachedcarrier setMarkerSize [1, 1];
	beachedcarrier = _beachedcarrier;
	};
	//CDC
	if (CDCMarker) then {
	_CDC = createMarker ["CDC", [4847.68, 2297.24]];
	_CDC setMarkerText "Centre For Disease Control";
	_CDC setMarkerType "DOT";
	_CDC setMarkerColor "ColorBlack";
	_CDC setMarkerBrush "Solid";
	_CDC setMarkerSize [1, 1];
	CDC = _CDC;
	};
	//Kamenka Mine
	if (kamenkamineMarker) then {
	_kamenkamine = createMarker ["kamenkamine", [87.26, 1599.11]];
	_kamenkamine setMarkerText "Kamenka Mine";
	_kamenkamine setMarkerType "DOT";
	_kamenkamine setMarkerColor "ColorBlack";
	_kamenkamine setMarkerBrush "Solid";
	_kamenkamine setMarkerSize [1, 1];
	kamenkamine = _kamenkamine;
	};
	//Black Forest Outpost Mine
	if (blackforestoutpostMarker) then {
	_blackforestoutpost = createMarker ["blackforestoutpost", [8565, 8085.11]];
	_blackforestoutpost setMarkerText "Black Forest Outpost";
	_blackforestoutpost setMarkerType "DOT";
	_blackforestoutpost setMarkerColor "ColorBlack";
	_blackforestoutpost setMarkerBrush "Solid";
	_blackforestoutpost setMarkerSize [1, 1];
	blackforestoutpost = _blackforestoutpost;
	};
	//Golden River Mine
	if (golden_river_mineMarker) then {
	_golden_river_mine = createMarker ["golden_river_mine", [2130.2847, 12854.148]];
	_golden_river_mine setMarkerText "Golden River Mine";
	_golden_river_mine setMarkerType "DOT";
	_golden_river_mine setMarkerColor "ColorBlack";
	_golden_river_mine setMarkerBrush "Solid";
	_golden_river_mine setMarkerSize [1, 1];
	golden_river_mine = _golden_river_mine;
	};
	//Project X
	if (projectxMarker) then {
	_projectxMarker = createMarker ["projectx", [6491.0933, 14284.572]];
	_projectxMarker setMarkerText "Casino";
	_projectxMarker setMarkerType "DOT";
	_projectxMarker setMarkerColor "ColorBlack";
	_projectxMarker setMarkerBrush "Solid";
	_projectxMarker setMarkerSize [1, 1];
	projectx = _projectxMarker;
	};
	//Oilrig
	if (oilrigMarker) then {
	_oilrigMarker = createMarker ["oilrig", [7847.895, 2424.355]];
	_oilrigMarker setMarkerText "Oil Rig";
	_oilrigMarker setMarkerType "DOT";
	_oilrigMarker setMarkerColor "ColorBlack";
	_oilrigMarker setMarkerBrush "Solid";
	_oilrigMarker setMarkerSize [1, 1];
	oilrig = _oilrigMarker;
	};
	
	//JIP fix
	sleep 25; // wait 25 seconds
	//delete markers
	deleteMarker "projectx";
	deleteMarker "golden_river_mine";
	deleteMarker "blackforestoutpost";
	deleteMarker "kamenkamine";
	deleteMarker "sectorfng";
	deleteMarker "altarmilitarybase";
	deleteMarker "blacklakecastle";
	deleteMarker "beachedcarrier";
	deleteMarker "CDC";
	deleteMarker "oilrig";
	};
};