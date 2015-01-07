_grptest=createGroup resistance;sleep 1;
_comms = ["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"] call BIS_fnc_selectRandom;
sleep 1;
null=["test",_grptest,_comms] call ws_fnc_createVehicle;
sleep 1;
nul = [_grptest,getmarkerpos "test",250] call BIS_fnc_taskPatrol;


_grpeskort=createGroup resistance;
sleep 1;
_eskortarac = ["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"] call BIS_fnc_selectRandom;
sleep 1;
null=[getPos _wreck,_grpeskort,_eskortarac] call ws_fnc_createVehicle;
sleep 1;
nul = [_grpeskort,getPos _wreck,250] call BIS_fnc_taskPatrol;