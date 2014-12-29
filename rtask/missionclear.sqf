//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["clear","clear1","clear2","clear3"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "clear";
[_choose] execVM "Rtask\makeClearOps.sqf";  //call mission