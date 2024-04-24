/// @description Load text
// You can write your code in this editor

placeholder = "";
name = global.directory + "config/texts.ini";
ini_open(name);
sect = "Adventure";
global.txt_reset = sc_newline(sect,"reset",placeholder);
global.txt_stage = sc_newline(sect,"stage",placeholder);
global.txt_multiplier = sc_newline(sect,"multiplier",placeholder);
global.txt_complete = sc_newline(sect,"complete",placeholder);
 
sect = "Buttons";
global.txt_button_play = sc_newline(sect,"play",placeholder);
global.txt_button_start = sc_newline(sect,"start",placeholder);
global.txt_button_back = sc_newline(sect,"back",placeholder);
global.txt_button_close = sc_newline(sect,"close",placeholder);
global.txt_button_exit = sc_newline(sect,"exit",placeholder);
global.txt_button_load = sc_newline(sect,"load",placeholder);
global.txt_button_menu = sc_newline(sect,"menu",placeholder);
global.txt_button_new = sc_newline(sect,"new",placeholder);
global.txt_button_next = sc_newline(sect,"next",placeholder);
global.txt_button_previous = sc_newline(sect,"previous",placeholder);
global.txt_button_loading = sc_newline(sect,"loading",placeholder);
global.txt_button_click = sc_newline(sect,"click",placeholder);

sect = "Credits";
global.txt_credits = sc_newline(sect,"title",placeholder);
global.txt_credits_line[1] = sc_newline(sect,"line1",placeholder);
global.txt_credits_line[2] = sc_newline(sect,"line2",placeholder);
global.txt_credits_line[3] = sc_newline(sect,"line3",placeholder);
global.txt_credits_line[4] = sc_newline(sect,"line4",placeholder);

sect = "Ending";
global.txt_end = sc_newline(sect,"message",placeholder);
global.txt_end_score = sc_newline(sect,"score",placeholder);
global.txt_end_bonus = sc_newline(sect,"bonus",placeholder);
global.txt_end_total = sc_newline(sect,"total",placeholder);

sect = "Free play";
global.txt_free_dif = sc_newline(sect,"difficulty",placeholder);
global.txt_best = sc_newline(sect,"best",placeholder);
global.txt_free_practice = sc_newline(sect,"practice",placeholder);
global.txt_free_endless = sc_newline(sect,"endless",placeholder);
global.txt_locked = sc_newline(sect,"locked",placeholder);

sect = "Settings";
global.txt_settings = sc_newline(sect,"title",placeholder);
global.txt_fullscreen = sc_newline(sect,"fullscreen",placeholder);
global.txt_music = sc_newline(sect,"music",placeholder);
global.txt_sound = sc_newline(sect,"sound",placeholder);
global.txt_vsync = sc_newline(sect,"vsync",placeholder);
global.txt_alias = sc_newline(sect,"alias",placeholder);

sect = "Level stats";
global.txt_win = sc_newline(sect,"win",placeholder);
global.txt_lost = sc_newline(sect,"lost",placeholder);
global.txt_score = sc_newline(sect,"score",placeholder);
global.txt_orbs = sc_newline(sect,"orbs",placeholder);
global.txt_stat_combo = sc_newline(sect,"combo",placeholder);
global.txt_stat_chain = sc_newline(sect,"chain",placeholder);
global.txt_segments = sc_newline(sect,"segments",placeholder);
global.txt_powerups = sc_newline(sect,"powerups",placeholder);
global.txt_bonus = sc_newline(sect,"bonus",placeholder);
global.txt_accuracy = sc_newline(sect,"accuracy",placeholder);
global.txt_time = sc_newline(sect,"time",placeholder);
global.txt_fail = sc_newline(sect,"fail",placeholder);
global.txt_last = sc_newline(sect,"last",placeholder);
global.txt_left = sc_newline(sect,"left",placeholder);

sect = "HUD";
global.txt_paused = sc_newline(sect,"paused",placeholder);
global.txt_level = sc_newline(sect,"level",placeholder);
global.txt_lvl_adv = sc_newline(sect,"lvl_adv",placeholder);
global.txt_lives = sc_newline(sect,"lives",placeholder);
global.txt_blank = sc_newline(sect,"blank",placeholder);
global.txt_extralife = sc_newline(sect,"extralife",placeholder);
global.txt_combo = sc_newline(sect,"combo",placeholder);
global.txt_chain = sc_newline(sect,"chain",placeholder);
for (i = 1; i <= 18; i++)
global.txt_powerup[i] = sc_newline(sect,"powerup"+string(i),placeholder);

sect = "Instructions";
global.txt_instruct_title = sc_newline(sect,"title",placeholder);
global.txt_page_num = sc_newline(sect,"page",placeholder);
for(i = 1; i <= 4; i++)
global.txt_page[i] = sc_newline(sect,"page"+string(i),placeholder);
for(i = 1; i <= 4; i++)
global.txt_instruct[i] = sc_newline(sect,"instruct"+string(i),placeholder);
for(i = 1; i <= 3; i++)
global.txt_instruct_mode[i] = sc_newline(sect,"mode"+string(i),placeholder);
for(i = 1; i <= 18; i++)
global.txt_instruct_powerup[i] = sc_newline(sect,"powerup"+string(i),placeholder);
global.txt_instruct_powerups = sc_newline(sect,"powerups",placeholder);


sect = "Play";
global.txt_play_title = sc_newline(sect,"title",placeholder);
for(i = 1; i <= 3; i++)
global.txt_mode[i] = sc_newline(sect,"mode"+string(i),placeholder);
for(i = 1; i <= 3; i++)
global.txt_load[i] = sc_newline(sect,"load"+string(i),placeholder);
global.txt_difficulty = sc_newline(sect,"difficulty",placeholder);
global.txt_length = sc_newline(sect,"length",placeholder);
global.txt_stages = sc_newline(sect,"stages",placeholder);
global.txt_levels = sc_newline(sect,"levels",placeholder);

sect = "Global stats";
global.txt_stat_title = sc_newline(sect,"title",placeholder);
global.txt_highscore = sc_newline(sect,"highscore",placeholder);
for(i = 1; i <= 7; i++)
global.txt_stat[i] = sc_newline(sect,"stat"+string(i),placeholder);
ini_close();

if error_raised
exit

progress = 100;