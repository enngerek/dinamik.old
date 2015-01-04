_damarkerarray = ["da","da_1","da_2","da_3","da_4","da_5"] ;
_dasecilenarray = _damarkerarray call BIS_fnc_selectRandom;
_damarkerarray=_damarkerarray - [_dasecilenarray];
_damrkSpawnTown = getMarkerPos _dasecilenarray;
sleep 1;

    _markerGO = createMarker ["mob_da", _damrkSpawnTown];
	_markerGO setMarkerType "o_naval";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerText " Denizaltı sabotaj";
	_markerGO setMarkerSize [1,1];
	
	sleep 2;
	
	_null = [west, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair istihbarat alnmıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	sleep 2;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;
	_denizalti = createVehicle ["Submarine_01_F", getmarkerpos _markerGO,[], 0, "NONE"];
	sleep 2;
	
	_grpdevboat1 = createGroup resistance;
	
	sleep 1;
	_possu1= [getPos _denizalti, 100, 300, 20, 2, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	[_possu1, 25, "I_Boat_Armed_01_minigun_F", _grpdevboat1] call BIS_fnc_spawnvehicle;
	sleep 2;
	
	
	_possu2= [getPos _denizalti, 100, 300, 20, 2, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	[_possu2, 25, "I_Boat_Armed_01_minigun_F", _grpdevboat1] call BIS_fnc_spawnvehicle;
	
	
	_possu3= [getPos _denizalti, 100, 300, 20, 2, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_aracsec1=["I_Boat_Armed_01_minigun_F","I_Heli_light_03_F"];
	sleep 2;
	[_possu2, 25, _aracsec1, _grpdevboat1] call BIS_fnc_spawnvehicle;
	
	_sudev=[getPos _denizalti, 200, 300, 50, 2, 0, 0];
	sleep 2;
	
	nul = [_grpdevboat1,_sudev, 300] call BIS_fnc_taskPatrol;
	
	
	_poskara=[getPos _denizalti, 100, 400, 30, 0, 0, 0] call BIS_fnc_findSafePos;
	_karadev=[getPos _denizalti, 100, 400, 30, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_grptim1 = [_poskara, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim2 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim3 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	_grptim4 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 5;
	nul = [_grptim1,_karadev, 100] call BIS_fnc_taskPatrol;
	nul = [_grptim2,_karadev, 100] call BIS_fnc_taskPatrol;
	nul = [_grptim3,_karadev, 150] call BIS_fnc_taskPatrol;
	nul = [_grptim4,_karadev, 150] call BIS_fnc_taskPatrol;
	
	_arac1pos=[getPos _denizalti, 100, 250, 20, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac1pos, 180, _arac1, _grptim1] call bis_fnc_spawnvehicle;
	sleep 2;
	_arac2pos=[getPos _denizalti, 100, 200, 20, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Truck_02_covered_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
	
	waitUntil {{{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4 and !alive _uav};
	
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	deleteMarker _markerGO;
	//deleteMarker _markerpilot;
	deleteVehicle _denizalti;
	//deleteVehicle _IRgren;
	//deleteVehicle _pilot1;
	{deleteVehicle _x} forEach units _grpdevboat1;
	deleteGroup _grpdevboat1;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim4;
	deleteGroup _grptim4;
	
	_myHint ="GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;