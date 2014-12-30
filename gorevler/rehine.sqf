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

sleep 10;

_rehmarkerarray = ["rehin","rehin_1"] ;
_rehsecilenarray = _rehmarkerarray call BIS_fnc_selectRandom;
_rehmarkerarray = _rehmarkerarray - [_rehsecilenarray];
_rehmrkSpawnPos = getMarkerPos _rehsecilenarray;

	//hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerREH = createMarker ["mob_rehine", _rehmrkSpawnPos];
	_markerREH setMarkerShape "ellipse";
	_markerREH setMarkerColor "ColorYellow";
	_markerREH setMarkerText " Rehine Durumu";
	_markerREH setMarkerSize [300,300];
	
	_null = [player, "mob_rehine", ["Rehin Alınan gazeteciyi kurtarın", "Rehineyi kurtar", "Rehineyi kurtar"], getMarkerPos "mob_rehine", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rehine", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	//_newPos = [getmarkerpos _markerREH,[0,400],random 360,0] call SHK_pos;
	_newPos = getmarkerpos "mob_rehine";
 	//_wreck = createVehicle ["B_Plane_CAS_01_F", _newPos, [], 0, "CAN_COLLIDE"];
	//_wreck setDammage 1;
	
		
	sleep 5;
	
	//_newPos2 = [_wreck,[200,300],random 360,0,[0,250],"B_Pilot_F"] call SHK_pos;
	
	_pilotgrp = createGroup civilian;
	_rehine1 = _pilotgrp createUnit ["C_journalist_F", _newPos, [], 0, "NONE"];
	_rehine1 allowDamage false;
	//nul = [getMarkerPos "mob_rehine",_rehine1,400,0] execVM "shk_buildingpos.sqf";
	nul = [getpos _rehine1,_rehine1,20,0,[],true,true,[]] execVM "shk_buildingpos.sqf";
	//_rehine1 disableAI "MOVE";
	//_rehine1 disableAI "ANIM";
	//_rehine1 setunitpos "middle";
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
	
	sleep 5;
	_korumapos=[getmarkerpos _markerDA,[0,50],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	_korumapos1=[getmarkerpos _markerDA,[0,100],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	_korumapos2=[getmarkerpos _markerDA,[0,75],random 360,0,[],"B_MRAP_01_F"] call SHK_pos;
	
	//_grp1S = [_korumapos, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	//nul = [_grp1S,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	
	//_grp2S = [getPos _wreck, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	//nul = [_grp2S,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	
	//_grp1Ss = [getPos _wreck, independent, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	//nul = [_grp1Ss,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	
	//_helo2 = createGroup resistance;
	//[_newPos2, 10, "I_Heli_Transport_02_F", _helo2] call BIS_fnc_spawnvehicle;
	//nul = [_helo2,getPos _wreck, 700] call BIS_fnc_taskPatrol;
	
	waitUntil { _rehine1 distance getMarkerPos "tabus" < 100 };
	
	[_rehine1] join grpNull;
	
	null = ["mob_rehine", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerREH;
	deleteMarker _markerrehine;
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
	deleteVehicle _rehine1;
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
	[west, "mob_rehine"] call LARs_fnc_removeTask;
nul = [] execVM "gorev.sqf";
