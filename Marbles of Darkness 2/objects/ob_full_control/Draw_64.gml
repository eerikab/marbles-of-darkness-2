/// @description Debug overlay
// You can write your code in this editor

if global.debug
{
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text(32,32,text);
	
	draw_set_font(global.font_small);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
}