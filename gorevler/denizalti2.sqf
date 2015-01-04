if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;
//private["_markerDA","_hedef1","_possu","_possu2","_newPos1","_newPos2","_devnok"];
sleep 1;
//_rnd = floor (random (count(_damarkerarray)));
//_dasecilenarray=_damarkerarray select _rnd;
//_damarkerarray=_damarkerarray - [_dasecilenarray];
//_damrkSpawnTown = getMarkerPos _dasecilenarray;



//fn_spawndenizaltigorevi = {
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
	
	sleep 2;
	
	_null = [west, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair istihbarat alnmıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	sleep 2;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;

	//creating the vehicle
	
	_hedef1 = createVehicle ["Submarine_01_F", getmarkerpos _markerDA,[], 0, "NONE"];
	sleep 2;
	
	
	
	
	_possu = [getmarkerpos _markerDA,[10,50],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_possu2 = [getmarkerpos _markerDA,[50,100],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_possu3 = [getmarkerpos _markerDA,[100,150],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 5;
	_newPos1 = [getmarkerpos _markerDA,[150,350],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_newPos2 = [getmarkerpos _markerDA,[150,350],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	_devnok = [getmarkerpos _markerDA,[100,300],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	
	_devboat1 = createGroup resistance;
	_devboat2 = createGroup resistance;
	_devboat3 = createGroup resistance;
	sleep 1;
	_arac1=[_possu, 25, "I_Boat_Armed_01_minigun_F", _devboat1] call BIS_fnc_spawnvehicle;
	sleep 1;
	_arac2=[_possu2, 10, "I_Boat_Armed_01_minigun_F", _devboat2] call BIS_fnc_spawnvehicle;
	sleep 1;
	_arac3=[_possu3, 10, "I_Boat_Armed_01_minigun_F", _devboat3] call BIS_fnc_spawnvehicle;
	sleep 1;
	
	[_devboat1,getPos _hedef1, 250] call BIS_fnc_taskPatrol;
	sleep 1;
	[_devboat2,getPos _hedef1, 250] call BIS_fnc_taskPatrol;
	sleep 1;
	[_devboat3,getPos _hedef1, 250] call BIS_fnc_taskPatrol;
	sleep 1;
	
	
	_dev2 = createGroup resistance;
	sleep 2;
	_aracsec1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_Heli_Light_03_armed_F","I_MRAP_03_hmg_F","I_Heli_Transport_02_F"] call ws_fnc_selectRandom;
	sleep 1;
	[_newPos1, 10, _aracsec1, _dev2] call BIS_fnc_spawnvehicle;
	sleep 1;
	_aracsec2=["I_APC_tracked_03_cannon_F","I_Heli_Light_03_armed_F","I_MRAP_03_hmg_F","I_Heli_Transport_02_F","I_APC_Wheeled_03_cannon_F"] call ws_fnc_selectRandom;
	sleep 1;
	[_newPos2, 10, _aracsec2, _dev2] call BIS_fnc_spawnvehicle;
	sleep 1;
	[_dev2,_devnok, 250] call BIS_fnc_taskPatrol;
	
	
	
	_grp1d = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	[_grp1d,_devnok, 300] call BIS_fnc_taskPatrol;
	//[_grp1d, getMarkerPos "mob_da"] call BIS_fnc_taskDefend;
	
	_grp2d = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 1;
	[_grp2d,_devnok, 150] call BIS_fnc_taskPatrol;
	
	_grp1ds = [_newPos1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	[_grp1ds,_devnok, 200] call BIS_fnc_taskPatrol;
	
	_grp2ds = [_newPos2, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 1;
	[_grp2ds,_devnok, 150] call BIS_fnc_taskPatrol;
	sleep 1;
	_grpdalg = [getpos _hedef1, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	//nul = [_grpdalg,getpos _hedef1, 30] call BIS_fnc_taskPatrol;
	
	[[_hedef1],"fnc_rec_daimha",true,true] spawn BIS_fnc_MP;
	sleep 10;
	
	waitUntil {!alive _hedef1};
	
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerDA;
	//deleteVehicle _trgDA;
	deleteVehicle _hedef1;
	
	{deleteVehicle _x} forEach units _grp1d;
	sleep 1;
	{deleteVehicle _x} forEach units _grp1ds;
	{deleteVehicle _x} forEach units _grp2d;
		sleep 1;
	{deleteVehicle _x} forEach units _grp2ds;
		sleep 1;
    {deleteVehicle _x} forEach units _devboat1;
	 {deleteVehicle _x} forEach units _devboat2;
	  {deleteVehicle _x} forEach units _devboat3;
		sleep 1;
	{deleteVehicle _x} forEach units _dev2;
	{deleteVehicle _x} forEach units _grpdalg;
		sleep 1;
	deleteGroup _grp1d;
		sleep 1;
	deleteGroup _grp1ds;
		sleep 1;
	deleteGroup _grp2d;
		sleep 1;
	deleteGroup _grp2ds;
		sleep 1;
	deleteGroup _dev2;
		sleep 1;
	deleteGroup _devboat1;
	deleteGroup _devboat2;
	deleteGroup _devboat3;
	deleteGroup _grpdalg;
	sleep 10;
	
	
	
	_myHint ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	[west, "mob_da"] call LARs_fnc_removeTask;sleep 10;	
	nul = [] execVM "gorev.sqf";

	
