//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////

_ssn = _this select 0;
_ingeniero = _this select 1;
_callid = _this select 2;

hint "ARMING DEMO CHARGE";
_ssn removeAction _callid;
sleep 10;
hint "EXPLOSIVES ARMED BLOW IN 60 SECONDS";
sleep 60;
bomb1 = "M_Mo_82mm_AT_LG" createVehicle (getPos _ssn);
sleep 3;
bomb2 = "M_Mo_82mm_AT_LG" createVehicle (getPos _ssn);
sleep 1;
bomb3 = "M_Mo_82mm_AT_LG" createVehicle (getPos _ssn);

{ deleteVehicle _x; } forEach nearestObjects [getpos _ssn,["Submarine_01_F"],100];

if(true) exitWith{};