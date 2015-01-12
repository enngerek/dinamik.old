/*
		TUTORIAL
	https://www.youtube.com/watch?v=YZ4QC96Kqe0
*/	
	_supplyBoxFnc = _this select 1;
	_supplyCargoFnc = _this select 2;
	openMap [true,true];
	clicked = 0;
	hintc "Logistik Malzemenin Bırakılmasını İstediğiniz Yere Sol Tıklayın.";

	["supplymapclick", "onMapSingleClick", {
		_supplyLocArray = [+1000,-1375,-1500,-1125,+1250,-1000,+1375,-1250,+1500,+1125];
//:::::::::::|USE THE ONE BELOW FOR TESTING, IT SPAWNS THE HELI MUCH CLOSER|:::::::::::
//		_supplyLocArray = [+500,-500];
		_supplyRandomLocX = _supplyLocArray select floor random count _supplyLocArray;
		_supplyRandomLocY = _supplyLocArray select floor random count _supplyLocArray;
		_supply = [[(_pos select 0)+_supplyRandomLocX,
					(_pos select 1)+_supplyRandomLocY, 
					(_pos select 2)+50], 180, "I_Heli_Transport_02_F", WEST] call bis_fnc_spawnvehicle;
		_supplyHeli = _supply select 0;
		_supplyHeliPos = getPos _supplyHeli;
		_supplyMrkrHeli = createMarker ["supplyMrkrHeli", _supplyHeliPos];
		_supplyCrew = _supply select 1;
		_supplyGrp = _supply select 2;
		_supplyGrp setSpeedMode "FULL";
		_supplyGrp setBehaviour "CARELESS";
		_supplyWP1 =_supplyGrp addWaypoint [(_pos),1];
		_supplyWP1 setWaypointType "MOVE";
		_supplyWP2 = _supplyGrp addWaypoint [[(_pos select 0)+_supplyRandomLocX, 
											(_pos select 1)+_supplyRandomLocY, 
											_pos select 2], 2];
		_supplyMrkrLZ = createMarker ["supplyMrkrLZ", _pos];
		"supplyMrkrLZ" setMarkerType "Empty";
		"supplyMrkrHeli" setMarkerType "Empty";
		_supplyHeli flyInHeight 150;
		clicked = 1;
		openmap [false,false];
		onMapSingleClick '';}] call BIS_fnc_addStackedEventHandler; 

	waitUntil {(clicked == 1)};
		hint "Logistik Yardım Yola Çıktı";
		_supplyMrkrHeliPos = getMarkerPos "supplyMrkrHeli";
		_supplyMrkrHeliPos2 = [_supplyMrkrHeliPos select 0, 
								_supplyMrkrHeliPos select 1, 
								(_supplyMrkrHeliPos select 2)+50];
		_supplyHeli = _supplyMrkrHeliPos2 nearestObject "I_Heli_Transport_02_F";
		_supplyMrkrLZPos = getMarkerPos "supplyMrkrLZ"; 
		_supplyLZ = createVehicle ["Land_Laptop_device_F", getMarkerPos "supplyMrkrLZ", [], 0, "NONE"];
		deleteMarker "supplyMrkrHeli";
		deleteMarker "supplyMrkrLZ";
		_supplyLZ hideObject true;
		
	waitUntil {( _supplyLZ distance _supplyHeli)<400};
		_supplyHeli animateDoor ["CargoRamp_Open",1];
	waitUntil {( _supplyLZ distance _supplyHeli)<200};
		sleep 2;
		_supplyHeli allowDammage false;
		_supplyBox = createVehicle 
						[_supplyBoxFnc, position _supplyHeli, [], 0, "CAN_COLLIDE"];
						clearBackpackCargoGlobal _supplyBox;
						clearWeaponCargoGlobal _supplyBox;
						clearMagazineCargoGlobal _supplyBox;
						clearItemCargoGlobal _supplyBox;	
		_supplyBox disableCollisionWith _supplyHeli;
		_supplyHeli disableCollisionWith _supplyBox;
		_supplyBox allowDammage false;
		_supplyBox attachTo [_supplyHeli, [0, 0, 0], "CargoRamp"]; 
		_supplyBox setDir ([_supplyBox, _supplyHeli] call BIS_fnc_dirTo);
		detach _supplyBox;
		deleteVehicle _supplyLZ;
		[_supplyBox,_supplyCargoFnc,nil,true] spawn BIS_fnc_MP;
		[_supplyBox,"FncSupplyLight",nil,true] spawn BIS_fnc_MP; 

	_supplyChute = createVehicle ["B_parachute_02_F", position _supplyBox, [], 0, "CAN_COLLIDE"];	
	_supplyBox attachTo [_supplyChute,[0,0,-0.5]];	
	_supplyChute hideObject true;
	_supplyChute setPos getPos _supplyBox;
																			
//:::::::::::|LIGHT|:::::::::::
	_supplyLight = "Chemlight_green" createVehicle (position _supplyBox);
	_supplyLight attachTo [_supplyBox, [0,0,0]];
//:::::::::::::::::::::::::::::		
	
	sleep 1;
	hint "Logistik Malzeme Atıldı";
	_supplyChute hideObject false;
	_supplyHeli allowDammage true;
	
	_supplyHeli animateDoor ["CargoRamp_Open",0];
	
//:::::::::::|SMOKE|:::::::::::
	_supplySmoke = "SmokeShell" createVehicle (position _supplyBox);
	_supplySmoke attachTo [_supplyBox, [0,0,0]];
//:::::::::::::::::::::::::::::
	
	waitUntil {(getPos _supplyBox select 2)<2}; 
	detach _supplyBox;
		_supplyChute setPos [ (getPos _supplyChute select 0)+0.75, getPos _supplyChute select 1, getPos _supplyChute select 2];
		hint "";
		sleep 5;
		{deleteVehicle _x;}forEach crew _supplyHeli;deleteVehicle _supplyHeli;
sleep 5;
_supplyBox allowDammage true;
		//hint "end";





