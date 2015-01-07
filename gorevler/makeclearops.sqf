//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

_myHint ="Requesting Clear Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9","town_10","town_11","town_12","town_13","town_14"];
_rnd 	= floor (random (count(_markerArray)));
_mrkSpawnTown = getMarkerPos (_markerArray select _rnd);

sleep 10;

fn_spawnClearMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_clear", ["Take control of the zone and drive out OPFOR forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 0, 50, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F",[(getMarkerpos _markerCO select 0) + 10, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	_camonet1 = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_ifv1 = createGroup EAST;
	[_newPos, 10, "O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 150] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [300, 300, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet1;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
};

fn_spawnKillMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_kill", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_kill", ["Kill the enemy officers", "Kill Officers", "Kill Officers"], getMarkerPos "mob_kill", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_kill", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_mrap = createVehicle ["O_MRAP_02_F",[(getMarkerpos _markerCO select 0) + 3, getMarkerpos _markerCO select 1,0],[], 0, "NONE"];
	
	_off = createGroup EAST;
	_officer1 = _off createUnit ["O_officer_F",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_officer2 = _off createUnit ["O_officer_F",[(getMarkerpos _markerCO select 0) + 2, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mrap, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _mrap, 250] call BIS_fnc_taskPatrol;

	waitUntil {!alive _officer1 && !alive _officer2};
	
	_null = ["mob_kill", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _off;
	deleteVehicle _mrap;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_kill"] call LARs_fnc_removeTask;
};

fn_spawnAmmoMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_ammo", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_ammo", ["Find and destroy the supply trucks.", "Destroy Supplies", "Destroy Supplies"], getMarkerPos "mob_ammo", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 50, 200, 15, 0, 0, 0] call BIS_fnc_findSafePos;

	_supply = ["O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_02_box_F"] call BIS_fnc_selectRandom;
	
	_supplies = createVehicle [_supply, _newPos, [], 0, "CAN_COLLIDE"];
	
	_grp1C = [_newPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _supplies, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [_newPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _supplies, 200] call BIS_fnc_taskPatrol;
		
	sleep 5;
	
	_newPos2 = [getPos _supplies, 10, 20, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "communications" >> "communicationCamp1"), _newPos2, 0] call ALIVE_fnc_spawnComposition;

	waitUntil {!alive _supplies};
	
	_null = ["mob_ammo", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _supplies;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_ammo"] call LARs_fnc_removeTask;
};

fn_spawnAmmo2Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_ammo2", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_ammo2", ["Find and destroy the campsite.", "Destroy Camp", "Destroy Camp"], getMarkerPos "mob_ammo2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo2", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 400, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_cache = createVehicle ["Box_East_AmmoVeh_F", _newPos, [], 0, "CAN_COLLIDE"];
	
	_grp1C = [_newPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_SniperTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _cache, 50] call BIS_fnc_taskPatrol;
	
	_grp2C = [_newPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_SniperTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _cache, 50] call BIS_fnc_taskPatrol;
	
	sleep 5;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "camps" >> "smallMilitaryCamp1"), getPos _cache, 0] call ALIVE_fnc_spawnComposition;

	waitUntil {!alive _cache};
	
	_null = ["mob_ammo2", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_ammo2"] call LARs_fnc_removeTask;
};

fn_spawnComsMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_comms", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_comms", ["Find and destroy OPFOR mobile comms", "Destroy Comms", "Destroy Comms"], getMarkerPos "mob_comms", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_comms", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 0, 200, 15, 0, 0, 0] call BIS_fnc_findSafePos;

	_comms = ["Land_TTowerSmall_1_F","Land_TTowerSmall_2_F"] call BIS_fnc_selectRandom;
	
	_rtower = createVehicle [_comms, _newPos, [], 0, "NONE"];
	_movilhq = createVehicle ["O_Truck_03_device_F",[(getPos _rtower select 0) + 5, getPos _rtower select 1,0],[], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _movilhq, [], 0, "CAN_COLLIDE"];
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _rtower, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _rtower, 200] call BIS_fnc_taskPatrol;

	waitUntil {!alive _rtower};
	
	_null = ["mob_comms", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _movilhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLATED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_comms"] call LARs_fnc_removeTask;
};

