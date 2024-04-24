/// @description Insert description here
// You can write your code in this editor

if !instance_exists(ob_hud)
{
	draw_set_alpha(image_alpha / 2);
	draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(image_alpha);
}

draw_self();
draw_set_font(global.font_large);
draw_set_alpha(image_alpha);
//draw_text(64,288,string(instance_number(ob_button_adventure)));
draw_text(x,y-192,global.txt_settings);
draw_set_font(global.font_small);

draw_set_alpha(1);