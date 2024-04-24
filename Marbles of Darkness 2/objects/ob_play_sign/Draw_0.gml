/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(image_alpha / 2);
draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
draw_set_alpha(image_alpha);

draw_self();
draw_set_font(global.font_large);
draw_set_alpha(image_alpha);
draw_text(x,y-192,global.txt_play_title);
draw_set_font(global.font_small);

if instance_exists(ob_adventure_difficulty)
{
draw_text(x-160,y-96,global.txt_difficulty);
draw_text(x+160,y-96,global.txt_length);
}
if instance_exists(ob_button_newgame)
{
	
	draw_set_valign(fa_top);
	ini_open("save.ini");
	if global.gamemode == 1
	mode = "Adventure";
	else if global.gamemode == 2
	mode = "Practice";
	else if global.gamemode == 3
	mode = "Endless";
	check = global.txt_load[global.gamemode]
	check += "\n\n" + ini_read_string(mode,"mid_level","");
	check += "\n" + ini_read_string(mode,"mid_name","");
	check += "\nScore: " + string(ini_read_real(mode,"mid_score",0));
	check += "\n" + ini_read_string(mode,"mid_difficulty_text","");
	check += "\n" + ini_read_string(mode,"mid_length","");
	draw_text(x,y-128,check);
	
	draw_set_valign(fa_middle);
}

draw_set_alpha(1);