/// @description First setup, loading screen
// You can write your code in this editor

delay = 5;
image_alpha = 1;
image_speed = 0;
error_raised = false;
area = "";
progress = 0;

//OS localization, file directories
switch os_type
{
	case os_windows:
		global.directory = program_directory + "/assets/";
		break;
	case os_linux:
		global.directory = working_directory + "/assets/";
		break;
}

//Load sprites
area = "Sprites"
global.sprite_logo = sprite_add(global.directory + "sprites/sp_logo.png",1,0,1,0,0);
if !sprite_exists(global.sprite_logo)
sc_error("sp_logo not found");

global.sprite_progress_back = sprite_add(global.directory + "sprites/sp_progress_back.png",1,0,1,0,0);
if !sprite_exists(global.sprite_progress_back)
sc_error("sp_progress_back not found");
sprite_set_offset(global.sprite_progress_back,
	sprite_get_width(global.sprite_progress_back)/2, sprite_get_height(global.sprite_progress_back)/2);
	
global.sprite_progress_front = sprite_add(global.directory + "sprites/sp_progress_front.png",2,0,1,0,0);
if !sprite_exists(global.sprite_progress_front)
sc_error("sp_progress_front not found");
	
sprite_index = global.sprite_progress_front;
back = global.sprite_progress_back;

name = global.directory + "config/texts.ini";
ini_open(name);
sect = "Buttons";
global.txt_button_loading = ini_read_string(sect,"loading","");
global.txt_button_click = ini_read_string(sect,"click","");
ini_close();

global.background_stretch = 0;
name = global.directory + "config/images.ini";
ini_open(name);
area = "Image config, Backgrounds";
sect = "Backgrounds";
path = global.directory + "backgrounds/" + ini_read_string(sect,"menu","") + ".png";
global.back_menu = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_menu)
sc_error("Menu background not found");
else
sc_background(global.back_menu);

//Font
area = "Fonts";
sect = "Font";
path = global.directory + "fonts/" + ini_read_string(sect,"file1","");
global.font_small = font_add(path, ini_read_real(sect,"size1",10), 0, 0, 32, 255);
if !font_exists(global.font_small)
global.font_small = fn_verdana;

path = global.directory + "fonts/" + ini_read_string(sect,"file2","");
global.font_large = font_add(path, ini_read_real(sect,"size2",10), 0, 0, 32, 255);
if !font_exists(global.font_large)
global.font_large = fn_verdana_big;
ini_close();

draw_set_font(global.font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

if error_raised
exit;

progress = 12.5;
alarm[0] = delay;