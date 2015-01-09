/*_markerarraytibbitah = ["tıbbitah_1","tıbbitah_2","tıbbitah_3","tıbbitah_4","tıbbitah_5","tıbbitah_6","tıbbitah_7","tıbbitah_8","tıbbitah_9","tıbbitah_10"] ;
_secilenarraytibbitah = _markerarraytibbitah call BIS_fnc_selectRandom;
_markerarraytibbitah=_markerarraytibbitah - [_secilenarraytibbitah];
_mrkSpawngorevtibbitah = getMarkerPos _secilenarraytibbitah;
*/
_mrkSpawngorevtibbitah = getMarkerPos "tıbbitah_1";

_markerGO = createMarker ["mob_tibbitahliye", _mrkSpawngorevtibbitah];
	_markerGO setMarkerType "mil_objective";
	_markerGO setMarkerColor "ColorBlue";
	_markerGO setMarkerText "SUPPORT OP";
	_markerGO setMarkerSize [1,1];
	
	_null = [west, "mob_tibbitahliye", ["Evac the wounded from the AO and bring it to MASH in Loy Manara AB", "MEDEVAC", "MEDEVAC"], getMarkerPos "mob_tibbitahliye", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_tibbitahliye", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle

	_aracsec = ["B_MRAP_01_gmg_F","B_MRAP_01_F","B_arac_01_transport_F"] call BIS_fnc_selectRandom;
	
	_arac = createVehicle [_aracsec,[(getMarkerpos _markerGO select 0) + 3, getMarkerpos _markerGO select 1,0],[], 0, "NONE"];
	_arac setDammage 0.8;
	_arac allowDamage false;
	_arac setFuel 0;
	
	_grp = createGroup WEST;
	_yarali = _grp createUnit ["B_Soldier_F",[(getMarkerpos _markerGO select 0) + 10, getMarkerpos _markerGO select 1,0], [], 0, "NONE"];
	_yarali allowDamage false;
	_yarali setCaptive true;
	_yarali setHit ["hands",1];
	_yarali setHit ["head_hit",0.4];
	_yarali setHit ["body",0.5];
	_yarali playMoveNow "AinjPpneMstpSnonWrflDnon";
	_yarali disableAI "MOVE";
	_yarali disableAI "ANIM";
	//////////////////////////////////
	[[_yarali],"fnc_rec_rehkurtar",true,true] spawn BIS_fnc_MP;
	escolta = _yarali;
	publicVariable "escolta";
	/////////////////////////////////
	_tim1 = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_tim1,getPos _arac, 150] call BIS_fnc_taskPatrol;
	
	_tim2 = [getMarkerPos _markerCO, resistance, ["I_G_Soldier_SL_F", "I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_medic_F"]
] call BIS_fnc_spawnGroup;
	nul = [_tim2,getPos _arac, 150] call BIS_fnc_taskPatrol;
	
	waitUntil { _yarali distance getMarkerPos "tabus" < 50 };
	
	[_yarali] join grpNull;
	
	null = ["mob_tibbitahliye", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerGO;
	{deleteVehicle _x} forEach units _tim1;
	{deleteVehicle _x} forEach units _tim2;
	deleteGroup _tim1;
	deleteGroup _tim2;
	deleteVehicle _arac;
	deleteVehicle _yarali;
	deleteGroup _grp;

	_myHint ="Tebrikler ! Görev Tamamlandı";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="Görev Tamam";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_tibbitahliye"] call LARs_fnc_removeTask;
