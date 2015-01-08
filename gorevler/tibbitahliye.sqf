
/*_markerarray = ["tıbbitah_1","tıbbitah_2","tıbbitah_3","tıbbitah_4","tıbbitah_5","tıbbitah_6","tıbbitah_7","tıbbitah_8","tıbbitah_9","tıbbitah_10"] ;
_secilenarray = _markerarray call BIS_fnc_selectRandom;
_markerArray=_markerArray - [_secilenarray];
_mrkSpawnTown = getMarkerPos _secilenarray;
*/
_mrkSpawnTown = getMarkerPos "tıbbitah_1";

_markerSO = createMarker ["mob_rescue", _mrkSpawnPos];
	_markerSO setMarkerType "mil_objective";
	_markerSO setMarkerColor "ColorBlue";
	_markerSO setMarkerText "SUPPORT OP";
	_markerSO setMarkerSize [1,1];
	
	_null = [west, "mob_rescue", ["Evac the wounded from the AO and bring it to MASH in Loy Manara AB", "MEDEVAC", "MEDEVAC"], getMarkerPos "mob_rescue", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rescue", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle

	_veh = ["B_MRAP_01_gmg_F","B_MRAP_01_F","B_Truck_01_transport_F"] call BIS_fnc_selectRandom;
	
	_truck = createVehicle [_veh,[(getMarkerpos _markerSO select 0) + 3, getMarkerpos _markerSO select 1,0],[], 0, "NONE"];
	_truck setDammage 0.8;
	_truck allowDamage false;
	_truck setFuel 0;
	
	_grp = createGroup WEST;
	_men1 = _grp createUnit ["B_Soldier_F",[(getMarkerpos _markerSO select 0) + 10, getMarkerpos _markerSO select 1,0], [], 0, "NONE"];
	_men1 allowDamage false;
	_men1 setCaptive true;
	_men1 setHit ["hands",1];
	_men1 setHit ["head_hit",0.4];
	_men1 setHit ["body",0.5];
	_men1 playMoveNow "AinjPpneMstpSnonWrflDnon";
	_men1 disableAI "MOVE";
	_men1 disableAI "ANIM";
	escolta = _men1;
	publicVariable "escolta";
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _truck, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _truck, 150] call BIS_fnc_taskPatrol;
	
	waitUntil { _men1 distance getMarkerPos "mash" < 50 };
	
	[_men1] join grpNull;
	
	null = ["mob_rescue", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerSO;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	deleteVehicle _truck;
	deleteVehicle _men1;
	deleteGroup _grp;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_rescue"] call LARs_fnc_removeTask;