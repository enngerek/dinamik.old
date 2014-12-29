//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////

if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;


//_rnd = floor (random (count(_markerArray)));
//_secilenarray=_markerArray select _rnd;
//_markerArray=_markerArray - [_secilenarray];
//_mrkSpawnTown = getMarkerPos _secilenarray;
_markerarray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9","town_10","town_11","town_12","town_13","town_14"] ;
_secilenarray = _markerarray call BIS_fnc_selectRandom;
_markerArray=_markerArray - [_secilenarray];
_mrkSpawnTown = getMarkerPos _secilenarray;

_temaarray=["tema1","tema2","tema3"];
_sectema= _temaarray call BIS_fnc_selectRandom;

switch (_sectema) do
{
	case ("tema1"):
	{

	sleep 10;



	//hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "o_inf";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText " Silahlı gruplara müdahele et";
	_markerCO setMarkerSize [1,1];
	
	_null = [player, "mob_clear", ["Silahlı grupların kasabaya indiğine dair istihbarat alınmıştır.Derhal olay yerine intikal edin.", "Silahlı gruplara müdahele et", "Silahlı gruplara müdahele et"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	

	_newPos2 = [getmarkerpos _markerCO,[101,301],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos3 = [getmarkerpos _markerCO,[102,302],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos4 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos5 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	
	//_aracarrayind=["I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_Truck_02_box_F","I_Truck_02_transport_F"];
	//_aracarrayeast=["O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F"];
	//_secilenaracind1=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaracind2=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaraceast1=_aracarrayeast call BIS_fnc_selectRandom;
	//_secilenaraceast2=_aracarrayeast call BIS_fnc_selectRandom;
		
	_ifv1 = createGroup resistance;
	[_newPos2, 10, "I_G_Offroad_01_armed_F", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos3, 10, "I_G_Offroad_01_armed_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	_ifv2 = createGroup EAST;
	[_newPos4, 10, "O_G_Offroad_01_armed_F", _ifv2] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos5, 10, "O_G_Offroad_01_armed_F", _ifv2] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
//deleteMarker _TaskZone1;
	deleteVehicle _mhq;
	//deleteVehicle _camonet;
	deleteVehicle _trg;

	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	{deleteVehicle _x} forEach units _ifv2;
	deleteGroup _ifv2;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Tebrikler!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
	
nul = [] execVM "gorev.sqf";
	
	
	};
	case ("tema2"):
	{
	
	sleep 10;



	//hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "o_inf";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText " Silahlı gruplara müdahele et";
	_markerCO setMarkerSize [1,1];
	
	_null = [player, "mob_clear", ["Silahlı grupların kasabaya indiğine dair istihbarat alınmıştır.Derhal olay yerine intikal edin.", "Silahlı gruplara müdahele et", "Silahlı gruplara müdahele et"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	

	_newPos2 = [getmarkerpos _markerCO,[150,300],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos3 = [getmarkerpos _markerCO,[102,302],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	//_newPos4 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	//sleep 2;
	//_newPos5 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	//_aracarrayind=["I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_Truck_02_box_F","I_Truck_02_transport_F"];
	//_aracarrayeast=["O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F"];
	//_secilenaracind1=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaracind2=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaraceast1=_aracarrayeast call BIS_fnc_selectRandom;
	//_secilenaraceast2=_aracarrayeast call BIS_fnc_selectRandom;
		
	_ifv1 = createGroup resistance;
	[_newPos2, 10, "I_MRAP_03_hmg_F", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos3, 10, "I_MRAP_03_hmg_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	/*_ifv2 = createGroup EAST;
	[_newPos2, 10, "O_APC_Tracked_02_cannon_F", _ifv2] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos2, 10, "O_G_Offroad_01_armed_F", _ifv2] call BIS_fnc_spawnvehicle;
	*/
	_grp1C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
//deleteMarker _TaskZone1;
	deleteVehicle _mhq;
	//deleteVehicle _camonet;
	deleteVehicle _trg;

	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Tebrikler!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
	
nul = [] execVM "gorev.sqf";
	
	};
	case ("tema3"):
	{
	sleep 10;



	//hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "o_inf";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText " Silahlı gruplara müdahele et";
	_markerCO setMarkerSize [1,1];
	
	_null = [player, "mob_clear", ["Silahlı grupların kasabaya indiğine dair istihbarat alınmıştır.Derhal olay yerine intikal edin.", "Silahlı gruplara müdahele et", "Silahlı gruplara müdahele et"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	

	_newPos2 = [getmarkerpos _markerCO,[50,250],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos3 = [getmarkerpos _markerCO,[102,302],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos4 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos5 = [getmarkerpos _markerCO,[103,303],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	//_aracarrayind=["I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_Truck_02_box_F","I_Truck_02_transport_F"];
	//_aracarrayeast=["O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F"];
	//_secilenaracind1=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaracind2=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaraceast1=_aracarrayeast call BIS_fnc_selectRandom;
	//_secilenaraceast2=_aracarrayeast call BIS_fnc_selectRandom;
		
	_ifv1 = createGroup resistance;
	[_newPos2, 10, "I_MRAP_03_hmg_F", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos3, 10, "I_G_Offroad_01_armed_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	_ifv2 = createGroup EAST;
	[_newPos4, 10, "O_APC_Tracked_02_cannon_F", _ifv2] call BIS_fnc_spawnvehicle;
	nul = [_ifv2,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	
	_grp1C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
//deleteMarker _TaskZone1;
	deleteVehicle _mhq;
	//deleteVehicle _camonet;
	deleteVehicle _trg;

	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	{deleteVehicle _x} forEach units _ifv2;
	deleteGroup _ifv2;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Tebrikler!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
	
nul = [] execVM "gorev.sqf";
	
	};
};

