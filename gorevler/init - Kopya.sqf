/*
[[
 
  ["Task1","Verici kutusunu imha edin","Telefon ve internet bağlantısını kesmek için Verici Kutusunu İmha edin",true,["task1",getpos nesne2,"hd_destroy",""," vericiyi imha et"]],
  //["Task2","Bölgeyi temizle","Pygros şehri ve çevresini düşman unsurlardan temizle",true,["mrkEllipseNumber",getmarkerpos "pygros","","Colorred","","Ellipse",600]]
    ["Taskr1","Tahliye","Kişiyi çatışma bölgesinden tahliye edin.",true,["taskr1",getpos rehin1,"hd_join",""," tahliye et"]],
	["Taskr2","Tahliye","Kişiyi çatışma bölgesinden tahliye edin.",true,["taskr2",getpos rehin2,"hd_join",""," tahliye et"]],
	["Taskr3","Tahliye","Kişiyi çatışma bölgesinden tahliye edin.",true,["taskr3",getpos rehin3,"hd_join",""," tahliye et"]],
	["Taskr4","Tahliye","Kişiyi çatışma bölgesinden tahliye edin.",true,["taskr4",getpos rehin4,"hd_join",""," tahliye et"]],
	["Task2","Bölgeyi temizle","Pygros şehri ve çevresini düşman unsurlardan temizle",true,["task2",getmarkerpos "task2yer"]]
  
],[
  ["Note1","Hello group A",west],
  ["Note1","Hello group B",west],
  ["Credits","Made by: Shuko of LDD Kyllikki<br />Contact: shuko@Quakenet<br />www.kyllikki.fi"]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";
*/

/*//İSİMLER//////// engerek,çakal,atmaca,mitad,delice,dz.komando,spartacus,felix,
masterUIDArray = ["76561198085574540", "76561198011442431","76561198011359702","76561198085286608","76561198123594459","76561198056035130","76561198082682402","76561198085441387"];
masterClassArray = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_Plane_CAS_01_F"];
*/

/*if (isServer) then {

MY_Interaction_ID1 = [rehin1, "Kendi Grubuna Al", 5, {true}, {rehin1 setunitpos "auto"; rehin1 enableAI "Move"; rehin1 enableAI "fire";rehin1 setbehaviour "safe";doStop rehin1;[rehin1] joinSilent player}, true] call AGM_Interaction_fnc_addInteraction;
MY_Interaction_ID2 = [rehin2, "Kendi Grubuna Al", 5, {true}, {rehin2 setunitpos "auto"; rehin1 enableAI "Move"; rehin1 enableAI "fire";rehin1 setbehaviour "safe";doStop rehin1;[rehin1] joinSilent player}, true] call AGM_Interaction_fnc_addInteraction;
MY_Interaction_ID3 = [rehin3, "Kendi Grubuna Al", 5, {true}, {rehin3 setunitpos "auto"; rehin1 enableAI "Move"; rehin1 enableAI "fire";rehin1 setbehaviour "safe";doStop rehin1;[rehin1] joinSilent player}, true] call AGM_Interaction_fnc_addInteraction;
MY_Interaction_ID4 = [rehin4, "Kendi Grubuna Al", 5, {true}, {rehin4 setunitpos "auto"; rehin1 enableAI "Move"; rehin1 enableAI "fire";rehin1 setbehaviour "safe";doStop rehin1;[rehin1] joinSilent player}, true] call AGM_Interaction_fnc_addInteraction;
};
*/;