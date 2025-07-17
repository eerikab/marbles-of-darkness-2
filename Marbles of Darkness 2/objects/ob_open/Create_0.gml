/// @description First setup, loading screen
// You can write your code in this editor

delay = 5;
image_alpha = 1;
image_speed = 0;
error_raised = false;
area = ""; //Type of asset loaded, for debugging
directory = ""; //Folder where sprites are located
sect = ""; //INI file section to read
progress = 0; //Amount of steps completed
steps = 9; //Amount of steps in loading

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

//Load window configuration
name = global.directory + "config/general.ini";
ini_open(name);

global.display_width = ini_read_real("Display","display_width",1024);
global.display_height = ini_read_real("Display","display_height",576);
global.rm_width = ini_read_real("Display","room_width",1024);
global.rm_height = ini_read_real("Display","room_height",576);
//Room size minimum limit of 848x480
if global.rm_width < 848
global.rm_width = 848;
if global.rm_height < 480
global.rm_height = 480;
window_set_size(global.display_width,global.display_height);
display_set_gui_size(global.rm_width,global.rm_height);
global.background_stretch = ini_read_real("Display","stretch_background",0);
window_set_caption(ini_read_string("Display","title",""))
x = ini_read_real("GUI","loading_x",0);
y = ini_read_real("GUI","loading_y",0);

ini_close();
sc_window();

//Load sprites
area = "Sprites"
directory = "sprites";
global.sprite_logo = sc_load_sprite("sp_logo",1,0);
global.sprite_progress_back = sc_load_sprite("sp_progress_back",1);
global.sprite_progress_front = sc_load_sprite("sp_progress_front",2,0);
	
sprite_index = global.sprite_progress_front;
back = global.sprite_progress_back;

//Loading text
name = global.directory + "config/texts.ini";
ini_open(name);
sect = "Opening";
txt_load_current = "";
txt_loading = ini_read_string(sect,"loading","");
txt_load = [
	ini_read_string(sect,"config",""),
	ini_read_string(sect,"music",""),
	ini_read_string(sect,"sound",""),
	ini_read_string(sect,"paths",""),
	ini_read_string(sect,"bg",""),
	ini_read_string(sect,"tunnel",""),
	ini_read_string(sect,"sprite",""),
	ini_read_string(sect,"text",""),
	ini_read_string(sect,"click","")
]
txt_click = ini_read_string(sect,"click","");
txt_error = ini_read_string(sect,"fail","Failure while loading. Check the resources");
ini_close();

//Menu background
name = global.directory + "config/images.ini";
ini_open(name);
area = "Image config, Backgrounds";
sect = "Backgrounds";
directory = "backgrounds";
global.back_menu = sc_load_sprite(ini_read_string(sect,"menu",""),1,0,0,0,"Menu background");
sc_background(global.back_menu);
ini_close();

//Font
name = global.directory + "config/general.ini";
ini_open(name);
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

sc_load_advance();