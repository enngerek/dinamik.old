// by Bon_Inf*
// executed by player action

_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;

_capturee enableAI "MOVE";
_capturee enableAI "ANIM";
_capturee setunitpos "auto";
//_capturee setDammage 0;
//_capturee playMove "stand";

[_capturee] joinSilent _capturer;
_arac=nearestObjects [_capturee, ["Car","air","support","armored"], 10];
_enyakinarac = _arac select 0;
_capturee moveincargo _enyakinarac;

if(true) exitWith{};