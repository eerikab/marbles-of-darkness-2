/// @description General config
// You can write your code in this editor

name = global.directory + "config/general.ini";
ini_open(name);

global.display_width = ini_read_real("Display","display_width",1024);
global.display_height = ini_read_real("Display","display_height",576);
global.rm_width = ini_read_real("Display","room_width",1024);
global.rm_height = ini_read_real("Display","room_height",576);
if global.rm_width < 848
global.rm_width = 848;
if global.rm_height < 480
global.rm_height = 480;
window_set_size(global.display_width,global.display_height);
display_set_gui_size(global.rm_width,global.rm_height);
global.background_stretch = ini_read_real("Display","stretch_background",0);

x = ini_read_real("GUI","loading_x",0);
y = ini_read_real("GUI","loading_y",0);
global.hud_height = ini_read_real("GUI","hud_height",32);
global.instruct_pad = ini_read_real("GUI","instruction_pad",0);
global.offset[1] = ini_read_real("GUI","lives_offset",0);
global.offset[2] = ini_read_real("GUI","level_offset",0);
global.offset[3] = ini_read_real("GUI","bar_offset",0);
global.offset[4] = ini_read_real("GUI","score_offset",0);
global.offset[5] = ini_read_real("GUI","menu_offset",0);
global.colortext = ini_read_real("GUI","color_text",0);

area = "General, Gameplay"
global.free_unlock = ini_read_real("Gameplay","freeplay_unlock",0);
global.extralife = ini_read_real("Gameplay","extralife",0);
if global.extralife <= 0
sc_error("extralife invalid value")
global.lifebonus = ini_read_real("Gameplay","lifebonus",0);
global.shotspeed = ini_read_real("Gameplay","shotspeed",0);
global.acc_speed = ini_read_real("Gameplay","accuracyspeed",0);
global.cool_reverse = ini_read_real("Gameplay","reversecooldown",0);
global.cool_stop = ini_read_real("Gameplay","stopcooldown",0);
global.cool_slow = ini_read_real("Gameplay","slowcooldown",0);
global.cool_precise = ini_read_real("Gameplay","precisecooldown",0);
global.cool_accuracy = ini_read_real("Gameplay","accuracycooldown",0);
global.cool_power = ini_read_real("Gameplay","powerupcooldown",0);
global.push_spd_const = ini_read_real("Gameplay","pusherspeedconstant",0);
global.push_spd_path = ini_read_real("Gameplay","pusherspeedpath",0);
global.push_boost_const = ini_read_real("Gameplay","pusherboostconstant",0);
global.push_boost_path = ini_read_real("Gameplay","pusherboostpath",0);
global.push_accel = ini_read_real("Gameplay","orbacceleration",0);
global.skip = ini_read_real("Gameplay","skiplevel",0);
global.link[0] = ini_read_string("Gameplay","link1","https://en.wikipedia.org/wiki/HTTP_404");
global.link[1] = ini_read_string("Gameplay","link2","https://en.wikipedia.org/wiki/HTTP_404");
global.link[2] = ini_read_string("Gameplay","link3","https://en.wikipedia.org/wiki/HTTP_404");

sc_window();

ini_close();

display_reset(0,global.vsync);
gpu_set_texfilter(global.alias);

if error_raised
exit;
alarm[1] = delay;
progress = 30;