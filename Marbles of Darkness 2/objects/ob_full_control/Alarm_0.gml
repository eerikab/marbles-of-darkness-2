/// @description Load mid-level save
// You can write your code in this editor

ini_open(global.savefile + "save.ini");
	
//Load data
//Save data
global.bullets = ini_read_real(mode,"mid_bullets",0);
global.chain = ini_read_real(mode,"mid_chain",0);
global.chain_high = ini_read_real(mode,"mid_chain_high",0);
global.combo_high = ini_read_real(mode,"mid_combo_high",0);
global.dif_user = ini_read_real(mode,"mid_dif_user",0);
global.difficulty = ini_read_real(mode,"mid_difficulty",0);
global.endless_dif = ini_read_real(mode,"mid_endless_dif",0);
global.hardness = ini_read_real(mode,"mid_hardness",0);
global.level_progress = ini_read_real(mode,"mid_level_progress",0);
global.level_time = ini_read_real(mode,"mid_level_time",0);
global.lvl_music = ini_read_real(mode,"mid_lvl_music",0);
global.match_colour = ini_read_real(mode,"mid_match_colour",0);
global.match_pos = ini_read_real(mode,"mid_match_pos",0);
global.matches = ini_read_real(mode,"mid_matches",0);
global.onehole = ini_read_real(mode,"mid_onehole",0);
global.orbs_shot = ini_read_real(mode,"mid_orbs_shot",0);
global.path_multi = ini_read_real(mode,"mid_path_multi",0);
global.accuracy = ini_read_real(mode,"mid_accuracy",0);
global.powerups = ini_read_real(mode,"mid_powerups",0);
global.precise = ini_read_real(mode,"mid_precise",0);
global.retract = ini_read_real(mode,"mid_retract",0);
global.reverse = ini_read_real(mode,"mid_reverse",0);
global.selected = ini_read_real(mode,"mid_selected",0);
global.segments = ini_read_real(mode,"mid_segments",0);
global.shots_missed = ini_read_real(mode,"mid_shots_missed",0);
global.slow = ini_read_real(mode,"mid_slow",0);
global.specialorb = ini_read_real(mode,"mid_specialorb",0);
global.start_score = ini_read_real(mode,"mid_start_score",0);
global.stop = ini_read_real(mode,"mid_stop",0);
global.warning = ini_read_real(mode,"mid_warning",0);
score = ini_read_real(mode,"mid_score",0);
global.adv_live_score = ini_read_real(mode,"mid_live_score",0);
lives = ini_read_real(mode,"mid_lives",0);

ob_shooter.colour = ini_read_real(mode,"mid_shooter",0);

global.music_nr = ini_read_real(mode,"mid_music",0);
if global.music_nr > global.mus_game_num
global.music_nr = 1;
global.lvl_music = global.mus_game[global.music_nr];
if !audio_is_playing(global.lvl_music)
{
sc_sound_stop(0);
sc_sound_gain(0, global.music);
audio_play_sound(global.lvl_music,0,1);
audio_play_sound(global.mus_warning,0,1);
audio_pause_sound(global.mus_warning);
}
ini_close();

with(ob_spawner)
cooldown = ini_read_real(mode,"mid_cooldown_" + string(pathnr),0);

var _txt = file_text_open_read(global.savefile + mode + ".txt");

//Shot orbs
_json = file_text_readln(_txt);
show_debug_message(_json);
_loaddata = json_parse(_json);
while (array_length(_loaddata) > 0)
{
	_loadobj = array_pop(_loaddata);
	with(instance_create_depth(0,0,0,asset_get_index(_loadobj.obj)))
	{
		x = _loadobj.x;
		y = _loadobj.y;
		image_index = _loadobj.image_index;
		colour = _loadobj.colour;
		shot = _loadobj.shot;
		image_angle = _loadobj.image_angle;
		new_ball = _loadobj.new_ball;
		matching = _loadobj.matching;
		knockback = _loadobj.knockback;
		reverse = _loadobj.reverse;
		pos = _loadobj.pos;
		orb = _loadobj.orb;
		create_orb = _loadobj.create_orb;
	}
}

//Load paths
var _json = file_text_readln(_txt);
var paths = json_parse(_json);

for(pathnr = 0; pathnr < array_length(paths); pathnr++)
{
	for (index = 0; index < array_length(paths[pathnr]); index++)
	{
		pos = paths[pathnr][index][0];
		col = paths[pathnr][index][1];
		
		if col == 0
		object = ob_pusher;
		else
		object = ob_orb;

		a = instance_create_depth(x,y,0,object,
		{
			path : global.path[pathnr+1],
			pathnr : pathnr+1,
			pos : pos,
			index : -1,
			colour : col
		});
		a.spd = 0;

		a.pos = pos;
		a.colour = col;
	}
}

//Powerups
var _json = file_text_readln(_txt);
show_debug_message(_json);
var _loaddata = json_parse(_json);
while (array_length(_loaddata) > 0)
{
	var _loadobj = array_pop(_loaddata);
	with(instance_create_depth(0,0,0,asset_get_index(_loadobj.obj),{colour : 1}))
	{
		x = _loadobj.x;
		y = _loadobj.y;
		image_index = _loadobj.image_index;
		image_blend = _loadobj.image_blend;
		depth = _loadobj.depth;
		move = _loadobj.move;
		cooldown = _loadobj.cooldown;
		
	}
}

//Antiorbs
_json = file_text_readln(_txt);
_loaddata = json_parse(_json);
while (array_length(_loaddata) > 0)
{
	_loadobj = array_pop(_loaddata);
	instance_create_depth(0,0,0,asset_get_index(_loadobj.obj),{
		pathnr : _loadobj.pathnr,
		pos : _loadobj.pos
	});
}

//Blockers
_json = file_text_readln(_txt);
_loaddata = json_parse(_json);
while (array_length(_loaddata) > 0)
{
	_loadobj = array_pop(_loaddata);
	with(instance_create_depth(0,0,0,asset_get_index(_loadobj.obj),{pathnr : _loadobj.pathnr}))
	{
		life = _loadobj.life;
	}
}

//Inferno
_json = file_text_readln(_txt);
_loaddata = json_parse(_json);
while (array_length(_loaddata) > 0)
{
	_loadobj = array_pop(_loaddata);
	with(instance_create_depth(0,0,0,asset_get_index(_loadobj.obj)))
	{
		amount = _loadobj.amount;
	}
}

if instance_exists(ob_hole)
ob_hole.image_alpha = 1;
instance_destroy(ob_intro);
instance_activate_all();

