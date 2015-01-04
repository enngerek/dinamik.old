//konvoy görevi
//_kontemaarray=["kontema1","kontema2","kontema3"];
//_seckontema= _kontemaarray call BIS_fnc_selectRandom;



//switch (_seckontema) do
//{
	//case ("kontema1"):
	//{
	_mrkSpawnkonbasla = getMarkerPos "konvoy1basla";
	sleep 1;
	_mrkSpawnkonbitis = getMarkerPos "konvoy1bitis";
	sleep 1;
	
	_markerKO = createMarker ["mob_konbasla", _mrkSpawnkonbasla];
	_markerKO setMarkerType "hd_start";
	_markerKO setMarkerColor "ColorRed";
	_markerKO setMarkerText " Konvoy çıkış noktası";
	_markerKO setMarkerSize [1,1];
	sleep 2;
	
	_markerKO2 = createMarker ["mob_konbit", _mrkSpawnkonbitis];
	_markerKO2 setMarkerType "hd_end";
	_markerKO2 setMarkerColor "ColorRed";
	_markerKO2 setMarkerText " Konvoy varış noktası";
	_markerKO2 setMarkerSize [1,1];
	
	_newpos  = getmarkerpos "konvoy1eskort1";
	_newpos2 = getMarkerPos "konvoy1eskort2";
	sleep 2;
	_null = [player, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak Muhimmat Kamyonlarını imha edin.", "Konvoy baskını", "Konvoy baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;

sleep 5;
//////////////////////////////////////////////////////////
_grpkonvoy = createGroup resistance;
_grpsf1 = createGroup resistance;
_grpsf2 = createGroup resistance;
sleep 1;
_hedefarac1 = "O_Truck_03_ammo_F" createVehicle getMarkerPos _markerKO;
sleep 1;
_hedefarac2 = "O_Truck_03_ammo_F" createVehicle getMarkerPos _markerKO;
sleep 1;
null="I_soldier_F" createUnit [ getMarkerPos _markerKO, _grpsf1];
sleep 1;
null="I_soldier_F" createUnit [ getMarkerPos _markerKO, _grpsf2];
sleep 1;
{_x moveIndriver _hedefarac1} forEach units _grpsf1;
sleep 1;
{_x moveIndriver _hedefarac2} forEach units _grpsf2;

///////////////////////////////////////////////////////////////////////
_timaraci1 = "I_Truck_02_covered_F" createVehicle getMarkerPos _markerKO;
sleep 1;
_grptim1 = [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
sleep 1;
/////////////////////////////////////////////
private ["_type","_pos","_grp","_veh","_eskorttim","crew"];

_type="I_MRAP_03_hmg_F";
_pos=getMarkerPos _markerKO;
_grp=grpeskort;
_veh=eskort1;
_eskorttim=eskort1tim;
_grp = createGroup resistance;
_veh = createVehicle [_type,_pos,[],0,"NONE"];
sleep 5;
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;

//_eskorttim= [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;sleep 1;

//{_x moveInCargo _veh} forEach units _eskorttim;

[_grp] joinSilent _grpkonvoy;
/////////////////////////////////////////////////////////////////////////////////////////////
sleep 1;
[_grpsf1] joinSilent _grpkonvoy;
[_grpsf2] joinSilent _grpkonvoy;
[_grptim1] joinSilent _grpkonvoy;
sleep 1;
/////////////////////////////////////////////////////////////////////////////////////////
_eskortarray=["eskort1","eskort2","eskor3","eskort4"];
sleep 1;
_seceskort1= _eskortarray call BIS_fnc_selectRandom;
sleep 1;
switch (_seceskort1) do
{
case ("eskort1"):
{
_type="I_APC_tracked_03_cannon_F";
_pos=getMarkerPos _markerKO;
_grp=grpeskort2;
_veh=eskort2arac;
_eskorttim=eskort2tim;
sleep 1;
_grp = createGroup resistance;
sleep 1;
_veh = createVehicle [_type,_pos,[],0,"NONE"];
sleep 5;
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;
sleep 1;

_eskorttim= [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 1;

{_x moveInCargo _veh} forEach units _eskorttim;

[_grp] joinSilent _grpkonvoy;
};
case ("eskort2"):
{
_type="I_Truck_02_covered_F";
_pos=getMarkerPos _markerKO;
_grp=grpeskort2;sleep 1;

_veh=eskort2arac;
_eskorttim = eskort2tim;_grp = createGroup resistance;
sleep 1;
_veh = createVehicle [_type,_pos,[],0,"NONE"];
sleep 5;
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;
sleep 1;

_eskorttim= [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;sleep 1;
sleep 1;

{_x moveInCargo _veh} forEach units _eskorttim;

[_grp] joinSilent _grpkonvoy;
};
case ("eskort3"):
{
_type="I_APC_Wheeled_03_cannon_F";
_pos=getMarkerPos _markerKO;
_grp=grpeskort2;_grp = createGroup resistance;

_veh=eskort2arac;
_eskorttim=eskort2tim;_grp = createGroup resistance;
sleep 1;
_veh = createVehicle [_type,_pos,[],0,"NONE"];
sleep 5;
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;
sleep 1;

_eskorttim= [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;sleep 1;
sleep 1;

{_x moveInCargo _veh} forEach units _eskorttim;

[_grp] joinSilent _grpkonvoy;
};
case ("eskort4"):
{
_type="I_MRAP_03_gmg_F";
_pos=getMarkerPos _markerKO;
_grp=grpeskort2;
sleep 1;
_veh=eskort2arac;
_eskorttim=eskort2tim;_grp = createGroup resistance;
sleep 1;
_veh = createVehicle [_type,_pos,[],0,"NONE"];
sleep 5;
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;
sleep 1;

//_eskorttim= [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;sleep 1;
sleep 1;

//{_x moveInCargo _veh} forEach units _eskorttim;

[_grp] joinSilent _grpkonvoy;
};
};



 sleep 5;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
_grpkonvoy setCurrentWaypoint [_wp, 0];


_trgkon = createTrigger ["EmptyDetector", getMarkerPos _markerKO2]; 
	//_trgkon setTriggerArea [350, 350, 0, false]; 
	//_trgkon setTriggerActivation ["resistance", "PRESENT", false]; 
_trgkon setTriggerStatements ["(!alive _hedefarac1) and (!alive _hedefarac2) ","hint 'trig ok'", ""]; 
	//waitUntil !alive _hedefarac1 and !alive _hedefarac2;
/*if (triggeractivated _trgkon) then {
_null = ["mob_konbasla", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
[player, "mob_konbasla"] call LARs_fnc_removeTask;

};	
*/
























