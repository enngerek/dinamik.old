//Mission Select
if(!isServer) exitWith {};

_gorevturleri = ["uavbul","mak","denizalti","rehine","kasaba"]; //mission array

//_secilengorev = _gorevturleri call BIS_fnc_selectRandom; // random mission 
_secilengorev = "kasaba";
[_secilengorev] execVM "gorevyap.sqf";  //call mission