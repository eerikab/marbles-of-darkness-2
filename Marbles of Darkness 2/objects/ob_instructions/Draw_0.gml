/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.font_large);
draw_text(global.rm_width/2,48,global.txt_instruct_title);
draw_set_font(global.font_small);
draw_text(global.rm_width/2,80,global.txt_page_num + string(page) + "/4");

switch(page)
{
	case 1:
		draw_text(global.rm_width/2,104,global.txt_page[1]);
		draw_text(x-256,y-16,global.txt_instruct[1]);
		draw_text(x+256,y-16,global.txt_instruct[2]);
		draw_text(x-256,y+192,global.txt_instruct[3]);
		draw_text(x+256,y+192,global.txt_instruct[4]);
		draw_arrow(x+256,y-96,x+256,y-128,12);
		draw_sprite(global.sprite_powerup,0,x+192,y+96);
		draw_sprite(global.sprite_powerup,4,x+192,y+96);
		draw_sprite(global.sprite_powerup,0,x+320,y+96);
		draw_sprite(global.sprite_powerup,5,x+320,y+96);
		break;
	case 2:
		draw_text(global.rm_width/2,104,global.txt_page[2]);
		draw_text(global.rm_width/2,global.rm_height/2,txt);
		break;
	case 3:
		draw_text(global.rm_width/2,104,global.txt_page[3]);
		draw_text(global.rm_width/2,128,global.txt_instruct_powerups);
		draw_set_halign(fa_left);
		
		if global.colortext
		draw_set_color(c_aqua);
		draw_text(x-416,y-104,global.txt_instruct_powerup[1]);
		draw_text(x-416,y-8,global.txt_instruct_powerup[2]);
		if global.colortext
		draw_set_color(c_red);
		draw_text(x-416,y+88,global.txt_instruct_powerup[3]);
		draw_text(x-416,y+184,global.txt_instruct_powerup[4]);
		if global.colortext
		draw_set_color(c_yellow);
		draw_text(x+96,y-104,global.txt_instruct_powerup[5]);
		draw_text(x+96,y-8,global.txt_instruct_powerup[6]);
		if global.colortext
		draw_set_color(c_lime);
		draw_text(x+96,y+88,global.txt_instruct_powerup[7]);
		draw_text(x+96,y+184,global.txt_instruct_powerup[8]);
		
		draw_sprite(global.sprite_powerup,0,x-464,y-104);
		draw_sprite(global.sprite_powerup,1,x-464,y-104);
		draw_sprite(global.sprite_powerup,0,x-464,y-8);
		draw_sprite(global.sprite_powerup,2,x-464,y-8);
		draw_sprite(global.sprite_powerup,0,x-464,y+88);
		draw_sprite(global.sprite_powerup,3,x-464,y+88);
		draw_sprite(global.sprite_powerup,0,x-464,y+184);
		draw_sprite(global.sprite_powerup,4,x-464,y+184);
		
		draw_sprite(global.sprite_powerup,0,x+48,y-104);
		draw_sprite(global.sprite_powerup,5,x+48,y-104);
		draw_sprite(global.sprite_powerup,0,x+48,y-8);
		draw_sprite(global.sprite_powerup,6,x+48,y-8);
		draw_sprite(global.sprite_powerup,0,x+48,y+88);
		draw_sprite(global.sprite_powerup,7,x+48,y+88);
		draw_sprite(global.sprite_powerup,0,x+48,y+184);
		draw_sprite(global.sprite_powerup,8,x+48,y+184);
		
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		break;
		
	case 4:
		draw_text(global.rm_width/2,104,global.txt_page[4]);
		draw_set_halign(fa_left);
		
		if global.colortext
		draw_set_color(c_fuchsia);
		draw_text(x-416,y-128,global.txt_instruct_powerup[9]);
		draw_text(x-416,y-48,global.txt_instruct_powerup[10]);
		if global.colortext
		draw_set_color(c_gray);
		draw_text(x-416,y+32,global.txt_instruct_powerup[11]);
		draw_text(x-416,y+112,global.txt_instruct_powerup[12]);
		draw_set_color(c_white);
		draw_text(x+96,y-128,global.txt_instruct_powerup[13]);
		draw_text(x+96,y-48,global.txt_instruct_powerup[14]);
		if global.colortext
		draw_set_color(c_orange);
		draw_text(x+96,y+32,global.txt_instruct_powerup[15]);
		draw_text(x+96,y+112,global.txt_instruct_powerup[16]);
		if global.colortext
		draw_set_color(c_aqua);
		draw_text(x-416,y+192,global.txt_instruct_powerup[17]);
		draw_text(x+96,y+192,global.txt_instruct_powerup[18]);
		
		draw_sprite(global.sprite_powerup,0,x-464,y-128);
		draw_sprite(global.sprite_powerup,9,x-464,y-128);
		draw_sprite(global.sprite_powerup,0,x-464,y-48);
		draw_sprite(global.sprite_powerup,10,x-464,y-48);
		draw_sprite(global.sprite_powerup,0,x-464,y+32);
		draw_sprite(global.sprite_powerup,11,x-464,y+32);
		draw_sprite(global.sprite_powerup,0,x-464,y+112);
		draw_sprite(global.sprite_powerup,12,x-464,y+112);
		draw_sprite(global.sprite_powerup,0,x-464,y+192);
		draw_sprite(global.sprite_powerup,17,x-464,y+192);
		
		draw_sprite(global.sprite_powerup,0,x+48,y-128);
		draw_sprite(global.sprite_powerup,13,x+48,y-128);
		draw_sprite(global.sprite_powerup,0,x+48,y-48);
		draw_sprite(global.sprite_powerup,14,x+48,y-48);
		draw_sprite(global.sprite_powerup,0,x+48,y+32);
		draw_sprite(global.sprite_powerup,15,x+48,y+32);
		draw_sprite(global.sprite_powerup,0,x+48,y+112);
		draw_sprite(global.sprite_powerup,16,x+48,y+112);
		draw_sprite(global.sprite_powerup,0,x+48,y+192);
		draw_sprite(global.sprite_powerup,18,x+48,y+192);
		
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		break;
}