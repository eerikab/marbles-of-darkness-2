/// @description Insert description here
// You can write your code in this editor

if global.bullets > 0
draw_sprite_ext(sprite_index,16,x,y,image_xscale,image_yscale,
	image_angle,image_blend,image_alpha);
else
draw_self();