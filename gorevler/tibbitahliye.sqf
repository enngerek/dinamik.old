
/*_markerarraytibbitah = ["tıbbitah_1","tıbbitah_2","tıbbitah_3","tıbbitah_4","tıbbitah_5","tıbbitah_6","tıbbitah_7","tıbbitah_8","tıbbitah_9","tıbbitah_10"] ;
_secilenarraytibbitah = _markerarraytibbitah call BIS_fnc_selectRandom;
_markerarraytibbitah=_markerarraytibbitah - [_secilenarraytibbitah];
_mrkSpawngorevtibbitah = getMarkerPos _secilenarraytibbitah;
*/
_mrkSpawngorevtibbitah = getMarkerPos "tıbbitah_1";

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
