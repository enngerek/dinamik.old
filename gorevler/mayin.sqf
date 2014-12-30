
if (! isServer) exitWith {};
	
_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

_mayinmarkerarray = ["mayin","mayin_1","mayin_2","mayin_3","mayin_4","mayin_5","mayin_6","mayin_7","mayin_8","mayin_9","mayin_10"] ;
_mayinsecilenarray = _mayinmarkerarray call BIS_fnc_selectRandom;
_mayinmarkerarray=_mayinmarkerarray - [_mayinsecilenarray];
_mrkSpawnPos = getMarkerPos _mayinsecilenarray;

_mayintemaarray=["maytema1","maytema2","maytema3"];
_secmayintema= _mayintemaarray call BIS_fnc_selectRandom;

switch (_secmayintema) do
{
	case ("maytema1"):
	{
	sleep 2;

_markerMO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerMO setMarkerType "Minefield";
	_markerMO setMarkerColor "ColorRed";
	_markerMO setMarkerText " Mayın Temizleme";
	_markerMO setMarkerSize [1,1];
	sleep 1;
	_null = [player, "mob_mines", ["Su altı mayınlarını etkisiz hale getirin.", "Mayın Temizle", "Mayın Temizle"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	_mine1 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 1, getMarkerpos _markerMO select 1,0], [], 0];
	_mine1 setPosATL [(getMarkerpos _markerMO select 0) + 1,getMarkerpos _markerMO select 1,(getPosATL _mine1 select 2) - 2];
	
	_mine2 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 5, getMarkerpos _markerMO select 1,0], [], 0];
	_mine2 setPosATL [(getMarkerpos _markerMO select 0) + 5,getMarkerpos _markerMO select 1,(getPosATL _mine2 select 2) - 2];
	
	_mine3 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 10, getMarkerpos _markerMO select 1,0], [], 0];
	_mine3 setPosATL [(getMarkerpos _markerMO select 0) + 10,getMarkerpos _markerMO select 1,(getPosATL _mine3 select 2) - 2];
	
	_mine4 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 15, getMarkerpos _markerMO select 1,0], [], 0];
	_mine4 setPosATL [(getMarkerpos _markerMO select 0) + 15,getMarkerpos _markerMO select 1,(getPosATL _mine4 select 2) - 2];
	
	_mine5 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 20, getMarkerpos _markerMO select 1,0], [], 0];
	_mine5 setPosATL [(getMarkerpos _markerMO select 0) + 20,getMarkerpos _markerMO select 1,(getPosATL _mine5 select 2) - 2];
	
	_grp1S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
        [_grpr1S, getPos _mine1] call BIS_fnc_taskDefend;

	_grp2S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _mine5, 20] call BIS_fnc_taskPatrol;
	
	//_mayaracarray=["I_Heli_light_03_F","I_Heli_Transport_02_F"];
	//_maysecilenarac1=_mayaracarray call BIS_fnc_selectRandom;
	
	_helo2 = createGroup resistance;
	[getMarkerpos "mob_mines", 10, "I_Heli_light_03_F", _helo2] call BIS_fnc_spawnvehicle;
	nul = [_helo2,getMarkerpos "mob_mines", 500] call BIS_fnc_taskPatrol;

	waitUntil {{mineActive _x} count [_mine1,_mine2,_mine3,_mine4,_mine5] == 0};
	
	_null = ["mob_mines", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerMO;
	deleteVehicle _mine1;
	deleteVehicle _mine2;
	deleteVehicle _mine3;
	deleteVehicle _mine4;
	deleteVehicle _mine5;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	{deleteVehicle _x} forEach units _helo2;
	deleteGroup _helo2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[player, "mob_mines"] call LARs_fnc_removeTask;
	nul = [] execVM "gorev.sqf";

};

