/// @description General config
// You can write your code in this editor

name = global.directory + "config/general.ini";
ini_open(name);

//Load interface configuration
global.hud_height = ini_read_real("GUI","hud_height",32);
global.instruct_pad = ini_read_real("GUI","instruction_pad",0);
global.offset = [];
global.offset[1] = ini_read_real("GUI","lives_offset",0);
global.offset[2] = ini_read_real("GUI","level_offset",0);
global.offset[3] = ini_read_real("GUI","bar_offset",0);
global.offset[4] = ini_read_real("GUI","score_offset",0);
global.offset[5] = ini_read_real("GUI","menu_offset",0);
global.colortext = ini_read_real("GUI","color_text",0);

//Load gameplay configuration
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
global.savefile = ini_read_string("Gameplay","savefile","");

ini_close();

//Load save
sc_load();

ini_open(global.savefile + "save.ini");
global.music = ini_read_real("Settings","music",1);
global.sound = ini_read_real("Settings","sound",1);
global.vsync = ini_read_real("Settings","vsync",1);
global.alias = ini_read_real("Settings","alias",1);
window_set_fullscreen(ini_read_real("Settings","fullscreen",0));

global.highscore[1] = ini_read_real("Highscore","1",0);
global.highscore[2] = ini_read_real("Highscore","2",0);
global.highscore[3] = ini_read_real("Highscore","3",0);
global.highscore[4] = ini_read_real("Highscore","4",0);
global.highscore[5] = ini_read_real("Highscore","5",0);

global.stat_shot = ini_read_real("Stats","shot",0);
global.stat_clear = ini_read_real("Stats","clear",0);
global.stat_combo = ini_read_real("Stats","combo",0);
global.stat_chain = ini_read_real("Stats","chain",0);
global.stat_power = ini_read_real("Stats","power",0);
global.stat_wins = ini_read_real("Stats","wins",0);
global.stat_time = ini_read_real("Stats","time",0);

ini_close();

display_reset(0,global.vsync);
gpu_set_texfilter(global.alias);

sc_load_advance();