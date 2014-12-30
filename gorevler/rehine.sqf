//////////////////////////////////////
//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////
if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 2;

_rehmarkerarray = ["rehin_1","rehin_1","rehin_2","rehin_3","rehin_4","rehin_5","rehin_6","rehin_7","rehin_8","rehin_9","rehin_10"] ;
_rehsecilenarray = _rehmarkerarray call BIS_fnc_selectRandom;
_rehmarkerarray = _rehmarkerarray - [_rehsecilenarray];
_rehmrkSpawnPos = getMarkerPos _rehsecilenarray;

	//hint "UPDATED SUPPORT OPS";
	//creating the marker 
	sleep 2;

	_markerREH = createMarker ["mob_rehine", _rehmrkSpawnPos];
	_markerREH setMarkerShape "ellipse";
	_markerREH setMarkerColor "ColorYellow";
	_markerREH setMarkerText " Rehine Durumu";
	_markerREH setMarkerSize [300,300];
	
	sleep 2;
	
	_null = [player, "mob_rehine", ["Rehin Alınan gazeteciyi kurtarın", "Rehineyi kurtar", "Rehineyi kurtar"], getMarkerPos "mob_rehine", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rehine", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 5;

	//creating the vehicle
	
	//_newPos = [getmarkerpos _markerREH,[0,400],random 360,0] call SHK_pos;
	_newPos = getmarkerpos "mob_rehine";
 	//_wreck = createVehicle ["B_Plane_CAS_01_F", _newPos, [], 0, "CAN_COLLIDE"];
	//_wreck setDammage 1;
	
		
	sleep 2;
	
	//_newPos2 = [_wreck,[200,300],random 360,0,[0,250],"B_Pilot_F"] call SHK_pos;
	
	_pilotgrp = createGroup civilian;
	_rehine1 = _pilotgrp createUnit ["C_journalist_F", _newPos, [], 0, "NONE"];
	_rehine1 allowDamage false;
	sleep 3;
	//nul = [getMarkerPos "mob_rehine",_rehine1,400,0] execVM "shk_buildingpos.sqf";
	nul = [getpos _rehine1,[_rehine1],300,0,[],false,false] execVM "shk_buildingpos.sqf";
	sleep 3;
	_rehine1 setunitpos "middle";
	_rehine1 disableAI "MOVE";
	_rehine1 disableAI "ANIM";
	
	//_rehine1 setcaptive true;
	//removeAllWeapons _rehine1;
	//removeHeadgear _rehine1;
	//removeBackpack _rehine1;
	//removeGoggles _rehine1;
	
	sleep 2;
	eskortet = _rehine1;
	publicVariable "eskortet";
	
	_markerrehine = createMarker ["rehinemarkerr", getPos _rehine1];
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
	
	
_grpr1 = [_korumapos, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 2;
//nul = [_grpr1,getPos _rehine1, 20] call BIS_fnc_taskPatrol;
nul=[_grpr1, getPos _rehine1] call BIS_fnc_taskDefend;
sleep 1;
_grpr2 = [_korumapos1, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 2;
nul = [_grpr2,getPos _rehine1, 30] call BIS_fnc_taskPatrol;
sleep 2;
_grpr3 = [_korumapos2, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]] call BIS_fnc_spawnGroup;
sleep 2;
nul = [_grpr3,getPos _rehine1, 50] call BIS_fnc_taskPatrol;
sleep 1;

_aracpos1 = [getmarkerpos "mob_rehine",[0,300],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 2;
_aracpos2 = [getmarkerpos "mob_rehine",[0,300],random 360,0,[1,250]," O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 2;

	
	_arac1 = createGroup resistance;
	sleep 1;
	[_aracpos1, 10, "I_G_Offroad_01_armed_F", _arac1] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_arac1,getPos _rehine1, 300] call BIS_fnc_taskPatrol;
	
	_arac2 = createGroup resistance;
	sleep 2;
	[_aracpos2, 10, "I_G_Offroad_01_armed_F", _arac2] call BIS_fnc_spawnvehicle;
	sleep 2;
	nul = [_arac2,getPos _rehine1, 300] call BIS_fnc_taskPatrol;
	
	sleep 2;
	
	waitUntil { _rehine1 distance getMarkerPos "tabus" < 100 };
	
	[_rehine1] join grpNull;
	
	null = ["mob_rehine", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerREH;
	deleteMarker _markerrehine;
	{deleteVehicle _x} forEach units _grpr1;
	{deleteVehicle _x} forEach units _grpr2;
	{deleteVehicle _x} forEach units _grpr3;
	{deleteVehicle _x} forEach units _arac1;
	{deleteVehicle _x} forEach units _arac2;
	deleteGroup _grpr1;
	deleteGroup _grpr2;
	deleteGroup _grpr3;
	deleteGroup _arac1;
	deleteGroup _arac2;
	deleteVehicle _rehine1;
	deleteGroup _pilotgrp;
	
	_myHint ="Tebrikler Rehine Güven İçinde Karargaha Ulaştı!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	nul = [] execVM "gorev.sqf";
	[west, "mob_rehine"] call LARs_fnc_removeTask;
	sleep 10;
nul = [] execVM "gorev.sqf";