case ("maytema2"):
	{
	sleep 2;

_markerMO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerMO setMarkerType "Minefield";
	_markerMO setMarkerColor "ColorRed";
	_markerMO setMarkerText " Mayın Temizleme";
	_markerMO setMarkerSize [1,1];
	sleep 1;
	_null = [player, "mob_mines", ["Su altı mayınlarını etkisiz hale getirin.", "Mayın Temizle", "Mayın Temizle"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	_mine1 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 1, getMarkerpos _markerMO select 1,0], [], 0];
	_mine1 setPosATL [(getMarkerpos _markerMO select 0) + 1,getMarkerpos _markerMO select 1,(getPosATL _mine1 select 2) - 2];
	
	_mine2 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 5, getMarkerpos _markerMO select 1,0], [], 0];
	_mine2 setPosATL [(getMarkerpos _markerMO select 0) + 5,getMarkerpos _markerMO select 1,(getPosATL _mine2 select 2) - 2];
	
	_mine3 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 10, getMarkerpos _markerMO select 1,0], [], 0];
	_mine3 setPosATL [(getMarkerpos _markerMO select 0) + 10,getMarkerpos _markerMO select 1,(getPosATL _mine3 select 2) - 2];
	
	_mine4 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 15, getMarkerpos _markerMO select 1,0], [], 0];
	_mine4 setPosATL [(getMarkerpos _markerMO select 0) + 15,getMarkerpos _markerMO select 1,(getPosATL _mine4 select 2) - 2];
	
	_mine5 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 20, getMarkerpos _markerMO select 1,0], [], 0];
	_mine5 setPosATL [(getMarkerpos _markerMO select 0) + 20,getMarkerpos _markerMO select 1,(getPosATL _mine5 select 2) - 2];
	
	_grp1S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
        [_grpr1S, getPos _mine1] call BIS_fnc_taskDefend;

	_grp2S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _mine5, 20] call BIS_fnc_taskPatrol;
	
	//_mayaracarray=["I_Heli_light_03_F","I_Heli_Transport_02_F"];
	//_maysecilenarac1=_mayaracarray call BIS_fnc_selectRandom;
	
	_helo2 = createGroup east;
	[getMarkerpos "mob_mines", 10, "O_Heli_Attack_02_F", _helo2] call BIS_fnc_spawnvehicle;
	nul = [_helo2,getMarkerpos "mob_mines", 500] call BIS_fnc_taskPatrol;

	waitUntil {{mineActive _x} count [_mine1,_mine2,_mine3,_mine4,_mine5] == 0};
	
	_null = ["mob_mines", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerMO;
	deleteVehicle _mine1;
	deleteVehicle _mine2;
	deleteVehicle _mine3;
	deleteVehicle _mine4;
	deleteVehicle _mine5;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	{deleteVehicle _x} forEach units _helo2;
	deleteGroup _helo2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[player, "mob_mines"] call LARs_fnc_removeTask;
	nul = [] execVM "gorev.sqf";

};
case ("maytema3"):
	{
	sleep 2;

_markerMO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerMO setMarkerType "Minefield";
	_markerMO setMarkerColor "ColorRed";
	_markerMO setMarkerText " Mayın Temizleme";
	_markerMO setMarkerSize [1,1];
	sleep 1;
	_null = [player, "mob_mines", ["Su altı mayınlarını etkisiz hale getirin.", "Mayın Temizle", "Mayın Temizle"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	//creating the vehicle
	
	_mine1 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 1, getMarkerpos _markerMO select 1,0], [], 0];
	_mine1 setPosATL [(getMarkerpos _markerMO select 0) + 1,getMarkerpos _markerMO select 1,(getPosATL _mine1 select 2) - 2];
	
	_mine2 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 5, getMarkerpos _markerMO select 1,0], [], 0];
	_mine2 setPosATL [(getMarkerpos _markerMO select 0) + 5,getMarkerpos _markerMO select 1,(getPosATL _mine2 select 2) - 2];
	
	_mine3 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 10, getMarkerpos _markerMO select 1,0], [], 0];
	_mine3 setPosATL [(getMarkerpos _markerMO select 0) + 10,getMarkerpos _markerMO select 1,(getPosATL _mine3 select 2) - 2];
	
	_mine4 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 15, getMarkerpos _markerMO select 1,0], [], 0];
	_mine4 setPosATL [(getMarkerpos _markerMO select 0) + 15,getMarkerpos _markerMO select 1,(getPosATL _mine4 select 2) - 2];
	
	_mine5 = createMine ["UnderwaterMine", [(getMarkerpos _markerMO select 0) + 20, getMarkerpos _markerMO select 1,0], [], 0];
	_mine5 setPosATL [(getMarkerpos _markerMO select 0) + 20,getMarkerpos _markerMO select 1,(getPosATL _mine5 select 2) - 2];
	
	_grp1S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	[_grpr1S, getPos _mine1] call BIS_fnc_taskDefend;
	
	_grp2S = [getMarkerPos _markerMO, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "SpecOps" >> "HAF_DiverTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _mine5, 20] call BIS_fnc_taskPatrol;
	
	//_mayaracarray=["I_Heli_light_03_F","I_Heli_Transport_02_F"];
	//_maysecilenarac1=_mayaracarray call BIS_fnc_selectRandom;
	
	//_helo2 = createGroup resistance;
	//[getMarkerpos "mob_mines", 10, "I_Heli_light_03_F", _helo2] call BIS_fnc_spawnvehicle;
	//nul = [_helo2,getMarkerpos "mob_mines", 500] call BIS_fnc_taskPatrol;

	waitUntil {{mineActive _x} count [_mine1,_mine2,_mine3,_mine4,_mine5] == 0};
	
	_null = ["mob_mines", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerMO;
	deleteVehicle _mine1;
	deleteVehicle _mine2;
	deleteVehicle _mine3;
	deleteVehicle _mine4;
	deleteVehicle _mine5;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	//{deleteVehicle _x} forEach units _helo2;
	//deleteGroup _helo2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[player, "mob_mines"] call LARs_fnc_removeTask;
	nul = [] execVM "gorev.sqf";

};
};


