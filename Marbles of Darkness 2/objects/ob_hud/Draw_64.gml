/// @description Insert description here
// You can write your code in this editor
draw_x = x - sprite_width/2;
draw_y = y - sprite_height/2;

if paused
{
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(global.font_large);
	if !instance_exists(ob_settings)
	draw_text(room_width/2,room_height/2,global.txt_paused);
	draw_set_font(global.font_small);
}

draw_sprite(global.sprite_level_ui,0,room_width/2,room_height-global.hud_height/2);

draw_sprite(global.sprite_progress_back,0,x,y);

draw_sprite_part(sprite_index,0,0,0,
	global.level_progress/global.target*sprite_width,
	sprite_height,draw_x,draw_y);

if global.level_progress >= global.target and i < sprite_width
{
	if i = 0
	audio_play_sound(global.sou_bar_fill,0,0);
	if global.gamemode == 3
	{
		global.level_progress = 0;
		global.endless_dif += 1;
		if global.endless_dif mod 2 == 1 and global.difficulty < global.difficulty_num
		global.difficulty += 1;
		else
		global.hardness += global.increment;
	}
	else
	i += 4;
}

draw_sprite_part(sprite_index,1,0,0,
	i,sprite_height,draw_x,draw_y);

draw_text(x+global.offset[4],y,string(score));

if global.gamemode == 1
draw_text(x+global.offset[2],y,adv_text);
else if global.gamemode == 2
draw_text(x+global.offset[2],y,global.txt_level + string(global.difficulty));
else
draw_text(x+global.offset[2],y,global.txt_level + string(global.endless_dif));

if global.gamemode == 1
draw_text(x+global.offset[1],y,global.txt_lives + string(lives));
else
draw_text(x+global.offset[1],y,global.txt_blank);