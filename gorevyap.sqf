

_gorevtipi = [_this, 0, ""] call BIS_fnc_param;

sleep random 15;

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

fn_engerek_tibbitahliyegoreviyap={

_markerarraytibbitah = ["tıbbitah_1","tıbbitah_2","tıbbitah_3","tıbbitah_4","tıbbitah_5","tıbbitah_6","tıbbitah_7","tıbbitah_8","tıbbitah_9","tıbbitah_10"] ;
_secilenarraytibbitah = _markerarraytibbitah call BIS_fnc_selectRandom;
_markerarraytibbitah=_markerarraytibbitah - [_secilenarraytibbitah];
_mrkSpawngorevtibbitah = getMarkerPos _secilenarraytibbitah;

//_mrkSpawngorevtibbitah = getMarkerPos "tıbbitah_1";

_markergO = createMarker ["_mob_tibbitahliye", _mrkSpawngorevtibbitah];
	_markergO setMarkerType "mil_objective";
	_markergO setMarkerColor "ColorBlue";
	_markergO setMarkerText "SUPPORT OP";
	_markergO setMarkerSize [1,1];
	
	_null = [west, "_mob_tibbitahliye", ["Evac the wounded from the AO and bring it to MASH in Loy Manara AB", "MEDEVAC", "MEDEVAC"], getMarkerPos "_mob_tibbitahliye", false] spawn BIS_fnc_taskCreate;
	_null = ["_mob_tibbitahliye", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	
	_aracsec = ["B_MRAP_01_gmg_F","B_MRAP_01_F","B_Truck_01_transport_F"] call BIS_fnc_selectRandom;
	
	_arac = createVehicle [_aracsec,[(getMarkerpos _markergO select 0) + 3, getMarkerpos _markergO select 1,0],[], 0, "NONE"];
	_arac setDammage 0.8;
	_arac allowDamage false;
	_arac setFuel 0;
	
	_grp = createGroup WEST;
	_yarali = _grp createUnit ["B_Soldier_F",[(getMarkerpos _markergO select 0) + 10, getMarkerpos _markergO select 1,0], [], 0, "NONE"];
	_yarali allowDamage false;
	removeallweapons _yarali;
	_yarali setCaptive true;
	_yarali setHit ["hands",1];
	_yarali setHit ["head_hit",0.4];
	_yarali setHit ["body",0.5];
	_yarali playMoveNow "AinjPpneMstpSnonWrflDnon";
	_yarali disableAI "MOVE";
	_yarali disableAI "ANIM";
////////////////////////////////////////////////	
//_ambulans=createVehicle ["B_Heli_Light_01_F", getMarkerpos "oparaclari" , [], 0, "NONE"];
	
/////////////////////////////////////
[[_yarali],"fnc_rec_tibbitahliye",true,true] spawn BIS_fnc_MP;
////////////////////////////////////////////////	
	_tim1 = [getMarkerPos _markergO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	sleep 1;nul = [_tim1,getPos _arac, 150] call BIS_fnc_taskPatrol;
	
	_tim2 = [getMarkerPos _markergO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	sleep 1;nul = [_tim2,getPos _arac, 150] call BIS_fnc_taskPatrol;
	
	//waitUntil { _yarali distance getPos _ambulans < 10 };
	
	_myHint ="Yaralı kişi arac bindirildi";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;
	
	waitUntil { _yarali distance getMarkerPos "tabus" < 50 };
	
	[_yarali] join grpNull;
	
	null = ["_mob_tibbitahliye", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markergO;
	{deleteVehicle _x} forEach units _tim1;
	{deleteVehicle _x} forEach units _tim2;
	deleteGroup _tim1;
	deleteGroup _tim2;
	deleteVehicle _arac;
	deleteVehicle _yarali;
	deleteGroup _grp;

	_myHint ="Tebrikler ! Görev tamamlandı";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Görev Tamam";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "_mob_tibbitahliye"] call LARs_fnc_removeTask;

};

fn_engerek_konvoygoreviyap={

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

};


fn_engerek_kasabagoreviyap={

_markerarray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9","town_10","town_11","town_12","town_13","town_14"] ;
_secilenarray = _markerarray call BIS_fnc_selectRandom;
_markerArray=_markerArray - [_secilenarray];
_mrkSpawnTown = getMarkerPos _secilenarray;

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
	
	sleep 1;
	
	_mhq = createVehicle ["O_Truck_03_covered_F", _newPos,[], 0, "NONE"];
	//_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _mhq, [], 0, "CAN_COLLIDE"];
	

	_newPos2 = [getmarkerpos _markerCO,[0,30],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos3 = [getmarkerpos _markerCO,[30,100],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos4 = [getmarkerpos _markerCO,[100,150],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_newPos5 = [getmarkerpos _markerCO,[150,200],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	
	//_aracarrayind=["I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_Truck_02_box_F","I_Truck_02_transport_F"];
	//_aracarrayeast=["O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F"];
	//_secilenaracind1=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaracind2=_aracarrayind call BIS_fnc_selectRandom;
	//_secilenaraceast1=_aracarrayeast call BIS_fnc_selectRandom;
	//_secilenaraceast2=_aracarrayeast call BIS_fnc_selectRandom;
		
	_ifv1 = createGroup resistance;
	sleep 2;
	[_newPos2, 10, "I_G_Offroad_01_armed_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 2;
	[_newPos3, 10, "I_G_Offroad_01_armed_F", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 2;
	_ifv2 = createGroup EAST;
	[_newPos4, 10, "O_G_Offroad_01_armed_F", _ifv2] call BIS_fnc_spawnvehicle;
	sleep 2;
	[_newPos5, 10, "O_G_Offroad_01_armed_F", _ifv2] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	sleep 2; = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	sleep 2; = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]

] call BIS_fnc_spawnGroup;
	sleep 2; = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	
waitUntil {{{alive _x && (_x distance _mhg < 700)}count units _x == 0}count [_grp1C,_grp2C,_grp3C,] == 3};


	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 5;

	deleteMarker _markerCO;

	deleteVehicle _mhq;

	deleteVehicle _trg;

	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	{deleteVehicle _x} forEach units _ifv2;
	deleteGroup _ifv1;
	deleteGroup _ifv2;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
	
	sleep 5;

};

fn_engerek_rehinegoreviyap ={

_rehmarkerarray = ["rehin_1","rehin_1","rehin_2","rehin_3","rehin_4","rehin_5","rehin_6","rehin_7","rehin_8","rehin_9","rehin_10"] ;
_rehsecilenarray = _rehmarkerarray call BIS_fnc_selectRandom;
_rehmarkerarray = _rehmarkerarray - [_rehsecilenarray];
_rehmrkSpawnPos = getMarkerPos _rehsecilenarray;

	_markerGO = createMarker ["mob_rehine", _rehmrkSpawnPos];
	_markerGO setMarkerType "hd_warning";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerText " Rehine Durumu";
	_markerGO setMarkerSize [0.7,0.7];
	
	sleep 2;
	
	_null = [west, "mob_rehine", ["Rehin alınan gazeteciyi kurtarın", "Rehineyi Kurtar", "Rehineyi Kurtar"], getMarkerPos "mob_rehine", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rehine", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;
	_newPos = [getmarkerpos _markerGO,[0,200],random 360,0,[0,200],"C_journalist_F"] call SHK_pos;
		
	sleep 2;
	
	
	_grprehine = createGroup civilian;
	_rehine1 = _grprehine createUnit ["C_journalist_F", _newPos, [], 0, "NONE"];
	sleep 3;
	_rehine1 allowDamage false;
	_rehine1 setunitpos "middle";
	_rehine1 disableAI "MOVE";
	_rehine1 disableAI "ANIM";
	nul = [getpos _rehine1,[_rehine1],250,0,[],false,false] execVM "shk_buildingpos.sqf";
	sleep 3;
	_Posmarkeralan = [getpos _rehine1,[0,50],random 360,0,[0,20],"C_journalist_F"] call SHK_pos;
	sleep 5;
	_markerGO2 = createMarker ["mob_rehinealan", _Posmarkeralan];
	_markerGO2 setMarkerShape "ellipse";
	_markerGO2 setMarkerColor "Colorred";
	_markerGO2 setMarkerBrush "BORDER";
	_markerGO2 setMarkerText " İstihbarata göre rehine buralarda bir yerde";
	_markerGO2 setMarkerSize [100,100];
	
		[[_rehine1],"fnc_rec_rehinekurtar",true,true] spawn BIS_fnc_MP;
	
	_markerrehine = createMarker ["rehinemarker", getPos _rehine1];
	_markerrehine setMarkerType "hd_dot";
	_markerrehine setMarkerColor "ColorBlue";
	_markerrehine setMarkerSize [0.7,0.7];
	
	//_IRgren = createVehicle ["B_IRStrobe", _newPos2, [], 0, "NONE"];
	
	sleep 2;
	_korumapos=[getPos _rehine1,[0,30],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	sleep 2;
	_korumapos1=[getPos _rehine1,[0,40],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	sleep 2;
	_korumapos2=[getPos _rehine1,[0,50],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	
	sleep 5;
	
	
_grptim1 = [_korumapos, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 1;
nul=[_grptim1, getPos _rehine1] call BIS_fnc_taskDefend;
sleep 1;
_grptim2= [_korumapos1, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 2;
nul = [_grptim2,getPos _rehine1, 50] call BIS_fnc_taskPatrol;
sleep 2;
_grptim3 = [_korumapos2, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 2;
nul = [_grptim3,getPos _rehine1, 100] call BIS_fnc_taskPatrol;
sleep 1;

_aracpos1 = [getpos _rehine1,[0,200],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 2;
_aracpos2 = [getpos _rehine1,[0,200],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 2;


_arac3=["I_G_Offroad_01_armed_F","I_HMG_01_high_F","I_GMG_01_high_F"] call BIS_fnc_selectRandom;
_arac4=["I_G_Offroad_01_armed_F","I_HMG_01_high_F","I_GMG_01_high_F"] call BIS_fnc_selectRandom;
	
	_grptim4 = createGroup resistance;
	sleep 1;
	[_aracpos1, 10, "I_G_Offroad_01_armed_F", _grptim1] call BIS_fnc_spawnvehicle;
	sleep 2;
		
	sleep 2;
	[_aracpos2, 10, "I_G_Offroad_01_armed_F", _grptim2] call BIS_fnc_spawnvehicle;
	sleep 2;
	
	[_korumapos1, 10, _arac3, _grptim3] call BIS_fnc_spawnvehicle;
	sleep 2;
	[_korumapos2, 10, _arac3, _grptim4] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_grptim4,getPos _rehine1, 100] call BIS_fnc_taskPatrol;
	sleep 2;
	
	waitUntil { _rehine1 distance getMarkerPos "tabus" < 100 and {{alive _x && (_x distance _rehine1 < 500)}count units _x == 0}count [_grptim1,_grptim2,_grptim3] == 3};
	
	[_rehine1] join grpNull;
	
	null = ["mob_rehine", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep random 10;
	
	deleteMarker _markerGO;
		deleteMarker _markerGO2;
			deleteMarker _markerrehine;
	
	deleteVehicle _rehine1;
	
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim4;
	deleteGroup _grptim4;
	
		
	_myHint ="Tebrikler Rehine Güven İçinde Karargaha Ulaştı!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	sleep 5;
	
	[west, "mob_rehine"] call LARs_fnc_removeTask;
};


fn_engerek_denizaltigoreviyap ={

_damarkerarray = ["da","da_1","da_2","da_3","da_4","da_5"] ;
_dasecilenarray = _damarkerarray call BIS_fnc_selectRandom;
_damarkerarray=_damarkerarray - [_dasecilenarray];
_damrkSpawnTown = getMarkerPos _dasecilenarray;
sleep 1;

    _markerGO = createMarker ["mob_da", _damrkSpawnTown];
	_markerGO setMarkerType "o_naval";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerText " Denizaltı sabotaj";
	_markerGO setMarkerSize [1,1];
	
	sleep 2;
	
	_null = [west, "mob_da", ["Düşmana ait bir denizaltının liman yakınında olduğuna dair istihbarat alnmıştır.Denizaltıyı imha edin.", "Denizaltı sabotaj", "Denizaltı sabotaj"], getMarkerPos "mob_da", false] spawn BIS_fnc_taskCreate;
	sleep 2;
	_null = ["mob_da", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;
	_denizalti = createVehicle ["Submarine_01_F", getmarkerpos _markerGO,[], 0, "NONE"];
	sleep 2;
	
	[[_denizalti],"fnc_rec_daimha",true,true] spawn BIS_fnc_MP;
	
	_grpdevboat1 = createGroup resistance;
	
	sleep 2;
	_possu1= [getmarkerpos _markerGO,[10,50],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	[_possu1, 25, "I_Boat_Armed_01_minigun_F", _grpdevboat1] call BIS_fnc_spawnvehicle;
	sleep 2;
	
	
	_possu2= [getmarkerpos _markerGO,[50,100],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	[_possu2, 25, "I_Boat_Armed_01_minigun_F", _grpdevboat1] call BIS_fnc_spawnvehicle;
	
	
	_possu3= [getmarkerpos _markerGO,[100,150],random 360,2,[],"I_Boat_Armed_01_minigun_F"] call SHK_pos;
	sleep 2;
	_aracsec1=["I_Boat_Armed_01_minigun_F","I_Heli_light_03_F"] call BIS_fnc_selectRandom;
	sleep 2;
	[_possu2, 25, _aracsec1, _grpdevboat1] call BIS_fnc_spawnvehicle;
	
	_sudev=[getPos _denizalti, 10, 300, 20, 2, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	
	nul = [_grpdevboat1,_sudev, 100] call BIS_fnc_taskPatrol;
	
	
	_poskara=[getmarkerpos _markerGO,[150,500],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	
	
	sleep 3;
	_grpdiver= [getpos _denizalti, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	
	_grptim1 = [_poskara, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim2 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim3 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	_grptim4 = [_poskara, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 5;
	_karadev=[getmarkerpos _markerGO,[10,250],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 5;
	nul = [_grptim1,_karadev, 100] call BIS_fnc_taskPatrol;
	nul = [_grptim2,_karadev, 100] call BIS_fnc_taskPatrol;
	nul = [_grptim3,_karadev, 150] call BIS_fnc_taskPatrol;
	nul = [_grptim4,_karadev, 150] call BIS_fnc_taskPatrol;
	
	_arac1pos=[getmarkerpos _markerGO,[100,250],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac1pos, 180, _arac1, _grptim1] call bis_fnc_spawnvehicle;
	sleep 2;
	_arac2pos=[getmarkerpos _markerGO,[100,250],random 360,0,[1,200],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
	sleep 2;
	_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Truck_02_covered_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
	
	waitUntil {{{alive _x && (_x distance _denizalti < 500)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4 and !alive _denizalti};
	
	_null = ["mob_da", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	deleteMarker _markerGO;
	//deleteMarker _markerpilot;
	deleteVehicle _denizalti;
	//deleteVehicle _IRgren;
	//deleteVehicle _pilot1;
	{deleteVehicle _x} forEach units _grpdevboat1;
	deleteGroup _grpdevboat1;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim4;
	deleteGroup _grptim4;
	{deleteVehicle _x} forEach units _grpdiver;
	deleteGroup _grpdiver;
	sleep random 15;
	_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_da"] call LARs_fnc_removeTask;

};

fn_engerek_makgoreviyap = {



sleep 1;

_makmarkerarray = ["MAK","MAK_1","MAK_2","MAK_3","MAK_4","MAK_5"] ;
_maksecilenarray = _makmarkerarray call BIS_fnc_selectRandom;
_makmarkerArray = _makmarkerArray - [_maksecilenarray];
_mrkSpawnPos = getMarkerPos _maksecilenarray;

	 
	_markerGO = createMarker ["mob_mak", _mrkSpawnPos];
	_markerGO setMarkerShape "ellipse";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerBrush "BORDER";
	_markerGO setMarkerText "Muharebe Arama Kurtarma";
	_markerGO setMarkerSize [700,700];
	
	sleep 2;
	
	_null = [west, "mob_mak", ["Hava Kuvvetlerimize ait bir araç vurularak düşürülmüştür.Bölgeden gelen istihbarata göre Düşman Kuvvetleride Pilotumuzu aramaktadır.Pilotu Düşmandan önce bulup üsse geri getirin", "Muharebe Arama Kurtarma", "Muharebe Arama Kurtarma"], getMarkerPos "mob_mak", false] spawn BIS_fnc_taskCreate;
	sleep 1;
	_null = ["mob_mak", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 1;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerGO,[0,600],random 360,0,[0,200],"B_Plane_CAS_01_F"] call SHK_pos;
	sleep 1;
	_wrecksec = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Plane_CAS_01_F"] call ws_fnc_selectRandom;
	sleep 2;
 	_wreck = createVehicle [_wrecksec, _newPos, [], 0, "NONE"];
	sleep 2;
	_wreck setDammage 0.8;
		
	sleep 1;
	
	_newPos1 = [_wreck,[100,150],random 360,0,[1,200],"B_Pilot_F"] call SHK_pos;
	sleep 1;
	
	_pilotgrp = createGroup WEST;
	_pilot1 = _pilotgrp createUnit ["B_Pilot_F", _newPos1, [], 0, "NONE"];
	sleep 2;
	_pilot1 allowDamage false;
	_pilot1 setunitpos "middle";
	_pilot1 disableAI "MOVE";
	_pilot1 disableAI "ANIM";
	_pilot1 setcaptive true;
	removeAllWeapons _pilot1;
	removeHeadgear _pilot1;
	removeBackpack _pilot1;
	removeGoggles _pilot1;
	
	[[_pilot1],"fnc_rec_rehkurtar",true,true] spawn BIS_fnc_MP;
	
	_markerpilot = createMarker ["pilotmarker", getPos _wreck];
	_markerpilot setMarkerType "b_plane";
	_markerpilot setMarkerColor "ColorBlue";
	_markerpilot setMarkerSize [0.7,0.7];
	
	_IRgren = createVehicle ["B_IRStrobe", _newPos, [], 0, "NONE"];
	
	sleep 1;
	
	_postim=[getPos _wreck, 100, 150, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 1;
	
	_grptim1 = [_postim, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim2 = [_postim, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim3 = [_postim, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	_grptim4 = [_postim, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 5;
	nul = [_grptim1,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	nul = [_grptim2,getPos _wreck, 200] call BIS_fnc_taskPatrol;
	nul = [_grptim3,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	nul = [_grptim4,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	
	_arac1pos=[getPos _wreck, 100, 150, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac1pos, 180, _arac1, _grptim1] call bis_fnc_spawnvehicle;
	sleep 2;
	_arac2pos=[getPos _wreck, 100, 200, 20, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Truck_02_covered_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nl=[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
	
	waitUntil { _pilot1 distance getMarkerPos "tabus" < 100 and {{alive _x && (_x distance _wreck < 1000)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4};
	
	[_pilot1] join grpNull;
	
	null = ["mob_mak", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 5;
	
	deleteMarker _markerGO;
	deleteMarker _markerpilot;
	deleteVehicle _wreck;
	deleteVehicle _IRgren;
	deleteVehicle _pilot1;
	{deleteVehicle _x} forEach units _pilot1;
	deleteGroup _pilotgrp;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim4;
	deleteGroup _grptim4;
	
	//deleteVehicle  (nearestobject [_newPos2,"nvg_targetC"]);
sleep random 15;
	_myHint ="Tebrikler ! Pilotumuz Güven İçinde Karargaha Ulaştı!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_mak"] call LARs_fnc_removeTask;
	sleep 5;


};

	
fn_engerek_uavgoreviyap = {
	
_uavmarkerarray = ["uav","uav_1","uav_2","uav_3","uav_4","uav_5"] ;
_uavsecilenarray = _uavmarkerarray call BIS_fnc_selectRandom;
_uavmarkerArray=_uavmarkerArray - [_uavsecilenarray];
_mrkSpawnPos = getMarkerPos _uavsecilenarray;

	_markerGO = createMarker ["mob_uav", _mrkSpawnPos];
	_markerGO setMarkerShape "ellipse";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerBrush "BORDER";
	_markerGO setMarkerText "UAV kara kutusunu ele geçir";
	_markerGO setMarkerSize [700,700];
	
	sleep 5;
	
	_null = [west, "mob_uav", ["Düşmana ait bir insansız hava aracı düşürülmüştür.Derhal bölgeye intikal ediniz.Aracın harddiskini kopyaladıktan sonra aracı İmha ederek bölgedeki düşman unsurları temizleyin.", "UAV kara kutusunu ele geçir", "UAV kara kutusunu ele geçir"], getMarkerPos "mob_uav", false] spawn BIS_fnc_taskCreate;
	sleep 1;
	_null = ["mob_uav", "CREATED"] spawn BIS_fnc_taskSetState;
	
	_newPos = [getmarkerpos _markerGO,[0,600],random 360,0,[1,250],"O_UAV_02_F"] call SHK_pos;
	sleep 2;
	_uav = "O_UAV_02_F" createVehicle _newPos;
	sleep 2;
	_uav setDammage 0.3;
	[[_uav ],"fnc_rec_uavdata",true,true] spawn BIS_fnc_MP;
	sleep 1;
	_markeruav = createMarker ["uavmarker", getPos _uav];
	_markeruav setMarkerType "o_uav";
	_markeruav setMarkerColor "ColorRed";
	_markeruav setMarkerSize [0.7,0.7];
	
	_newPos2 = [_uav,[20,100],random 360] call SHK_pos;  sleep 3;
	
	_grptim1 = [_newPos2, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim2 = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim3 = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	_grptim4 = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 5;
	nul = [_grptim1,getPos _uav, 300] call BIS_fnc_taskPatrol;
	nul = [_grptim2,getPos _uav, 200] call BIS_fnc_taskPatrol;
	nul = [_grptim3,getPos _uav, 150] call BIS_fnc_taskPatrol;
	nul = [_grptim4,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	_arac1pos=[getPos _uav, 100, 150, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac1pos, 180, _arac1, _grptim1] call bis_fnc_spawnvehicle;
	sleep 2;
	_arac2pos=[getPos _uav, 100, 200, 20, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Truck_02_covered_F"] call BIS_fnc_selectRandom;
	sleep 2;
	nul=[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
		
	sleep 10;
	waitUntil {{{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4 and !alive _uav};
	
	_null = ["mob_uav", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	sleep 5;

	deleteMarker _markerGO;
	deleteMarker _markeruav;
	deleteVehicle _uav;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim3;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim4;
	deleteGroup _grptim4;
	sleep random 15;
	_myHint ="Tebrikler! GÖREV TAMAMLANDI";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Tebrikler!";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_uav"] call LARs_fnc_removeTask;sleep 5;

};
_gorevdetay = switch (_gorevtipi) do {
	case "uavbul": {call fn_engerek_uavgoreviyap;};
	case "mak": {call fn_engerek_makgoreviyap;};
	case "denizalti": {call fn_engerek_denizaltigoreviyap;};
	case "rehine": {call fn_engerek_rehinegoreviyap;};
	case "kasaba": {call fn_engerek_kasabagoreviyap;};
	case "konvoy": {call fn_engerek_konvoygoreviyap;};
	case "tibbitahliye": {call fn_engerek_tibbitahliyegoreviyap;};

	
};	
nul = [] execVM "gorevsec.sqf"; 