private ["_victim","_killer","_humanity","_banditKills"];

_victim = _this select 0;
_killer = _this select 1;
_humanity = _killer getVariable ["humanity",0];
_banditKills = _killer getVariable ["banditKills",0];
_killer setVariable ["humanity",_humanity + 25,true];
_killer setVariable ["banditKills",_banditKills + 1,true];