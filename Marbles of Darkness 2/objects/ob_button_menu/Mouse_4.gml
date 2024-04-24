/// @description Insert description here
// You can write your code in this editor

if instance_exists(ob_intro) or !instance_exists(ob_orb)
exit;

if global.gamemode == 1
sc_mid_save("Adventure");
else if global.gamemode == 2
sc_mid_save("Practice");
else if global.gamemode == 3
sc_mid_save("Endless");

event_inherited();