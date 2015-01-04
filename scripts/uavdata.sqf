//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////

_intel = _this select 0;
_ingeniero = _this select 1;
_callid = _this select 2;

hint "KARA KUTU ALINIYOR";
_ingeniero playMove "AinvPknlMstpSlayWrflDnon_medic";
_intel removeAction _callid;
sleep 5;
hint "KUTU ALINDI";
sleep 5;
hint "PATLAYICI YERLEŞTİRİLİYOR";
_ingeniero playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
hint "PATLAYICI YERLEŞTİRİLDİ:60 sn";
sleep 60;
bomb2 = "M_Mo_82mm_AT_LG" createVehicle (getPos _intel);

{ deleteVehicle _x; } forEach nearestObjects [getpos _intel,["O_UAV_02_F"],100];

if(true) exitWith{};