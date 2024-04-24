/// @description Initialize variables
// You can write your code in this editor

global.color[0] = make_color_rgb(255,255,255);
global.color[1] = make_color_rgb(0,0,255);
global.color[2] = make_color_rgb(255,0,0);
global.color[3] = make_color_rgb(255,255,0);
global.color[4] = make_color_rgb(0,255,0);
global.color[5] = make_color_rgb(255,0,255);
global.color[6] = make_color_rgb(0,0,0);
global.color[7] = make_color_rgb(255,255,255);
global.color[8] = make_color_rgb(255,128,0);
global.color[9] = make_color_rgb(0,255,255);
global.color[10] = make_color_rgb(255,0,255);
global.color[11] = make_color_rgb(255,255,255);
global.color[12] = make_color_rgb(255,255,255);
global.color[13] = make_color_rgb(255,255,255);
global.color[14] = make_color_rgb(255,255,255);
global.color[15] = make_color_rgb(255,255,255);
global.color[16] = make_color_rgb(255,255,255);
global.color[17] = make_color_rgb(255,255,255);
global.color[18] = make_color_rgb(255,255,255);
global.color[19] = make_color_rgb(255,255,255);

//Load save
sc_load();

ini_open("save.ini");
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

//Initialise variables
global.bullets = 0;
global.chain = 0;
global.chain_high = 0;
global.combo_high = 0;
global.dif_user = 0;
global.difficulty = 0;
global.endless_dif = 0;
global.hardness = 0;
global.level_progress = 0;
global.level_time = 0;
global.lvl_music = 0;
global.match_colour = 0;
global.match_pos = 0;
global.matches = 0;
global.onehole = 0;
global.orbs_shot = 0;
global.path_multi = 0;
global.powerups = 0;
global.precise = 0;
global.retract = 0;
global.reverse = 0;
global.selected = 0;
global.segments = 0;
global.shots_missed = 0;
global.slow = 0;
global.specialorb = 0;
global.start_score = 0;
global.stop = 0;
global.warning = 0;
global.music_nr = 0;
global.freeplay_select = 1;

alarm[1] = 60;