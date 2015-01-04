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
	
	_null = [west, "mob_mak", ["Hava Kuvvetlerimize ait bir araç vurularak düşürülmüştür.Bölgeden gelen istihbarata göre Düşman Kuvvetleride Pilotumuzu aramaktadır.Pilotu Düşmandan önce bulup üsse geri getirin", "Muharebe Arama Kurtarma", "Muharebe Arama Kurtarma"], getMarkerPos "mob_mak", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_mak", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	_newPos = [getmarkerpos _markerGO,[0,600],random 360,0,[0,200],"B_Plane_CAS_01_F"] call SHK_pos;
	sleep 1;
	_wrecksec = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Plane_CAS_01_F"] call ws_fnc_selectRandom;
	sleep 2;
 	_wreck = createVehicle [_wrecksec, _newPos, [], 0, "NONE"];
	sleep 2;
	_wreck setDammage 1;
		
	sleep 1;
	
	_newPos2 = [_wreck,[200,300],random 360,0,[1,200],"B_Pilot_F"] call SHK_pos;
	sleep 1;
	
	_pilotgrp = createGroup WEST;
	_pilot1 = _pilotgrp createUnit ["B_Pilot_F", _newPos2, [], 0, "NONE"];
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
	
	_IRgren = createVehicle ["B_IRStrobe", _newPos2, [], 0, "NONE"];
	
	sleep 5;
	
	_grptim1 = [_newPos1, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim2 = [_newPos1, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	_grptim3 = [_newPos1, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	_grptim4 = [_newPos1, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 5;
	nul = [_grptim1,getPos _wreck, 300] call BIS_fnc_taskPatrol;
	nul = [_grptim2,getPos _wreck, 200] call BIS_fnc_taskPatrol;
	nul = [_grptim3,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	nul = [_grptim4,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	
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
	nl=[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
	
	waitUntil { _pilot1 distance getMarkerPos "tabus" < 100 and {{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4};
	
	[_pilot1] join grpNull;
	
	null = ["mob_mak", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerGO;
	deleteVehicle _wreck;
	deleteVehicle _IRgren;
	deleteVehicle _pilot1;
	deleteGroup _pilotgrp;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim4;
	
	//deleteVehicle  (nearestobject [_newPos2,"nvg_targetC"]);

	_myHint ="Tebrikler Pilotumuz Güven İçinde Karargaha Ulaştı!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV BAŞARI İLE TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_mak"] call LARs_fnc_removeTask;
	sleep 10;