fn_spawnArmorMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_armor", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_armor", ["Destroy the enemy armor platoon", "Destroy Armor", "Destroy Armor"], getMarkerPos "mob_armor", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_armor", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 50, 200, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F",[(getMarkerpos _markerCO select 0) + 10, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	_camonet1 = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_tanques1 = createGroup EAST;
	[_newPos, 10, "O_MBT_02_cannon_F", _tanques1] call BIS_fnc_spawnvehicle;
	nul = [_tanques1,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "O_MBT_02_cannon_F", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "O_MBT_02_cannon_F", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "O_APC_Tracked_02_cannon_F", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "O_APC_Tracked_02_cannon_F", _tanques1] call BIS_fnc_spawnvehicle;
	
	waitUntil {{ alive _x } count units _tanques1 == 0}; 

	_null = ["mob_armor", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet1;
	{deleteVehicle _x} forEach units _tanques1;
	deleteGroup _tanques1;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_armor"] call LARs_fnc_removeTask;
};

fn_spawnAntiairMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_aaa", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_aaa", ["Find and destroy the AA.", "Destroy AA", "Destroy AA"], getMarkerPos "mob_aaa", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_aaa", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 200, 300, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_artyaa = createVehicle ["O_APC_Tracked_02_AA_F", _newPos, [], 0, "CAN_COLLIDE"];
	_artyaa setFuel 0;
	
	_aacrew = createGroup EAST;
	_crew1 = _aacrew createUnit ["O_crew_F", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew1 moveInCommander _artyaa;
	_crew2 = _aacrew createUnit ["O_crew_F", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew2 moveInGunner _artyaa;
	
	_grp1C = [_newPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _artyaa] call BIS_fnc_taskDefend;
	
	sleep 5;
	
	_newPos2 = [getPos _artyaa, 15, 20, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "camps" >> "mediumAACamp1"), _newPos2, 0] call ALIVE_fnc_spawnComposition;

	waitUntil {!alive _artyaa};
	
	_null = ["mob_aaa", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _artyaa;
	{deleteVehicle _x} forEach units _aacrew;
	deleteGroup _aacrew;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	
	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_aaa"] call LARs_fnc_removeTask;
};

fn_spawnCaptureMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_capture", _mrkSpawnTown];
	_markerCO setMarkerType "mil_warning";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_capture", ["Find and arrest the insurgent leader and escort him to Loy Manara Air Base.", "Capture Warlord", "Capture Warlord"], getMarkerPos "mob_capture", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_capture", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 400, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_wlordgrp = createGroup EAST;
	_warlord = _wlordgrp createUnit ["CAF_AG_ME_T_AK47", _newPos, [], 0, "NONE"];
	removeAllWeapons _warlord;
	_warlord allowDamage false;
	_warlord setCaptive true;
	_warlord disableAI "MOVE";
	_warlord disableAI "ANIM";
	arrest = _warlord;
	publicVariable "arrest";
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "camps" >> "smallMilitaryCamp1"), _newPos, 0] call ALIVE_fnc_spawnComposition;
	
	sleep 5;
	
	_ingrp2 = createGroup EAST;
	_ins1a = _ingrp2 createUnit ["CAF_AG_ME_T_SVD",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	nul = [_ingrp2,getPos _warlord, 100] call BIS_fnc_taskPatrol;
	_ins2a = _ingrp2 createUnit ["CAF_AG_ME_T_RPK74",[(getMarkerpos _markerCO select 0) + 2, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_ins3a = _ingrp2 createUnit ["CAF_AG_ME_T_AK74",[(getMarkerpos _markerCO select 0) + 3, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_ins4a = _ingrp2 createUnit ["CAF_AG_ME_T_AK74",[(getMarkerpos _markerCO select 0) + 4, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_ins5a = _ingrp2 createUnit ["CAF_AG_ME_T_AK74",[(getMarkerpos _markerCO select 0) + 5, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	
	waitUntil { _warlord distance getMarkerPos "respawn_west" < 100 };
	
	_null = ["mob_capture", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _ingrp2;
	deleteGroup _ingrp2;
	deleteGroup _wlordgrp;
	deleteVehicle _warlord;
	deleteVehicle _sign;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_capture"] call LARs_fnc_removeTask;
};

// MAIN LOGIC

_missionDetails = switch (_missionType) do {
	case "clear": {call fn_spawnClearMission;};
	case "kill": {call fn_spawnKillMission;};
	case "ammo": {call fn_spawnAmmoMission;};
	case "ammo2": {call fn_spawnAmmo2Mission;};
	case "comms": {call fn_spawnComsMission;};
	case "armor": {call fn_spawnArmorMission;};
	case "antiair": {call fn_spawnAntiairMission;};
	case "capture": {call fn_spawnCaptureMission;};
};