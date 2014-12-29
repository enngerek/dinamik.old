
if (! isServer) exitWith {};
	
_myHint ="Yeni Görev Emri Alınıyor";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

_mayınmarkerarray = ["mayın","mayın_1"] ;
_mayınsecilenarray = _mayınmarkerarray call BIS_fnc_selectRandom;
_mayınmarkerarray=_mayınmarkerarray - [_mayınsecilenarray];
_mrkSpawnPos = getMarkerPos _mayınsecilenarray;




_markerMO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerMO setMarkerType "Minefield";
	_markerMO setMarkerColor "ColorRed";
	_markerMO setMarkerText "UNDERWATER OP";
	_markerMO setMarkerSize [1,1];
	
	_null = [west, "mob_mines", ["Clear the coastline Minefield.", "Clear Minefield", "Clear Minefield"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

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
	
	_grp1S = [getMarkerPos _markerMO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "SpecOps" >> "OI_diverTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _mine1, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [getMarkerPos _markerMO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "SpecOps" >> "OI_diverTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _mine5, 200] call BIS_fnc_taskPatrol;

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

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_mines"] call LARs_fnc_removeTask;