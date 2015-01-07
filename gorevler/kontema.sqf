_konvoytemasec=["_kontema1","_kontema2","_kontema3","_kontema4","_kontema5","_kontema6","_kontema7","_kontema8"] call BIS_fnc_selectRandom;

switch (_konvoytemasec) do{
	case ("_kontema1"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_1";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_1";
_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;

	};
	case ("_kontema2"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_2";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_2";
_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	case ("_kontema3"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_3";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_3";

_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	case ("_kontema4"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_4";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_4";
_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;

};
	case ("_kontema5"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_5";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_5";

_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	case ("_kontema6"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_6";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_6";
_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;


};
	case ("_kontema7"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_7";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_7";

_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	case ("_kontema8"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_8";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_8";

_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	case ("_kontema9"):
	{_mrkSpawnkonbasla = getMarkerPos "konvoybasla_9";
_mrkSpawnkonbitis = getMarkerPos "konvoybitis_9";

_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	sleep 2;
	_null = [west, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak imha edin.Kimseyi sağ bırakmayın.", "Konvoy Baskını", "Konvoy Baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
//////////////////////////
_pos1=[getmarkerpos _markerKO,[0,5],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos2=[getmarkerpos _markerKO,[15,15],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos3=[getmarkerpos _markerKO,[25,25],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos4=[getmarkerpos _markerKO,[35,35],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos5=[getmarkerpos _markerKO,[45,45],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos6=[getmarkerpos _markerKO,[55,55],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
_pos7=[getmarkerpos _markerKO,[65,65],0,0,[1,5],"O_Truck_03_ammo_F"] call SHK_pos;
sleep 1;
///////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle _pos1;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle _pos2;
sleep 1;
null="I_soldier_F" createUnit [ _pos1, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ _pos2, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;
/////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle _pos3;
sleep 1;
_grptim1 = [_pos3, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
////////////////////////////////////////////////////
_timaraci2 = "I_Truck_02_covered_F" createVehicle _pos4;
sleep 1;
_grptim2 = [_pos4, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci2} forEach units _grptim2;
sleep 1;
/////////////////////////////////////////////////////////
_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos5, 180, _arac1, _grpkonvoy] call bis_fnc_spawnvehicle;
_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] call BIS_fnc_selectRandom;
[_pos6, 180, _arac2, _grpkonvoy] call bis_fnc_spawnvehicle;
/////////////////////////////////////////////////////////
_timaraci3 = "I_Truck_02_covered_F" createVehicle _pos7;
sleep 1;
_grptim3 = [_pos7, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci3} forEach units _grptim3;
{_x moveInCargo _timaraci3} forEach units _grptim3;
sleep 5;
//////////////////////////////////////////////////////////
[_grpsf1] joinSilent _grpkonvoy;
sleep 1;
[_grpsf2] joinSilent _grpkonvoy;
sleep 1;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
[_grptim3] joinSilent _grpkonvoy;

//////////////////////////////////////////////////////////////

sleep 2;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
sleep 5;
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
sleep 5;
//_grpkonvoy setCurrentWaypoint [_grpkonvoy, 0];

//_grpkonvoy allowFleeing 0;
/////////////////////////////////////////////////////////////
sleep 5;
waitUntil {{alive _x} count units _grpkonvoy < 3};
////////////////////////////////////////////////////////////
deleteMarker _markerKO;
deleteMarker _markerKO2;

{deleteVehicle _x} forEach units _grpsf1;
	deleteGroup _grpsf1;
	
	{deleteVehicle _x} forEach units _grpsf2;
	deleteGroup _grpsf2;

	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grpkonvoy;
	deleteGroup _grpkonvoy;

/////////////////////////////////////////////////////////////
[west, "mob_konbasla"] call LARs_fnc_removeTask;sleep 5;
////////////////////////////////////////////////////////////
_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
};
	};