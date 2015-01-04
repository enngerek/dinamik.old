//////////////////////////////////////////////////////////////////
// Function file for ArmA III
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////
/*
if (!isDedicated) then {
    fnc_iedblow = {
        _this addAction ["Blow IED", "scripts\iedblow.sqf", [], 1, false, true, "", ""];
    };
    iedblow = [];
    "iedblow" addPublicVariableEventHandler {(_this select 1) call fnc_iedblow};
};
*/
if (!isDedicated) then {
    fnc_escolta = {
        _this addAction ["<t color='#FF6600'>Beni Takip Et</t>", "scripts\arrest.sqf", nil, 6, true, true, "", ""];
    };
    eskortet = [];
    "eskortet" addPublicVariableEventHandler {(_this select 1) call fnc_escolta};
};

if (!isDedicated) then {
    fnc_sabotageSSN = {
        _this addAction ["<t color='#FF6600'>Mıknatıslı Mayını Yerleştir.</t>", "scripts\sabSSN.sqf", nil, 6, true, true, "", ""];
    };
    sabotageSSN = [];
    "sabotageSSN" addPublicVariableEventHandler {(_this select 1) call fnc_sabotageSSN};
};

if (!isDedicated) then {
    fnc_uavdata = {
        _this addAction ["<t color='#FF6600'>HardDiskini Kopyala</t>", "scripts\uavdata.sqf", nil, 6, true, true, "", ""];
    };
    uavdata = [];
    "uavdata" addPublicVariableEventHandler {(_this select 1) call fnc_uavdata};
};

fnc_rec_daimha = {
	private ["_pow"];
	_pow = _this select 0;
	_pow addAction ["<t color='#FF6600'>Mıknatıslı Mayını Yerleştir</t>", "scripts\sabSSN.sqf", nil, 6, true, true, "", ""];
};
fnc_rec_rehkurtar = {
	private ["_pow"];
	_pow = _this select 0;
	_pow addAction ["<t color='#FF6600'>Beni Takip Et</t>", "scripts\arrest.sqf", nil, 6, true, true, "", ""];
};
fnc_rec_uavdata = {
	private ["_pow"];
	_pow = _this select 0;
	_pow addAction ["<t color='#FF6600'>HardDiski Al ve C4 Yerleştir</t>", "scripts\uavdata.sqf", nil, 6, true, true, "", ""];
};
fnc_rec_rehinekurtar = {
	private ["_pow"];
	_pow = _this select 0;
	_pow addAction ["<t color='#FF6600'>Beni Takip Et</t>", "scripts\arrest.sqf", nil, 6, true, true, "", ""];
};