//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////

//Mission Select
if(!isServer) exitWith {};

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["clear","clear1","clear2","clear3"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "clear";
//[_choose] execVM "Rtask\makeClearOps.sqf";  //call mission

_myHint ="Requesting Clear Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9"];
_rnd 	= floor (random (count(_markerArray)));
_mrkSpawnTown = getMarkerPos (_markerArray select _rnd);

sleep 10;

fn_spawnClearMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerType "o_inf";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [1,1];
	
	_null = [west, "mob_clear", ["Take control of the town and drive out CSAT forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
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
	nul = [_arm1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos2, 10, " O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos2, 10, " O_APC_Wheeled_02_rcws_F", _ifv1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam_AT")] call BIS_fnc_spawnGroup;
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

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
[]execVM "Rtask\makeclearops.sqf";
};

fn_spawnClear1Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear1", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [500,500];
	
	_null = [west, "mob_clear1", ["Take control of the town and drive out CSAT forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear1", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear1", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_newPos2 = [getmarkerpos _markerCO,[300,400],random 360,0,[1,250],"O_MBT_02_cannon_F"] call SHK_pos;
	
	_arm1 = createGroup EAST;
	[_newPos2, 10, "O_MBT_02_cannon_F", _arm1] call BIS_fnc_spawnvehicle;
	nul = [_arm1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos2, 10, "O_MBT_02_cannon_F", _arm1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam_AT")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam_AT")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 200] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear1", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _arm1;
	deleteGroup _arm1;
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
	
	[west, "mob_clear1"] call LARs_fnc_removeTask;
[]execVM "Rtask\makeclearops.sqf";
};

fn_spawnClear2Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear2", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [500,500];
	
	_null = [west, "mob_clear2", ["Take control of the town and drive out CSAT forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear2", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_newPos2 = [getmarkerpos _markerCO,[300,400],random 360,0,[1,250],"O_MBT_02_cannon_F"] call SHK_pos;
	
	_chop1 = createGroup EAST;
	[_newPos2, 10, "O_Heli_Light_02_F", _chop1] call BIS_fnc_spawnvehicle;
	nul = [_chop1,getPos _mhq, 1000] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos2, 10, "O_Heli_Light_02_F", _chop1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp4C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp4C,getPos _mhq, 200] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear2", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _grp4C;
	{deleteVehicle _x} forEach units _chop1;
	deleteGroup _chop1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;
	deleteGroup _grp4C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear2"] call LARs_fnc_removeTask;
[]execVM "Rtask\makeclearops.sqf";
};

fn_spawnClear3Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear3", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "CLEAR OP";
	_markerCO setMarkerSize [500,500];
	
	_null = [west, "mob_clear3", ["Take control of the town and drive out CSAT forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear3", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear3", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerCO,[0,50],random 360,0,[1,250],"O_Truck_03_covered_F"] call SHK_pos;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_newPos2 = [getmarkerpos _markerCO,[300,400],random 360,0,[1,250],"O_APC_Tracked_02_cannon_F"] call SHK_pos;
	
	_arm2 = createGroup EAST;
	[_newPos2, 10, "O_APC_Tracked_02_cannon_F", _arm2] call BIS_fnc_spawnvehicle;
	nul = [_arm2,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos2, 10, "O_APC_Tracked_02_cannon_F", _arm2] call BIS_fnc_spawnvehicle;
	
	_chop2 = createGroup EAST;
	[_newPos2, 10, "O_Heli_Attack_02_F", _chop2] call BIS_fnc_spawnvehicle;
	nul = [_chop2,getPos _mhq, 700] call BIS_fnc_taskPatrol;
	
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [350, 350, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear3", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _arm2;
	{deleteVehicle _x} forEach units _chop2;
	deleteGroup _arm2;
	deleteGroup _chop2;
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
	
	[west, "mob_clear3"] call LARs_fnc_removeTask;
[]execVM "Rtask\makeclearops.sqf";
};

// MAIN LOGIC

_missionDetails = switch (_choose) do {
	case "clear": {call fn_spawnClearMission;};
	case "clear1": {call fn_spawnClear1Mission;};
	case "clear2": {call fn_spawnClear2Mission;};
	case "clear3": {call fn_spawnClear3Mission;};
};