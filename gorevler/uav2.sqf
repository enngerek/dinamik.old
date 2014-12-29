//hint "UPDATED SUPPORT OPS";
	//creating the marker 
	
	if (! isServer) exitWith {};
	
_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

_uavmarkerarray = ["uav","uav_1","uav_2","uav_3","uav_4","uav_5"] ;
_uavsecilenarray = _uavmarkerarray call BIS_fnc_selectRandom;
_uavmarkerArray=_uavmarkerArray - [_uavsecilenarray];
_mrkSpawnPos = getMarkerPos _uavsecilenarray;

	_markerSO = createMarker ["mob_uav", _mrkSpawnPos];
	_markerSO setMarkerShape "ellipse";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "UAV kara kutusunu ele geçir";
	_markerSO setMarkerSize [700,700];
	
	sleep 2;
	
	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerSO]; 
	_trg setTriggerArea [500, 500, 0, false]; 
	_trg setTriggerActivation ["independent", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this AND !alive _device", "", ""];
	
	sleep 2;
	
	_null = [player, "mob_uav", ["Düşmana ait bir insansız hava aracı düşürülmüştür.Derhal bölgeye intikal ederek harddiskini kopyaladıktan sonra bölgedeki düşman unsurları temizleyin.", "UAV kara kutusunu ele geçir", "UAV kara kutusunu ele geçir"], getMarkerPos "mob_uav", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_uav", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle

	_newPos = [getmarkerpos _markerSO,[0,600],random 360,0,[1,250],"O_UAV_02_F"] call SHK_pos;
	
	_uav = createVehicle ["O_UAV_02_F", _newPos, [], 0, "CAN_COLLIDE"];
	_uav setDammage 0.8;
	uavdata = _uav;
	publicVariable "uavdata";
	
	_device = createVehicle ["Land_SurvivalRadio_F", getPos _uav, [], 0, "CAN_COLLIDE"];
	_device attachTo [_uav,[0,0,-0.3]];
	
	_markeruav = createMarker ["uavmarker", getPos _uav];
	_markeruav setMarkerType "o_uav";
	_markeruav setMarkerColor "ColorBlue";
	_markeruav setMarkerSize [0.7,0.7];
	
	_newPos2 = [_uav,[150,300],random 360] call SHK_pos;  
	
	_grp1S = [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	//_grp1Ss = [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	//nul = [_grp1Ss,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _uav, 200] call BIS_fnc_taskPatrol;
	
	_grp2Ss = [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Mechanized" >> "HAF_MechInfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2Ss,getPos _uav, 200] call BIS_fnc_taskPatrol;
		
	//_uavaracarray=["I_Heli_light_03_F","I_Heli_Transport_02_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F"];
	//_uavsecilenarac1=_uavaracarray call BIS_fnc_selectRandom;
	
	_helo1 = createGroup resistance;
	[_newPos2, 10, "I_Heli_light_03_F", _helo1] call BIS_fnc_spawnvehicle;
	nul = [_helo1,getPos _uav, 500] call BIS_fnc_taskPatrol;

	//waitUntil { !alive _device };
	
	
	
	waitUntil {triggerActivated _trg};
	
	_null = ["mob_uav", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
		
	sleep 10;

	deleteMarker _markerSO;
	deleteMarker _markeruav;
	deleteVehicle _trg;
	{deleteVehicle _x} forEach units _grp1S;
	//{deleteVehicle _x} forEach units _grp1Ss;
	{deleteVehicle _x} forEach units _grp2S;
	{deleteVehicle _x} forEach units _grp2Ss;
	{deleteVehicle _x} forEach units _helo1;
	deleteGroup _grp1S;
	//deleteGroup _grp1Ss;
	deleteGroup _grp2S;
	deleteGroup _grp2Ss;
	deleteGroup _helo1;

	_myHint ="Tebrikler!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_uav"] call LARs_fnc_removeTask;
nul = [] execVM "gorev.sqf";