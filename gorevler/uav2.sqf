//hint "UPDATED SUPPORT OPS";
	//creating the marker 
	
	//if (! isServer) exitWith {};
	
fn_spawnClear1Mission =
{
	
_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 5;

_uavmarkerarray = ["uav","uav_1","uav_2","uav_3","uav_4","uav_5"] ;
sleep 1;
_uavsecilenarray = _uavmarkerarray call BIS_fnc_selectRandom;
sleep 1;
_uavmarkerArray=_uavmarkerArray - [_uavsecilenarray];
sleep 1;
_mrkSpawnPos = getMarkerPos _uavsecilenarray;
sleep 3;

	_markerUO = createMarker ["mob_uav", _mrkSpawnPos];
	_markerUO setMarkerShape "ellipse";
	_markerUO setMarkerColor "ColorRed";
		_markerUO setMarkerBrush "BORDER";
	_markerUO setMarkerText "UAV kara kutusunu ele geçir";
	_markerUO setMarkerSize [700,700];
	
	sleep 2;
	
	
	
	sleep 2;
	
	_null = [west, "mob_uav", ["Düşmana ait bir insansız hava aracı düşürülmüştür.Derhal bölgeye intikal ederek harddiskini kopyaladıktan sonra bölgedeki düşman unsurları temizleyin.", "UAV kara kutusunu ele geçir", "UAV kara kutusunu ele geçir"], getMarkerPos "mob_uav", false] spawn BIS_fnc_taskCreate;
	sleep 1;
	_null = ["mob_uav", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 2;

	//creating the vehicle

	_newPos = [getmarkerpos _markerUO,[0,600],random 360,0,[1,250],"O_UAV_02_F"] call SHK_pos;
	sleep 2;
	_uav = "O_UAV_02_F" createVehicle _newPos;
	//_uav = createVehicle ["O_UAV_02_F", _newPos, [], 0, "CAN_COLLIDE"];
	sleep 2;
	_uav setDammage 0.3;
	
	sleep 1;
	
	
	
	_markeruav = createMarker ["uavmarker", getPos _uav];
	_markeruav setMarkerType "o_uav";
	_markeruav setMarkerColor "ColorBlue";
	_markeruav setMarkerSize [0.7,0.7];
	
	_newPos2 = [_uav,[20,100],random 360] call SHK_pos;  sleep 5;
	
	_grp1S = [_newPos2, resistance , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 5;
	nul = [_grp1S,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	
	_grp1Ss = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp1Ss,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp2S,getPos _uav, 200] call BIS_fnc_taskPatrol;
	/*
	_grp2Ss = [_newPos2, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
	sleep 1;
	nul = [_grp2Ss,getPos _uav, 200] call BIS_fnc_taskPatrol;
		
	
	
	_araceskort1 = ["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F"] call ws_fnc_selectRandom;
	sleep 1;
	[_newPos2, 10, _araceskort1, _grp1S] call BIS_fnc_spawnvehicle;
	

	_grpeskort1 = createGroup resistance;
	_araceskort2 = ["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","I_Heli_light_03_F","I_Heli_Transport_02_F"] call ws_fnc_selectRandom;
	sleep 1;
	[getPos _uav, 10, _araceskort2, _grpeskort1] call ws_fnc_createVehicle;sleep 1;
	nul = [_grpeskort1,getPos _uav, 250] call BIS_fnc_taskPatrol;
	*/
[[_uav ],"fnc_rec_uavdata",true,true] spawn BIS_fnc_MP;
	sleep 10;
	waitUntil {{{alive _x && (_x distance _uav < 700)}count units _x == 0}count [_grp1S,_grp1S] == 2 and !alive _uav}; 
/*
	_trguav = createTrigger ["EmptyDetector", getPos _uav]; 
	_trguav setTriggerArea [700, 700, 0, false]; 
	_trguav setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trguav setTriggerStatements ["this", "", ""];
	enemyDead = false; 
	waitUntil {triggerActivated _trguav};
	hint "çalıştı";
	//waitUntil {!alive _uav};
	//waitUntil {(enemyDead)};
	_null = ["mob_uav", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
		*/
	sleep 10;

	deleteMarker _markerUO;
	deleteMarker _markeruav;
	//deleteVehicle _trguav;
	{deleteVehicle _x} forEach units _grp1S;
	/*
	{deleteVehicle _x} forEach units _grp1Ss;
	{deleteVehicle _x} forEach units _grp2S;
	{deleteVehicle _x} forEach units _grp2Ss;
	{deleteVehicle _x} forEach units _grpeskort1;
	*/
	deleteGroup _grp1S;
	/*
	deleteGroup _grp1Ss;
	deleteGroup _grp2S;
	deleteGroup _grp2Ss;
	deleteGroup _grpeskort1;
	*/

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

[] call fn_spawnClear1Mission;
