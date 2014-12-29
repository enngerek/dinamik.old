﻿//////////////////////////////////////
//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////
if (! isServer) exitWith {};

_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_makmarkerarray = ["MAK","MAK_1","MAK_2","MAK_3","MAK_4","MAK_5"] ;
_maksecilenarray = _makmarkerarray call BIS_fnc_selectRandom;
_makmarkerArray = _makmarkerArray - [_maksecilenarray];
_mrkSpawnPos = getMarkerPos _maksecilenarray;

	//hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO2 = createMarker ["mob_pilotrescue", _mrkSpawnPos];
	_markerSO2 setMarkerShape "ellipse";
	_markerSO2 setMarkerColor "ColorRed";
	_markerSO2 setMarkerText "Muharebe Arama Kurtarma";
	_markerSO2 setMarkerSize [800,800];
	
	_null = [player, "mob_pilotrescue", ["Hava Kuvvetlerimize ait bir uçak vurularak düşürülmüştür.Bölgeden gelen istihbarata göre Düşman Kuvvetleride Pilotumuzu aramaktadır.Pilotu Düşmandan önce bulup üsse geri getirin", "Pilot MAK", "Pilot MAK"], getMarkerPos "mob_pilotrescue", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_pilotrescue", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerSO2,[0,800],random 360,0,[1,250],"B_Plane_CAS_01_F"] call SHK_pos;
 	_wreck = createVehicle ["B_Plane_CAS_01_F", _newPos, [], 0, "CAN_COLLIDE"];
	_wreck setDammage 1;
		
	sleep 5;
	
	_newPos2 = [_wreck,[200,300],random 360,0,[1,250],"B_Pilot_F"] call SHK_pos;
	
	_pilotgrp = createGroup WEST;
	_pilot1 = _pilotgrp createUnit ["B_Pilot_F", _newPos2, [], 0, "NONE"];
	_pilot1 allowDamage false;
	_pilot1 disableAI "MOVE";
	_pilot1 disableAI "ANIM";
	_pilot1 setunitpos "middle";
	_pilot1 setcaptive true;
	removeAllWeapons _pilot1;
	removeHeadgear _pilot1;
	removeBackpack _pilot1;
	removeGoggles _pilot1;
	eskortet = _pilot1;
	publicVariable "eskortet";
	
	_markerpilot = createMarker ["pilotmarker", getPos _pilot1];
	_markerpilot setMarkerType "b_plane";
	_markerpilot setMarkerColor "ColorBlue";
	_markerpilot setMarkerSize [0.7,0.7];
	
	_IRgren = createVehicle ["B_IRStrobe", _newPos2, [], 0, "NONE"];
	
	sleep 5;
	
	_grp1S = [getPos _wreck, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	
	_grp2S = [getPos _wreck, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	
	_grp1Ss = [getPos _wreck, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp1Ss,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	
	_helo2 = createGroup resistance;
	[_newPos2, 10, "I_Heli_Transport_02_F", _helo2] call BIS_fnc_spawnvehicle;
	nul = [_helo2,getPos _wreck, 700] call BIS_fnc_taskPatrol;
	
	waitUntil { _pilot1 distance getMarkerPos "tabus" < 100 };
	
	[_pilot1] join grpNull;
	
	null = ["mob_pilotrescue", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerSO2;
	deleteMarker _markerpilot;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp1Ss;
	{deleteVehicle _x} forEach units _grp2S;
	//{deleteVehicle _x} forEach units _grp2Ss;
	{deleteVehicle _x} forEach units _helo2;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	//deleteGroup _grp2Ss;
	deleteGroup _helo2;
	deleteVehicle _wreck;
	deleteVehicle _pilot1;
	deleteGroup _pilotgrp;
	deleteVehicle  (nearestobject [_newPos2,"nvg_targetC"]);

	_myHint ="Tebrikler Pilotumuz Güven İçinde Karargaha Ulaştı!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	nul = [] execVM "gorev.sqf";
	[west, "mob_pilotrescue"] call LARs_fnc_removeTask;
nul = [] execVM "gorev.sqf";