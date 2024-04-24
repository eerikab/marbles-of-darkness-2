/// @description Insert description here
// You can write your code in this editor

if global.first_start and global.adv_points == 0 and sprite_index == global.sprite_asterisk
{
	global.adv_stage = stage;
	global.adv_level = 1;
	ob_adventure.alarm[0] = 1;
}