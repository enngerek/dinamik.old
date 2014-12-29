_gorevarray = ["MAK","UAV","kasaba"] ;
_secilenarray = _gorevarray call BIS_fnc_selectRandom;
switch (_secilenarray) do
{
	case ("MAK"):
	{
	nul = [] execVM "gorevler\mak.sqf";
	
	};
	case ("UAV"):
	{
	nul = [] execVM "gorevler\uav.sqf";
	
	};
	case ("kasaba"):
	{
	nul = [] execVM "gorevler\kasaba4.sqf";
	
	};
};