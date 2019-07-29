/**
*  fn_ammoDrop
*
*  Drops a cargo on a parachute
*
*  Domain: Server
**/
params ["_player", "_targetPos"];

if (count _targetPos == 0) then {
  [_player, "ammoDrop"] remoteExec ["BIS_fnc_addCommMenuItem", _player]; //refund the support if looking at sky when activated
}else{
  _parachute = "B_Parachute_02_F" CreateVehicle [0,0,0];
  _parachute setPos [_targetPos select 0, _targetPos select 1, (getTerrainHeightASL _targetPos) + 75];
  _supplyBox = createVehicle ["Land_WoodenCrate_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
  [_supplyBox, ["<t color='#00ff00'>" + "FILL AMMO", "supports\ammoDrop.sqf","",2,true,false,"true","true",4]] remoteExec ["addAction", 0, true];
  _supplyBox attachTo [_parachute, [0,0,0]];
  _supplyBox allowDamage false;
  
  waitUntil {getpos _supplyBox select 2<4};
  _smoker = "SmokeShellBlue" createVehicle (getpos _supplyBox vectorAdd [0,0,5]);
  detach _supplyBox;
}