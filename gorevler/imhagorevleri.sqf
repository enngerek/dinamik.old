
_gorevhavuzu = ["imha1","imha2","imha3"]; //mission array
_secilengorev = _gorevhavuzu call BIS_fnc_selectRandom; // random mission 

fn_spawnimha1 = {

_mrkSpawnPos=getPos radar1yer;

_markerSO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerSO setMarkerType "Minefield";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "UNDERWATER OP";
	_markerSO setMarkerSize [1,1];

_null = [west, "mob_mines", ["Clear the coastline Minefield.", "Clear Minefield", "Clear Minefield"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;

};

fn_spawnimha2 = {
_mrkSpawnPos=getPos radar2yer;

_markerSO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerSO setMarkerType "Minefield";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "UNDERWATER OP";
	_markerSO setMarkerSize [1,1];

_null = [west, "mob_mines", ["Clear the coastline Minefield.", "Clear Minefield", "Clear Minefield"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
};

fn_spawnimha3 = {
_mrkSpawnPos=getPos radar3yer;

_markerSO = createMarker ["mob_mines", _mrkSpawnPos];
	_markerSO setMarkerType "Minefield";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "UNDERWATER OP";
	_markerSO setMarkerSize [1,1];

_null = [west, "mob_mines", ["Clear the coastline Minefield.", "Clear Minefield", "Clear Minefield"], getMarkerPos "mob_mines", false] spawn BIS_fnc_taskCreate;
_null = ["mob_mines", "CREATED"] spawn BIS_fnc_taskSetState;
};



_missionDetails = switch (_secilengorev) do {
	case "imha1": {call fn_spawnimha1;};
	case "imha2": {call fn_spawnimha2;};
	case "imha3": {call fn_spawnimha3;};
	//case "pilotrescue": {call fn_spawnPilotRescueMission;};
	//case "campsite": {call fn_spawnCampsiteMission;};
	//case "comms": {call fn_spawnCommsMission;};
	//case "antiair": {call fn_spawnAntiairMission;};
	//case "outpost": {call fn_spawnOutpostMission;};
};