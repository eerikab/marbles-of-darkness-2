/// @description Insert description here
// You can write your code in this editor

sprite_index = global.sprite_slider_bar_h;
if room = rm_map
{
	xstart = global.rm_width/2;
	x = xstart;
	y = global.rm_height-64;
	ystart = y;
	slider = instance_create_depth(x-144,y,depth-25,ob_slider_adventure);
}
else
slider = instance_create_depth(x-144,y,depth-25,ob_slider_sound);
slider.image_alpha = image_alpha;