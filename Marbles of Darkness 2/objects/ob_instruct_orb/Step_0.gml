/// @description Insert description here
// You can write your code in this editor

if ob_instructions.i == 1
visible = 1;
else
visible = 0;

if x < global.rm_width/2
{
	if ob_instruct_shooter.image_index == 1
	sprite_index = global.sprite_orb[3];
	else
	sprite_index = global.sprite_orb[1];
}