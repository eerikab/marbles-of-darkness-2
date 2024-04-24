/// @description Insert description here
// You can write your code in this editor

size[1] = ds_list_size(global.ds_id1);
size[2] = ds_list_size(global.ds_id2);
size[3] = ds_list_size(global.ds_id3);
size[4] = ds_list_size(global.ds_id4);
size[5] = ds_list_size(global.ds_id5);
if size[1] + size[2] + size[3] + size[4] + size[5] == 0
{
	instance_destroy();
	exit;
}

index = irandom_range(1,global.paths);
counter = 0
while size[index] == 0 and counter < 100
{
	counter += 1;
	index = irandom_range(1,global.paths);
}
if counter == 100
{
	instance_destroy();
	exit;
}

if index == 1
{
	orb = ds_list_find_value(global.ds_id1,irandom( ds_list_size( global.ds_id1) - 2));
	effect_create_above(ef_explosion,orb.x,orb.y,0, make_colour_rgb(255,128,0));
	instance_destroy(orb);
	global.level_progress += 1;
	score += 100;
}
if index == 2
{
	orb = ds_list_find_value(global.ds_id2,irandom( ds_list_size( global.ds_id2) - 2));
	effect_create_above(ef_explosion,orb.x,orb.y,0, make_colour_rgb(255,128,0));
	instance_destroy(orb);
	global.level_progress += 1;
	score += 100;
}
if index == 3
{
	orb = ds_list_find_value(global.ds_id3,irandom( ds_list_size( global.ds_id3) - 2));
	effect_create_above(ef_explosion,orb.x,orb.y,0, make_colour_rgb(255,128,0));
	instance_destroy(orb);
	global.level_progress += 1;
	score += 100;
}
if index == 4
{
	orb = ds_list_find_value(global.ds_id4,irandom( ds_list_size( global.ds_id4) - 2));
	effect_create_above(ef_explosion,orb.x,orb.y,0, make_colour_rgb(255,128,0));
	instance_destroy(orb);
	global.level_progress += 1;
	score += 100;
}
if index == 5
{
	orb = ds_list_find_value(global.ds_id5,irandom( ds_list_size( global.ds_id5) - 2));
	effect_create_above(ef_explosion,orb.x,orb.y,0, make_colour_rgb(255,128,0));
	instance_destroy(orb);
	global.level_progress += 1;
	score += 100;
}

amount -= 1;
if amount > 0
alarm[0] = 4;