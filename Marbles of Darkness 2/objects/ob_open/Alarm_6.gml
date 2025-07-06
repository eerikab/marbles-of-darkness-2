/// @description Load sprites
// You can write your code in this editor

//Generic sprites
area = "Images";
directory = "sprites";
global.sprite_accuracy = sc_load_sprite("sp_accuracy",1,0);
sprite_set_offset(global.sprite_accuracy, 0, sprite_get_height(global.sprite_accuracy)/2);

global.sprite_electric_beam = sc_load_sprite("sp_electric_beam",1);
sprite_set_offset(global.sprite_electric_beam,
	0, sprite_get_height(global.sprite_electric_beam)/2);

global.sprite_adventure_banner = sc_load_sprite("sp_adventure_banner",1);
global.sprite_adventure_dot = sc_load_sprite("sp_adventure_dot",1);
global.sprite_adventure_end = sc_load_sprite("sp_adventure_end",1);
global.sprite_adventure_light = sc_load_sprite("sp_adventure_light",1);
global.sprite_antiorb = sc_load_sprite("sp_antiorb",1);
global.sprite_asterisk = sc_load_sprite("sp_asterisk",1);
global.sprite_blocker = sc_load_sprite("sp_blocker",1);
global.sprite_board = sc_load_sprite("sp_board",1);
global.sprite_button = sc_load_sprite("sp_button",3);
global.sprite_button_big = sc_load_sprite("sp_button_big",3);
global.sprite_button_round = sc_load_sprite("sp_button_round",4);
global.sprite_freeplay = sc_load_sprite("sp_freeplay",2);
global.sprite_hole = sc_load_sprite("sp_hole",1);
global.sprite_level_ui = sc_load_sprite("sp_level_ui",1);
global.sprite_orb_shadow = sc_load_sprite("sp_orb_shadow",1);
global.sprite_powerup = sc_load_sprite("sp_powerup",19);
global.sprite_pusher = sc_load_sprite("sp_pusher",1);
global.sprite_pusher_shadow = sc_load_sprite("sp_pusher_shadow",1);
global.sprite_radio_button = sc_load_sprite("sp_radio_button",3);
global.sprite_slider = sc_load_sprite("sp_slider",1);
global.sprite_slider_bar = sc_load_sprite("sp_slider_bar",1);
global.sprite_slider_bar_h = sc_load_sprite("sp_slider_bar_h",1);
global.sprite_social = sc_load_sprite("sp_social",3);
global.sprite_warning = sc_load_sprite("sp_warning",1);
global.sprite_warning_small = sc_load_sprite("sp_warning_small",1);
	
//Orb sprites
name = global.directory + "config/images.ini";
ini_open(name);
i = 1;
sect = "Orbs"
area = "Image config, Orbs"
while true
{
	if ini_key_exists(sect,"sprite"+string(i))
	{
		frame = ini_read_real(sect,"frames"+string(i),1);
		global.sprite_orb[i] = sc_load_sprite( 
			ini_read_string(sect,"sprite"+string(i),""),frame,1,0,0,
			"Orb " + string(i) + " sprite"
		);
		global.orb_shadow[i] = ini_read_real(sect,"shadow"+string(i),1);
		
		global.orb_sprites = i;
		if i > 19
		global.color[i] = c_white;
	}
	else
	{
		if (i > 10)
		{
			if (i < 20)
			sc_error("No sprite assigned for orb " + string(i));
			
			break;
		}
	}
	i+=1;
}

//Sprite config
global.sprite_shooter = sc_load_sprite("sp_shooter", ini_read_real(sect,"shooterframes",1));
global.sprite_pad = sc_load_sprite("sp_pad", ini_read_real(sect,"shooterframes",1));
global.sprite_pad2 = sc_load_sprite("sp_pad2",2);
	
global.shooter_offset = ini_read_real(sect,"shooteroffset",0);
global.pad_offset = ini_read_real(sect,"padoffset",0);

origin_x = ini_read_real("Powerup display","precise_origin_x",0);
origin_y = ini_read_real("Powerup display","precise_origin_y",0);
global.sprite_precise = sc_load_sprite("sp_precise",1,0,origin_x,origin_y);

global.precise_alpha = ini_read_real("Powerup display","precise_opacity",1);
global.accuracy_alpha = ini_read_real("Powerup display","accuracy_opacity",1);
	
i = 1;
sect = "Hole";
global.light_num = 0;
while ini_key_exists(sect,"light" + string(i) + "_dist")
and ini_key_exists(sect,"light" + string(i) + "_angle")
{
	global.light_dist[i] = ini_read_real(sect,"light" + string(i) + "_dist",0);
	global.light_angle[i] = ini_read_real(sect,"light" + string(i) + "_angle",0);
	global.light_num = i;
	i += 1;
}
ini_close();

sc_load_advance();