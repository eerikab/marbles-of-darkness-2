/// @description Progress bar
// You can write your code in this editor

draw_x = x - sprite_width/2;
draw_y = y - sprite_height/2;

draw_sprite(back,0,x,y);

draw_sprite_part(sprite_index,0,0,0,
	progress/100*sprite_width,
	sprite_height,draw_x,draw_y);
	
if progress == 100
{
	draw_sprite(sprite_index,1,draw_x,draw_y);
	draw_text(x,y,global.txt_button_click);
}
else
{
	draw_sprite_part(sprite_index,0,0,0,
		progress/100*sprite_width,
		sprite_height,draw_x,draw_y);
	draw_text(x,y,global.txt_button_loading);
}
