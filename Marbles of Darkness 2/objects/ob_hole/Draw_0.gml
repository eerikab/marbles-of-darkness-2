/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_sprite_ext(global.sprite_warning,0,x,y,1,1,0,c_white,alpha1);

for (i = 1; i <= global.light_num; i +=1)
{
	draw_sprite_ext(global.sprite_warning_small,0, 
	x + lengthdir_x(global.light_dist[i],global.light_angle[i]+image_angle),
	y + lengthdir_y(global.light_dist[i],global.light_angle[i]+image_angle),
	1,1,angle,c_white,alpha2)
}