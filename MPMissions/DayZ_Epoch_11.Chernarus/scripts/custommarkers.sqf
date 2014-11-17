
If (isServer) then{
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
	_altarmilitarybase setMarkerType "mil_dot";
	_altarmilitarybase setMarkerColor "ColorBlack";
	_altarmilitarybase setMarkerBrush "Solid";
	_altarmilitarybase setMarkerSize [10, 10];
	altarmilitarybase = _altarmilitarybase;
	};
	//Black Lake Castle
	if (blacklakecastlerMarker) then {
	_blacklakecastle = createMarker ["blacklakecastle", [13376.6, 12000.2]];
	_blacklakecastle setMarkerText "Black Lake Castle";
	_blacklakecastle setMarkerType "mil_dot";
	_blacklakecastle setMarkerColor "ColorBlack";
	_blacklakecastle setMarkerBrush "Solid";
	_blacklakecastle setMarkerSize [10, 10];
	blacklakecastle = _blacklakecastle;
	};
	//Beached Carrier
	if (beachedcarrierMarker) then {
	_beachedcarrier = createMarker ["beachedcarrier", [8137.84, 9180.96]];
	_beachedcarrier setMarkerText "Beached Carrier";
	_beachedcarrier setMarkerType "mil_dot";
	_beachedcarrier setMarkerColor "ColorBlack";
	_beachedcarrier setMarkerBrush "Solid";
	_beachedcarrier setMarkerSize [10, 10];
	beachedcarrier = _beachedcarrier;
	};
	//CDC
	if (CDCMarker) then {
	_CDC = createMarker ["CDC", [4847.68, 2297.24]];
	_CDC setMarkerText "Centre For Disease Control";
	_CDC setMarkerType "dot";
	_CDC setMarkerColor "ColorBlack";
	_CDC setMarkerBrush "Solid";
	_CDC setMarkerSize [10, 10];
	CDC = _CDC;
	};
	//Kamenka Mine
	if (kamenkamineMarker) then {
	_kamenkamine = createMarker ["kamenkamine", [87.26, 1599.11]];
	_kamenkamine setMarkerText "Kamenka Mine";
	_kamenkamine setMarkerType "mil_dot";
	_kamenkamine setMarkerColor "ColorBlack";
	_kamenkamine setMarkerBrush "Solid";
	_kamenkamine setMarkerSize [10, 10];
	kamenkamine = _kamenkamine;
	};
	//Black Forest Outpost Mine
	if (blackforestoutpostMarker) then {
	_blackforestoutpost = createMarker ["blackforestoutpost", [8565, 8085.11]];
	_blackforestoutpost setMarkerText "Black Forest Outpost";
	_blackforestoutpost setMarkerType "mil_dot";
	_blackforestoutpost setMarkerColor "ColorBlack";
	_blackforestoutpost setMarkerBrush "Solid";
	_blackforestoutpost setMarkerSize [10, 10];
	blackforestoutpost = _blackforestoutpost;
	};
	//Golden River Mine
	if (golden_river_mineMarker) then {
	_golden_river_mine = createMarker ["golden_river_mine", [2130.2847, 12854.148]];
	_golden_river_mine setMarkerText "Golden River Mine";
	_golden_river_mine setMarkerType "mil_dot";
	_golden_river_mine setMarkerColor "ColorBlack";
	_golden_river_mine setMarkerBrush "Solid";
	_golden_river_mine setMarkerSize [10, 10];
	golden_river_mine = _golden_river_mine;
	};
	//Project X
	if (projectxMarker) then {
	_projectxMarker = createMarker ["projectx", [6491.0933, 14284.572]];
	_projectxMarker setMarkerText "Casino";
	_projectxMarker setMarkerType "mil_dot";
	_projectxMarker setMarkerColor "ColorBlack";
	_projectxMarker setMarkerBrush "Solid";
	_projectxMarker setMarkerSize [10, 10];
	projectx = _projectxMarker;
	};

};