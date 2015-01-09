[] spawn {
	player setvariable ["key",true,true];
    waituntil {!(Isnull (finddisplay 46))};
    _keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "(if (_this select 1 == 1 and player getvariable 'key') then {[] spawn VAS_fnc_Stopview; DetectKeyStopView = true; player setvariable ['key',false,true]  })"];
};