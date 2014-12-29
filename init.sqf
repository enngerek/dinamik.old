call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFileLineNumbers "removeTasks.sqf";
call compile preprocessfile "globaltools.sqf";
call compile preprocessfile "addactions.sqf";
//call compile preprocessFileLineNumbers "fhqtt2.sqf"; 



//nul = [] execVM "gorevler\uav2.sqf";
nul = [] execVM "gorevler\mak.sqf";
nul = [] execVM "gorevler\kasaba4.sqf";
nul = [] execVM "gorevler\mayin.sqf";

//testgithub;

