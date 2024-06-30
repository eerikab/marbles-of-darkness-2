/// @description Drawing
// You can write your code in this editor

//Accuracy beam
if global.accuracy > 0 and !shot
{
	if global.accuracy > 5*60
	image_alpha = global.accuracy_alpha;
	else
	image_alpha = global.accuracy / 5 / 60 * global.accuracy_alpha;
	
	sprite = sprite_index;
	sprite_index = global.sprite_accuracy;
	image_xscale = 0.01;
	image_blend = global.color[colour];
	while image_xscale < 1
	{
		image_xscale += 0.002;
		var stop = 0;
		with(ob_orb)
		{
			if place_meeting(x,y,other) and shootable
			stop = 1;
		}
		with(ob_pusher)
		{
			if place_meeting(x,y,other) and shootable
			stop = 1;
		}
		if stop
		break;
	}
	draw_self();
	
	sprite_index = sprite;
	image_xscale = 1;
	image_blend = c_white;
	image_alpha = 1;
}

//Precision arrow
if global.precise > 0 and !shot
{
	draw_sprite_ext(global.sprite_precise,0,mouse_x,mouse_y,1,1,image_angle, 
	global.color[colour], min(global.precise_alpha, global.precise/120*global.precise_alpha));
}

//Orb
if global.orb_shadow[colour]
draw_sprite(global.sprite_orb_shadow, 0, x+4, y+4);
draw_self();