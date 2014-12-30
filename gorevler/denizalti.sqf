if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;


//_rnd = floor (random (count(_damarkerarray)));
//_dasecilenarray=_damarkerarray select _rnd;
//_damarkerarray=_damarkerarray - [_dasecilenarray];
//_damrkSpawnTown = getMarkerPos _dasecilenarray;

_damarkerarray = ["da","da_1","da_2","da_3","da_4","da_5"] ;
_dasecilenarray = _damarkerarray call BIS_fnc_selectRandom;
_damarkerarray=_damarkerarray - [_dasecilenarray];
_damrkSpawnTown = getMarkerPos _dasecilenarray;

sleep 1;

_markerDA = createMarker ["mob_da", _damrkSpawnTown];
	_markerDA setMarkerType "o_naval";
	_markerDA setMarkerColor "ColorRed";
	_markerDA setMarkerText " Denizaltı sabotaj";
	_markerDA setMarkerSize [1,1];
	
	sleep 1;
	
	_null = [player, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair isthbarat alnımıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	_trgda = createTrigger ["EmptyDetector", getMarkerPos _markerDA]; 
	_trgda setTriggerArea [500, 500, 0, false]; 
	_trgda setTriggerActivation ["independent", "NOT PRESENT", false]; 
	_trgda setTriggerStatements ["this AND !alive _device", "", ""];
	
	sleep 10;

	//creating the vehicle
	
		_hedef1 = createVehicle ["I_SDV_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	sleep 2;
	
	//_hedef2 = createVehicle ["I_SDV_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_possu = [getmarkerpos _markerDA,[100,200],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_possu2 = [getmarkerpos _markerDA,[90,201],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_newPos1 = [getmarkerpos _markerDA,[149,299],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_newPos2 = [getmarkerpos _markerDA,[150,300],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_devnok = [getmarkerpos _markerDA,[30,60],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	_dev1 = createGroup resistance;
	[_possu, 10, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 5;
	[_possu2, 10, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 5;
	nul = [_dev1,getPos _hedef1, 250] call BIS_fnc_taskPatrol;
	
	__dev2 = createGroup resistance;
	[_newPos1, 10, "I_APC_tracked_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos2, 10, "I_APC_Wheeled_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	nul = [_dev2,getPos _hedef1, 250] call BIS_fnc_taskPatrol;
	
	_grp1S = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	//nul = [_grp1S,_devnok, 300] call BIS_fnc_taskPatrol;
	[_grprS, getPos _hedef1] call BIS_fnc_taskDefend;
	
	_grp2S = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,_devnok, 150] call BIS_fnc_taskPatrol;
	
	_grp1Ss = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1Ss,_devnok, 300] call BIS_fnc_taskPatrol;
	
	
	
	waitUntil {triggerActivated _trgda};
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	deleteMarker _markerDA;
	deleteVehicle _trgDA;
	deleteVehicle _hedef1;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp1Ss;
	{deleteVehicle _x} forEach units _grp2S;
    {deleteVehicle _x} forEach units _dev1;
	{deleteVehicle _x} forEach units _dev2;
	deleteGroup _grp1S;
	deleteGroup _grp1Ss;
	deleteGroup _grp2S;
	deleteGroup _dev2;
	deleteGroup _dev1;
nul = [] execVM "gorev.sqf";	
	
