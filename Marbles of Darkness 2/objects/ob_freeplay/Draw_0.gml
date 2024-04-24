/// @description Draw selection HUD
// You can write your code in this editor

//Overlap map list
draw_sprite_part(global.back_play,0,0,0,432,128,0,0);
draw_sprite_part(global.back_play,0,0,room_height-128,432,128,0,room_height-128);

//Selected map
draw_sprite_stretched(global.background[global.selected],0,x-200,y-192,400,225);
if global.gamemode == 2
{
	draw_text(x,y+224,global.txt_free_dif);
}
if global.gamemode == 3
draw_text(x,y+128,global.txt_best);

draw_set_font(global.font_large);
draw_text(x,y+72,global.title[global.selected]);
if global.gamemode == 2
draw_text(global.rm_width/2,48,global.txt_free_practice);
else if global.gamemode == 3
{
	draw_text(global.rm_width/2,48,global.txt_free_endless);
	draw_text(x,y+160,string(global.endless_high[global.selected]));
}

draw_set_font(global.font_small);