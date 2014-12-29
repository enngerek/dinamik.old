//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////

sleep 10;

_mrkSpawnTown = getMarkerPos "kasaba";

sleep 10;


	//hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "hd_objective";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText " Silahlı gruplara müdahele et";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_clear", ["Silahlı grupların kasabaya indiğine dair istihbarat alınmıştır.Derhal olay yerine intikal ederek bu kişileri etkisiz hale getirin. ", "Bölgeyi Temizle", "Bölgeyi Temizle"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_TaskZone1 = createMarker ["TaskZone1", _mrkSpawnTown];
	_TaskZone1 setMarkerShape "Ellipse";
	_TaskZone1 setmarkerSize [300,300];
	_TaskZone1 setMarkerAlpha 0;
	
	_newPos2 = [getmarkerpos _markerCO,[300,400],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	_ifv1 = createGroup EAST;
	[_newPos2, 10, "O_MRAP_02_hmg_F", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos2, 10, " O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos2, 10, " O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, EAST, ["O_G_Soldier_SL_F", "O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, ["O_G_Soldier_SL_F", "O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, EAST, ["O_G_Soldier_SL_F", "O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Tebrikler Asker!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	null=[]execVM "RandomArray.sqf";
	
	[west, "mob_clear"] call LARs_fnc_removeTask;


// MAIN LOGIC

