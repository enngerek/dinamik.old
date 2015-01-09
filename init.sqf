// Disable Saving
enableSaving [false, false];

// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};

// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

// INS_revive initialize
[] execVM "INS_revive\revive_init.sqf";

// Add GPS
if !(player hasWeapon "ItemGPS") then {player addWeapon "ItemGPS";};

// Wait for INS_revive initialized
waitUntil {!isNil "INS_REV_FNCT_init_completed"};

// Set Time Of Day
if (isServer) then {
	skipTime PARAM_TimeOfDay;
};



call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFileLineNumbers "removeTasks.sqf";
call compile preprocessfile "globaltools.sqf";
call compile preprocessfile "addactions.sqf";
//call compile preprocessfile "eskiyisil.sqf";
//call compile preprocessFileLineNumbers "fhqtt2.sqf"; 
//execVM "randomWeather2.sqf";


//nul = [] execVM "gorevsec.sqf"; 
nul = [] execVM "gorevler\tibbitahliye.sqf"; 