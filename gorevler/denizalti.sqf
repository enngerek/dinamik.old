if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 1;
//_rnd = floor (random (count(_damarkerarray)));
//_dasecilenarray=_damarkerarray select _rnd;
//_damarkerarray=_damarkerarray - [_dasecilenarray];
//_damrkSpawnTown = getMarkerPos _dasecilenarray;

_damarkerarray = ["da","da_1","da_2","da_3","da_4","da_5"] ;
_dasecilenarray = _damarkerarray call BIS_fnc_selectRandom;
_damarkerarray=_damarkerarray - [_dasecilenarray];
_damrkSpawnTown = getMarkerPos _dasecilenarray;

sleep 1;

_temadenizalti=["temada1","temada2","temada3"];
_sectemada= _temadenizalti call BIS_fnc_selectRandom;

sleep 1;

switch (_sectemada) do
{
	case ("temada1"):
	{
sleep 1;

_markerDA = createMarker ["mob_da", _damrkSpawnTown];
	_markerDA setMarkerType "o_naval";
	_markerDA setMarkerColor "ColorRed";
	_markerDA setMarkerText " Denizaltı sabotaj";
	_markerDA setMarkerSize [1,1];
	
	sleep 2;
	
	_null = [player, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair isthbarat alnmıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	sleep 2;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;

	//creating the vehicle
	
		_hedef1 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	sleep 2;
	_trgda = createTrigger ["EmptyDetector", getMarkerPos _markerDA]; 
	_trgda setTriggerArea [500, 500, 0, false]; 
	_trgda setTriggerActivation ["independent", "NOT PRESENT", false]; 
	_trgda setTriggerStatements ["this AND !alive _hedef1", "", ""];
	
	sabotageSSN = _hedef1;
	publicVariable "sabotageSSN";
	sleep 1;
	
	//_hedef2 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_possu = [getmarkerpos _markerDA,[100,200],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	_possu2 = [getmarkerpos _markerDA,[90,201],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	_newPos1 = [getmarkerpos _markerDA,[149,299],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos2 = [getmarkerpos _markerDA,[150,300],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_devnok = [getmarkerpos _markerDA,[100,200],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 1;
	_dev1 = createGroup resistance;
	sleep 1;
	[_possu, 25, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 1;
	[_possu2, 10, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 1;
	nul = [_dev1,getMarkerPos "mob_da", 250] call BIS_fnc_taskPatrol;
	sleep 10;
	
	_dev2 = createGroup resistance;
	sleep 2;
	[_newPos1, 10, "I_APC_tracked_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 5;
	[_newPos2, 10, "I_APC_Wheeled_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 1;
	nul = [_dev2,getMarkerPos "mob_da", 250] call BIS_fnc_taskPatrol;
	
	_grp1d = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	//nul = [_grp1d,_devnok, 300] call BIS_fnc_taskPatrol;
	[_grp1d, getMarkerPos "mob_da"] call BIS_fnc_taskDefend;
	
	_grp2d = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp2d,_devnok, 150] call BIS_fnc_taskPatrol;
	
	_grp1ds = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp1ds,_devnok, 200] call BIS_fnc_taskPatrol;
	sleep 1;
	
	waitUntil {triggerActivated _trgda};
	sleep 1;
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	sleep 2;
	
	deleteMarker _markerDA;
	deleteVehicle _trgDA;
	deleteVehicle _hedef1;
	{deleteVehicle _x} forEach units _grp1d;
	{deleteVehicle _x} forEach units _grp1ds;
	{deleteVehicle _x} forEach units _grp2d;
    {deleteVehicle _x} forEach units _dev1;
	{deleteVehicle _x} forEach units _dev2;
	deleteGroup _grp1d;
	deleteGroup _grp1ds;
	deleteGroup _grp2d;
	deleteGroup _dev2;
	deleteGroup _dev1;
nul = [] execVM "gorev.sqf";
};
case ("temada2"):
	{
	sleep 1;

_markerDA = createMarker ["mob_da", _damrkSpawnTown];
	_markerDA setMarkerType "o_naval";
	_markerDA setMarkerColor "ColorRed";
	_markerDA setMarkerText " Denizaltı sabotaj";
	_markerDA setMarkerSize [1,1];
	
	sleep 1;
	
	_null = [player, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair isthbarat alnımıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	sleep 2;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;

	//creating the vehicle
	
	_hedef1 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	sleep 2;
	_trgda = createTrigger ["EmptyDetector", getMarkerPos _markerDA]; 
	_trgda setTriggerArea [500, 500, 0, false]; 
	_trgda setTriggerActivation ["independent", "NOT PRESENT", false]; 
	_trgda setTriggerStatements ["this AND !alive _hedef1", "", ""];
	sleep 1;
	
	//_hedef2 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_possu = [getmarkerpos _markerDA,[100,200],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	_possu2 = [getmarkerpos _markerDA,[90,201],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	_newPos1 = [getmarkerpos _markerDA,[149,299],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos2 = [getmarkerpos _markerDA,[150,300],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_devnok = [getmarkerpos _markerDA,[50,100],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	_dev1 = createGroup resistance;
	sleep 2;
	[_possu, 10, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 2;
	[_possu2, 10, "I_Boat_Armed_01_minigun_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_dev1,getMarkerPos "mob_da", 250] call BIS_fnc_taskPatrol;
	
	_dev2 = createGroup resistance;
	sleep 1;
	[_newPos1, 10, "I_APC_tracked_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 2;
	[_newPos2, 10, "I_Heli_light_03_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_dev2,getMarkerPos "mob_da", 300] call BIS_fnc_taskPatrol;
	
	_grp1d = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	//nul = [_grp1d,_devnok, 300] call BIS_fnc_taskPatrol;
	[_grp1d, getMarkerPos "mob_da"] call BIS_fnc_taskDefend;
	
	_grp2d = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp2d,_devnok, 150] call BIS_fnc_taskPatrol;
	
	_grp1ds = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp1ds,_devnok, 300] call BIS_fnc_taskPatrol;
	sleep 1;
	
	
	
	waitUntil {triggerActivated _trgda};
	sleep 1;
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	sleep 1;
	
	deleteMarker _markerDA;
	deleteVehicle _trgDA;
	deleteVehicle _hedef1;
	{deleteVehicle _x} forEach units _grp1d;
	{deleteVehicle _x} forEach units _grp1ds;
	{deleteVehicle _x} forEach units _grp2d;
    {deleteVehicle _x} forEach units _dev1;
	{deleteVehicle _x} forEach units _dev2;
	deleteGroup _grp1d;
	deleteGroup _grp1ds;
	deleteGroup _grp2d;
	deleteGroup _dev2;
	deleteGroup _dev1;
	sleep 1;
nul = [] execVM "gorev.sqf";
	};
	
case ("temada3"):
	{
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
	

	
	sleep 10;

	//creating the vehicle
	
		_hedef1 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	sleep 2;
	_trgda = createTrigger ["EmptyDetector", getMarkerPos _markerDA]; 
	_trgda setTriggerArea [500, 500, 0, false]; 
	_trgda setTriggerActivation ["independent", "NOT PRESENT", false]; 
	_trgda setTriggerStatements ["this AND !alive _hedef1", "", ""];
	
	//_hedef2 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	
	_possu = [getmarkerpos _markerDA,[125,200],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_possu2 = [getmarkerpos _markerDA,[125,201],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_newPos1 = [getmarkerpos _markerDA,[160,350],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_newPos2 = [getmarkerpos _markerDA,[150,300],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_devnok = [getmarkerpos _markerDA,[30,60],random 360,0,[]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	_dev1 = createGroup resistance;
		[_possu2, 10, "I_Heli_light_03_F", _dev1] call BIS_fnc_spawnvehicle;
	sleep 5;
	nul = [_dev1,getMarkerPos "mob_da", 500] call BIS_fnc_taskPatrol;
	
	_dev3 = createGroup resistance;
	[_possu, 10, "I_Boat_Armed_01_minigun_F", _dev3] call BIS_fnc_spawnvehicle;
	sleep 5;
	nul = [_dev3,getMarkerPos "mob_da", 500] call BIS_fnc_taskPatrol;
	
	
	_dev2 = createGroup resistance;
	[_newPos1, 10, "I_APC_tracked_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos2, 10, "I_APC_Wheeled_03_cannon_F", _dev2] call BIS_fnc_spawnvehicle;
	sleep 1;
	nul = [_dev2,getMarkerPos "mob_da", 50] call BIS_fnc_taskPatrol;
	
	_grp1d = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	//nul = [_grp1d,_devnok, 300] call BIS_fnc_taskPatrol;
	[_grp1d, getMarkerPos "mob_da"] call BIS_fnc_taskDefend;
	
	_grp2d = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	nul = [_grp2d,_devnok, 50] call BIS_fnc_taskPatrol;
	
	_grp1ds = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1ds,_devnok, 50] call BIS_fnc_taskPatrol;
	
	
	
	waitUntil {triggerActivated _trgda};
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	deleteMarker _markerDA;
	deleteVehicle _trgDA;
	deleteVehicle _hedef1;
	{deleteVehicle _x} forEach units _grp1d;
	{deleteVehicle _x} forEach units _grp1ds;
	{deleteVehicle _x} forEach units _grp2d;
    {deleteVehicle _x} forEach units _dev1;
	{deleteVehicle _x} forEach units _dev2;
	deleteGroup _grp1d;
	deleteGroup _grp1ds;
	deleteGroup _grp2d;
	deleteGroup _dev2;
	deleteGroup _dev1;
nul = [] execVM "gorev.sqf";
	};
};
//test;
	
