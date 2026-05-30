/// @description Initialize shooters and pads
// You can write your code in this editor

y = global.rm_height - global.hud_height - 16;
image_speed = 0;
if array_length(global.level_pad[global.selected]) >= 2
{
	//Switch to rotating shooter
	rotating = true;
	sprite_index = global.sprite_pad;
	x = global.level_pad[global.selected,0];
	y = global.level_pad[global.selected,1];
	for (i = 2; i < array_length(global.level_pad[global.selected]); i += 2)
	instance_create_depth(global.level_pad[global.selected, i], global.level_pad[global.selected, i+1], 
		depth+5, ob_pad2);
}
else
{
	rotating = false;
	sprite_index = global.sprite_shooter;
}
xstart = x;
ystart = y;
offset = 0;
dir = 2;
colour = 0;
spin = 0;
spd = 0;