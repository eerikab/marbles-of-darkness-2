/// @description Progress bar
// You can write your code in this editor

draw_x = x - sprite_width/2;
draw_y = y - sprite_height/2;

if sprite_exists(back)
draw_sprite(back,0,x,y);

if sprite_exists(sprite_index)
{
	if (progress == steps)
	{
		draw_sprite(sprite_index,1,draw_x,draw_y);
	}
	else
	{
		draw_sprite_part(sprite_index,0,0,0,
			progress/steps*sprite_width,
			sprite_height,draw_x,draw_y);
	}
}
draw_text(x,y,txt_load_current);