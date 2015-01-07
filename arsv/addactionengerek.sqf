fnc_engerek_mayin = {
	private ["_hedef1"];
	_hedef1 = _this select 0;
	_hedef1 addAction ["<t color='#ffff00'>Mıknatıslı Mayını Yerleştir</t>", "scripts\objectives\ghst_hostjoin.sqf", [], 6, true, true, "","(alive _target) and (captive _target)"];
};
