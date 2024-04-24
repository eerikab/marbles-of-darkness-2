/// @description Insert description here
// You can write your code in this editor

if path_position > 1- 64/length 
path_position -= 1/length;
image_angle += 1;

//Find front orb position
if pathnr = 1
{
	if ds_list_size(global.ds_id1) == 0
	exit;
	orb = ds_list_find_value(global.ds_id1,0);
}
if pathnr = 2
{
	if ds_list_size(global.ds_id2) == 0
	exit;
	orb = ds_list_find_value(global.ds_id2,0);
}
if pathnr = 3
{
	if ds_list_size(global.ds_id3) == 0
	exit;
	orb = ds_list_find_value(global.ds_id3,0);
}
if pathnr = 4
{
	if ds_list_size(global.ds_id4) == 0
	exit;
	orb = ds_list_find_value(global.ds_id4,0);
}
if pathnr = 5
{
	if ds_list_size(global.ds_id5) == 0
	exit;
	orb = ds_list_find_value(global.ds_id5,0);
}
//Break front orb if too close
if instance_exists(orb) and orb.pos > path_position - 34/length 
{
	instance_destroy(orb);
	life -= 1;
	//Explode if destroyed
	if life == 0
	{
		with(ob_orb)
		{
			if point_distance(x,y,other.x,other.y) < 160
			{
				score += 100;
				global.level_progress += 1;
				instance_destroy();
			}
		}
		audio_play_sound(global.sou_power_fireball_blast,0,0);
		effect_create_above(ef_explosion,x,y,2,make_color_rgb(255,128,0));
		instance_destroy();
	}
}