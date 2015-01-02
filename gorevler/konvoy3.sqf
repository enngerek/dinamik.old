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
//*********************************************************************
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

//**********************************************************************
_timaraci1 = "I_Truck_02_covered_F" createVehicle getMarkerPos _markerKO;
sleep 1;
_grptim1 = [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
{_x moveIndriver _timaraci1} forEach units _grptim1;
{_x moveInCargo _timaraci1} forEach units _grptim1;
//***************************************************
//_timaraci2 = "I_Truck_02_covered_F" createVehicle getMarkerPos _markerKO;
sleep 1;
_grptim2 = [getMarkerPos _markerKO, resistance, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad")] call BIS_fnc_spawnGroup;
sleep 2;
//{_x moveIndriver _timaraci2} forEach units _grptim2;
{_x moveInCargo _timaraci1} forEach units _grptim2;
//*****************************************************
sleep 1;
[_grpsf1] joinSilent _grpkonvoy;
[_grpsf2] joinSilent _grpkonvoy;
[_grptim1] joinSilent _grpkonvoy;
[_grptim2] joinSilent _grpkonvoy;
sleep 1;
//***********************************************************************
//_newPos = [getmarkerpos _markerKO,[5,30],0,1,[1,50],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 5;
_eskortarray=["eskort1","eskort2","eskor3","eskort4"];
sleep 1;
_seceskort1= _eskortarray call BIS_fnc_selectRandom;
sleep 1;
switch (_seceskort1) do
{
case ("eskort1"):
{_grpeskort1= [_newpos, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Mechanized" >> "HAF_MechInfSquad")] call BIS_fnc_spawnGroup;[_grpeskort1] joinSilent _grpkonvoy;};
case ("eskort2"):
{_grpeskort1= [_newpos, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;[_grpeskort1] joinSilent _grpkonvoy;};
case ("eskort3"):
{ _grpeskort1= [_newpos, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_MGTeam")] call BIS_fnc_spawnGroup;[_grpeskort1] joinSilent _grpkonvoy;};
case ("eskort4"):
{ _grpeskort1= [_newpos, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Mechanized" >> "HAF_MechInf_Support")] call BIS_fnc_spawnGroup;[_grpeskort1] joinSilent _grpkonvoy;};
};
//*************************
sleep 5;
 
//************************************************************************
//_newPos2 = [getmarkerpos _markerKO,[7,30],0,1,[1,50],"O_APC_Wheeled_02_rcws_F"] call SHK_pos;
sleep 5;
_eskort2array=["eskort21","eskort22","eskor23","eskort24"];
sleep 1;
_seceskort2= _eskort2array call BIS_fnc_selectRandom;
switch (_seceskort2) do
{
case ("eskort21"):
{_grpeskort2= [_newpos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Mechanized" >> "HAF_MechInfSquad")] call BIS_fnc_spawnGroup;[_grpeskort2] joinSilent _grpkonvoy;};
case ("eskort22"):
{_grpeskort2= [_newpos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;[_grpeskort2] joinSilent _grpkonvoy;};
case ("eskort23"):
{ _grpeskort2= [_newpos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_MGTeam")] call BIS_fnc_spawnGroup;[_grpeskort2] joinSilent _grpkonvoy;};
case ("eskort24"):
{ _grpeskort2= [_newpos2, 180, "I_Heli_light_03_F", independent] call bis_fnc_spawnvehicle;[_grpeskort2] joinSilent _grpkonvoy;};
};
//***********************************
sleep 5;


//*******************************

 //_grpeskort2= [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Mechanized" >> "HAF_MechInfSquad")] call BIS_fnc_spawnGroup;
 //_grpeskort2= [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;
 //_grpeskort2= [_newPos2, independent , (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized_MTP" >> "HAF_MotInf_MGTeam")] call BIS_fnc_spawnGroup;
 sleep 5;
_wp =_grpkonvoy addWaypoint [getmarkerpos _markerKO2, 0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointBehaviour "CARELESS";
_grpkonvoy setCurrentWaypoint [_wp, 0];


_trgkon = createTrigger ["EmptyDetector", getMarkerPos _markerKO2]; 
	_trgkon setTriggerArea [350, 350, 0, false]; 
	_trgkon setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trgkon setTriggerStatements ["not alive _hedefarac1 and not alive _hedefarac2 ","hint 'trig ok'", ""]; 
	
	
//******************({alive _x} count units _grpkonvoy == 0) AND ({alive _x} count units _grpkonvoy == 2);





























