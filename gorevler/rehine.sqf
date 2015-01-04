//////////////////////////////////////
//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////


_rehmarkerarray = ["rehin_1","rehin_1","rehin_2","rehin_3","rehin_4","rehin_5","rehin_6","rehin_7","rehin_8","rehin_9","rehin_10"] ;
_rehsecilenarray = _rehmarkerarray call BIS_fnc_selectRandom;
_rehmarkerarray = _rehmarkerarray - [_rehsecilenarray];
_rehmrkSpawnPos = getMarkerPos _rehsecilenarray;

	//hint "UPDATED SUPPORT OPS";
	//creating the marker 
	sleep 2;

	/*_markerGO = createMarker ["mob_rehine", _rehmrkSpawnPos];
	_markerGO setMarkerShape "ellipse";
	_markerGO setMarkerColor "ColorYellow";
	//_markerGO setMarkerBrush "BORDER";
	_markerGO setMarkerText " Rehine Durumu";
	_markerGO setMarkerSize [300,300];
	*/
	
	_markerGO = createMarker ["mob_rehine", _rehmrkSpawnPos];
	_markerGO setMarkerType "hg_waqrning";
	_markerGO setMarkerColor "ColorRed";
	_markerGO setMarkerText " Rehine Durumu";
	_markerGO setMarkerSize [0.7,0.7];
	
	sleep 2;
	
	_null = [player, "mob_rehine", ["Rehin alınan gazeteciyi kurtarın", "Rehineyi Kurtar", "Rehineyi Kurtar"], getMarkerPos "mob_rehine", false] spawn BIS_fnc_taskCreate;
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
	
	_markerGO2 = createMarker ["mob_rehine", _newpos];
	_markerGO2 setMarkerShape "ellipse";
	_markerGO2 setMarkerColor "ColorYellow";
	_markerGO2 setMarkerBrush "BORDER";
	_markerGO2 setMarkerText " İstihbarata göre rehine buralarda bir yerde";
	_markerGO2 setMarkerSize [300,300];
	
	_markerGO3 = createMarker ["mob_rehine", getpos _rehine1];
	_markerGO3 setMarkerType "hg_waqrning";
	_markerGO3 setMarkerColor "ColorRed";
	_markerGO3 setMarkerText " Rehine Durumu";
	_markerGO3 setMarkerSize [0.7,0.7];
	
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


_arac3=["I_G_Offroad_01_armed_F","I_G_Offroad_01_F"] call BIS_fnc_selectRandom;
_arac4=["I_G_Offroad_01_armed_F","I_G_Offroad_01_F"] call BIS_fnc_selectRandom;
	
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
	
	waitUntil { _rehine1 distance getMarkerPos "tabus" < 100 and {{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4};
	
	[_rehine1] join grpNull;
	
	null = ["mob_rehine", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep random 10;
	
	deleteMarker _markerGO1;
		deleteMarker _markerGO2;
			deleteMarker _markerGO3;
	
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
	nul = [] execVM "gorev.sqf";
	sleep 5;
	[west, "mob_rehine"] call LARs_fnc_removeTask;

