/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_alpha(image_alpha);
draw_set_halign(fa_left);
draw_text(x+48,y,global.dif_mode_name[i]);
draw_set_halign(fa_center);
if abs(mouse_y - y) < 16 and abs(mouse_x - x) < 160
{
	draw_set_colour(c_yellow);
	draw_text(global.rm_width/2,global.rm_height/2+96,global.txt_multiplier + string(global.dif_mode[i]) + "X");
	draw_set_color(c_white);
}
draw_set_alpha(1);