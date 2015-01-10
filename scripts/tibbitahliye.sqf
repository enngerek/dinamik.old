// by Bon_Inf*
// executed by player action

_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;


_capturer playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 10;
//_capturee setunitpos "auto";
//_capturee setDammage 0;
//_capturee playMove "stand";


_arac=nearestObjects [_capturee, ["Car","air","support","armored"], 10];
_enyakinarac = _arac select 0;
_capturee moveincargo _enyakinarac;
[_capturee] joinSilent _capturer;
_capturee enableAI "MOVE";
_capturee enableAI "ANIM";

if(true) exitWith{};