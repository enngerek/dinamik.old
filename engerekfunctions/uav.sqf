	
fn_engerek_uavgoreviyap = 
{
	
_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 5;

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
	
	_aracpos1=[gePos _uav, 100, 150, 5, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac1=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom;
	[_arac1pos, 180, _arac1, _grptim1] call bis_fnc_spawnvehicle;
	sleep 2;
	_aracpos2=[gePos _uav, 100, 200, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	sleep 2;
	_arac2=["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Truck_02_covered_F"] call BIS_fnc_selectRandom;
	[_arac2pos, 180, _arac2, _grptim2] call bis_fnc_spawnvehicle;
		
	sleep 10;
	waitUntil {{{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grptim1,_grptim2,_grptim3,_grptim4] == 4 and !alive _uav};
	
	sleep 2;

	deleteMarker _markerGO;
	deleteMarker _markeruav;
	deleteVehicle _uav;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim1;
	{deleteVehicle _x} forEach units _grptim2;
	deleteGroup _grptim2;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim3;
	{deleteVehicle _x} forEach units _grptim1;
	deleteGroup _grptim4;
	
	_myHint ="Tebrikler!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="GÖREV TAMAMLANDI";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	sleep 2;
	[west, "mob_uav"] call LARs_fnc_removeTask;sleep 5;
//nul = [] execVM "gorev.sqf";
};

