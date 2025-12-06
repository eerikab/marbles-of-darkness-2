/// @description Initialize object
// You can write your code in this editor
sprite_index = global.sprite_progress_front;
i = 0;
x = global.rm_width/2;
y = global.rm_height-global.hud_height/2;
instance_create_depth(x+global.offset[5],y,depth-25,ob_button_menu);
paused = 0;
if global.gamemode == 1
adv_text = global.txt_lvl_adv + string(global.adv_stage) + "-" + string(global.adv_level);