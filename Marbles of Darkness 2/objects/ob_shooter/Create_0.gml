/// @description Insert description here
// You can write your code in this editor

y = global.rm_height - global.hud_height - 16;
image_speed = 0;
if global.level_pad[global.selected,0] != "" and global.level_pad[global.selected,1] != ""
{
	//Switch to rotating shooter
	mode = 2;
	sprite_index = global.sprite_pad;
	x = global.level_pad[global.selected,0];
	y = global.level_pad[global.selected,1];
	if global.level_pad[global.selected,2] != "" and global.level_pad[global.selected,3] != ""
	instance_create_depth(global.level_pad[global.selected,2], global.level_pad[global.selected,3], 
		depth,ob_pad2);
}
else
{
	mode = 1;
	sprite_index = global.sprite_shooter;
}
xstart = x;
ystart = y;
offset = 0;
dir = 2;
colour = 0;
spin = 0;
spd = 0;