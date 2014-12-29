//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};

waituntil {!isnil "bis_fnc_init"}; //waiting

_gorevhavuzu = ["imha1","imha2","imha3"]; //mission array

_secilengorev = _gorevhavuzu call BIS_fnc_selectRandom; // random mission 

//_choose = "sabotage";
//[_choose] execVM "Rtask\makeSupportOps.sqf";  //call mission

fn_spawnimha1 = {

radar1 = getPos radar1yer nearestObject 1569703;
["taskimha1","Task1Title","Task1Desc",true,["markerimha1",getpos radar1,"hd_destroy",""," radar imha et"]] call SHK_Taskmaster_add;

};

fn_spawnimha2 = {
radar2 = getPos radar2yer nearestObject 1611622;
["taskimha2","Task2Title","Task2Desc",true,["markerimha2",getpos radar2,"hd_destroy",""," Kule imha et"]] call SHK_Taskmaster_add;
};

fn_spawnimha3 = {
radar3 = getPos radar3yer nearestObject 1779153;
["taskimha2","Task2Title","Task2Desc",true,["markerimha2",getpos radar3,"hd_destroy",""," Kule imha et"]] call SHK_Taskmaster_add;
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