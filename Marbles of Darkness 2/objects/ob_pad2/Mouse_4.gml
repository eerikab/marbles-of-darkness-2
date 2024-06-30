/// @description Insert description here
// You can write your code in this editor

//Swap places with pad
ob_shooter.xstart = x;
ob_shooter.ystart = y;

ix = ob_shooter.x;
iy = ob_shooter.y;

ob_shooter.x = x;
ob_shooter.y = y;

x = ix;
y = iy;
audio_play_sound(global.sou_swap,0,0);