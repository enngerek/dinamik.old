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
	sleep 2;
	_null = [player, "mob_konbasla", ["Silah ve muhimmat yüklü bir konvoyun yola çıktığına dair istihbarat alınmıştır.Konvoyu yolda yakalayarak Muhimmat Kamyonlarını imha edin.", "Konvoy baskını", "Konvoy baskını"], getMarkerPos "mob_konbasla", false] spawn BIS_fnc_taskCreate;
sleep 1;
_null = ["mob_konbasla", "CREATED"] spawn BIS_fnc_taskSetState;
sleep 1;
//_SideHQ = createCenter resistance;
_grpkonvoy = createGroup resistance;
["mob_konbasla",_grpkonvoy,"I_Truck_02_ammo_F"] call ws_fnc_createVehicle;	
sleep 1;
/*
_arac2=["mob_konbasla",resistance,"I_Truck_02_ammo_F"] call ws_fnc_createVehicle;	
sleep 1;
_arac3=["mob_konbasla",resistance,"I_Truck_02_ammo_F"] call ws_fnc_createVehicle;	
sleep 1;
_koruma1=["mob_konbasla",resistance,"I_APC_Wheeled_03_cannon_F"] call ws_fnc_createVehicle;
sleep 1;
_koruma2=["mob_konbasla",resistance,"I_MRAP_03_F"] call ws_fnc_createVehicle;
sleep 1;
//_havadestek = createGroup resistance;
sleep 1;
_koruma3=["mob_konbasla",resistance,"I_APC_tracked_03_cannon_F"] call ws_fnc_createVehicle;
sleep 1;
*/
//_grpmanga = createGroup resistance;
sleep 1;
//["mob_konbasla",resistance,"I_Truck_02_covered_F",[],[8,["I_Soldier_lite_F","I_soldier_F","I_Soldier_03_F","I_Soldier_02_F"],true]] call ws_fnc_createVehicle;
sleep 1;
/*
//_arac1 setVehicleVarName "konvoy"; 
//konvoy = _arac1;
sleep 1;
//_arac2 setVehicleVarName "konvoy_1"; 
//konvoy_1 = _arac2;
sleep 1;
//_arac3 setVehicleVarName "konvoy_2"; 
//konvoy_2 = _arac3;
sleep 1;
_koruma1 setVehicleVarName "konvoy_3"; 
//konvoy_3 = _koruma1;
sleep 1;
//_koruma2 setVehicleVarName "konvoy_4"; 
konvoy_4 = _koruma2;
sleep 1;
//_koruma3 setVehicleVarName "konvoy_5"; 
//konvoy_5 = _koruma3;
sleep 2;
//_korumatimi setVehicleVarName "konvoy_6"; 
//konvoy_6 = _korumatimi;
sleep 2;
*/

//_konvoyrota = [konvoy,"konvoy1bitis",30] spawn ws_fnc_taskConvoy;
_grpkonvoy move getmarkerpos "konvoy1bitis";
//_wp =_grpkonvoy addWaypoint [getmarkerpos "konvoy1bitis", 0];
//_wp setWaypointType "MOVE";
//_grpkonvoy setCurrentWaypoint [_wp, 0];

_trgkon = createTrigger ["EmptyDetector", getMarkerPos _markerKO2]; 
	_trgkon setTriggerArea [350, 350, 0, false]; 
	_trgkon setTriggerActivation ["resistance", "NOT PRESENT", false]; 
	_trgkon setTriggerStatements ["not alive konvoy and not alive konvoy_1 and not alive konvoy_2","", ""]; 
	
	
//******************({alive _x} count units _grpkonvoy == 0) AND ({alive _x} count units _grpkonvoy == 2);
	//enemyDead = false; 
	waitUntil {triggerActivated _trgkon}; 
	_null = ["mob_konbasla", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	sleep 5;
//deleteMarker _markerKO;
//deleteMarker _markerKO2;
//deleteVehicle _trgkon;
{deleteVehicle _x} forEach crew _arac1 + [_arac1];
{deleteVehicle _x} forEach crew _arac2 + [_arac2];
{deleteVehicle _x} forEach crew _arac3 + [_arac3];
{deleteVehicle _x} forEach crew _koruma1 + [_koruma1];
{deleteVehicle _x} forEach crew _koruma2 + [_koruma2];
{deleteVehicle _x} forEach crew _koruma3 + [_koruma3];
{deleteVehicle _x} forEach crew _korumatimi;
//{deleteVehicle _x} forEach cargo _korumatimi + [_korumatimi];
	

/*
	};
	case ("kontema2"):
	{
	
	
	};
	
	case ("kontema3"):
	{
	};
	
	};
*/
