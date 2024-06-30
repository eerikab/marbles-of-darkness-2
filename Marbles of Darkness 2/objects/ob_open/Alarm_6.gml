/// @description Load sprites
// You can write your code in this editor

area = "Images"
global.sprite_accuracy = sprite_add(global.directory + "sprites/sp_accuracy.png",1,0,1,0,0);
sprite_set_offset(global.sprite_accuracy, 0, sprite_get_height(global.sprite_accuracy)/2);
sprite_collision_mask(global.sprite_accuracy,1,0,0,0,0,0,bboxkind_precise,192);
if !sprite_exists(global.sprite_accuracy)
sc_error("sp_accuracy not found");

global.sprite_adventure_banner = sprite_add(global.directory + "sprites/sp_adventure_banner.png",1,0,1,0,0);
sprite_set_offset(global.sprite_adventure_banner,
	sprite_get_width(global.sprite_adventure_banner)/2, sprite_get_height(global.sprite_adventure_banner)/2);
if !sprite_exists(global.sprite_adventure_banner)
sc_error("sp_adventure_banner not found");

global.sprite_adventure_dot = sprite_add(global.directory + "sprites/sp_adventure_dot.png",1,0,1,0,0);
sprite_set_offset(global.sprite_adventure_dot,
	sprite_get_width(global.sprite_adventure_dot)/2, sprite_get_height(global.sprite_adventure_dot)/2);
if !sprite_exists(global.sprite_adventure_dot)
sc_error("sp_adventure_dot not found");
	
global.sprite_adventure_end = sprite_add(global.directory + "sprites/sp_adventure_end.png",1,0,1,0,0);
sprite_set_offset(global.sprite_adventure_end,
	sprite_get_width(global.sprite_adventure_end)/2, sprite_get_height(global.sprite_adventure_end)/2);
if !sprite_exists(global.sprite_adventure_end)
sc_error("sp_adventure_end not found");
	
global.sprite_adventure_light = sprite_add(global.directory + "sprites/sp_adventure_light.png",1,0,1,0,0);
sprite_set_offset(global.sprite_adventure_light,
	sprite_get_width(global.sprite_adventure_light)/2, sprite_get_height(global.sprite_adventure_light)/2);
if !sprite_exists(global.sprite_adventure_light)
sc_error("sp_adventure_light not found");
	
global.sprite_antiorb = sprite_add(global.directory + "sprites/sp_antiorb.png",1,0,1,0,0);
sprite_set_offset(global.sprite_antiorb,
	sprite_get_width(global.sprite_antiorb)/2, sprite_get_height(global.sprite_antiorb)/2);
if !sprite_exists(global.sprite_antiorb)
sc_error("sp_antiorb not found");
	
global.sprite_asterisk = sprite_add(global.directory + "sprites/sp_asterisk.png",1,0,1,0,0);
sprite_set_offset(global.sprite_asterisk,
	sprite_get_width(global.sprite_asterisk)/2, sprite_get_height(global.sprite_asterisk)/2);
if !sprite_exists(global.sprite_asterisk)
sc_error("sp_asterisk not found");

global.sprite_blocker = sprite_add(global.directory + "sprites/sp_blocker.png",1,0,1,0,0);
sprite_set_offset(global.sprite_blocker,
	sprite_get_width(global.sprite_blocker)/2, sprite_get_height(global.sprite_blocker)/2);
if !sprite_exists(global.sprite_asterisk)
sc_error("sp_blocker not found");
	
global.sprite_board = sprite_add(global.directory + "sprites/sp_board.png",1,0,1,0,0);
sprite_set_offset(global.sprite_board,
	sprite_get_width(global.sprite_board)/2, sprite_get_height(global.sprite_board)/2);
if !sprite_exists(global.sprite_board)
sc_error("sp_board not found");
	
global.sprite_button = sprite_add(global.directory + "sprites/sp_button.png",3,0,1,0,0);
sprite_set_offset(global.sprite_button,
	sprite_get_width(global.sprite_button)/2, sprite_get_height(global.sprite_button)/2);
if !sprite_exists(global.sprite_button)
sc_error("sp_button not found");
	
global.sprite_button_big = sprite_add(global.directory + "sprites/sp_button_big.png",3,0,1,0,0);
sprite_set_offset(global.sprite_button_big,
	sprite_get_width(global.sprite_button_big)/2, sprite_get_height(global.sprite_button_big)/2);
if !sprite_exists(global.sprite_button_big)
sc_error("sp_button_big not found");
	
global.sprite_button_round = sprite_add(global.directory + "sprites/sp_button_round.png",4,0,1,0,0);
sprite_set_offset(global.sprite_button_round,
	sprite_get_width(global.sprite_button_round)/2, sprite_get_height(global.sprite_button_round)/2);
if !sprite_exists(global.sprite_button_round)
sc_error("sp_button_round not found");
	
global.sprite_electric_beam = sprite_add(global.directory + "sprites/sp_electric_beam.png",1,0,1,0,0);
sprite_set_offset(global.sprite_electric_beam,
	0, sprite_get_height(global.sprite_electric_beam)/2);
sprite_collision_mask(global.sprite_electric_beam,1,0,0,0,0,0,bboxkind_precise,192);
if !sprite_exists(global.sprite_electric_beam)
sc_error("sp_electric_beam not found");
	
global.sprite_freeplay = sprite_add(global.directory + "sprites/sp_freeplay.png",2,0,1,0,0);
sprite_set_offset(global.sprite_freeplay,
	sprite_get_width(global.sprite_freeplay)/2, sprite_get_height(global.sprite_freeplay)/2);
if !sprite_exists(global.sprite_freeplay)
sc_error("sp_freeplay not found");
	
global.sprite_hole = sprite_add(global.directory + "sprites/sp_hole.png",1,0,1,0,0);
sprite_set_offset(global.sprite_hole,
	sprite_get_width(global.sprite_hole)/2, sprite_get_height(global.sprite_hole)/2);
if !sprite_exists(global.sprite_hole)
sc_error("sp_hole not found");
	
global.sprite_level_ui = sprite_add(global.directory + "sprites/sp_level_ui.png",1,0,1,0,0);
sprite_set_offset(global.sprite_level_ui,
	sprite_get_width(global.sprite_level_ui)/2, sprite_get_height(global.sprite_level_ui)/2);
if !sprite_exists(global.sprite_level_ui)
sc_error("sp_level_ui not found");
	
global.sprite_orb_shadow = sprite_add(global.directory + "sprites/sp_orb_shadow.png",1,0,1,0,0);
sprite_set_offset(global.sprite_orb_shadow,
	sprite_get_width(global.sprite_orb_shadow)/2, sprite_get_height(global.sprite_orb_shadow)/2);
if !sprite_exists(global.sprite_orb_shadow)
sc_error("sp_orb_shadow not found");
	
global.sprite_powerup = sprite_add(global.directory + "sprites/sp_powerup.png",19,0,1,0,0);
sprite_set_offset(global.sprite_powerup,
	sprite_get_width(global.sprite_powerup)/2, sprite_get_height(global.sprite_powerup)/2);
if !sprite_exists(global.sprite_powerup)
sc_error("sp_powerup not found");
	
global.sprite_pusher = sprite_add(global.directory + "sprites/sp_pusher.png",1,0,1,0,0);
sprite_set_offset(global.sprite_pusher,
	sprite_get_width(global.sprite_pusher)/2, sprite_get_height(global.sprite_pusher)/2);
if !sprite_exists(global.sprite_pusher)
sc_error("sp_pusher not found");
	
global.sprite_pusher_shadow = sprite_add(global.directory + "sprites/sp_pusher_shadow.png",1,0,1,0,0);
sprite_set_offset(global.sprite_pusher_shadow,
	sprite_get_width(global.sprite_pusher_shadow)/2, sprite_get_height(global.sprite_pusher_shadow)/2);
if !sprite_exists(global.sprite_pusher_shadow)
sc_error("sp_pusher_shadow not found");
	
global.sprite_radio_button = sprite_add(global.directory + "sprites/sp_radio_button.png",3,0,1,0,0);
sprite_set_offset(global.sprite_radio_button,
	sprite_get_width(global.sprite_radio_button)/2, sprite_get_height(global.sprite_radio_button)/2);
if !sprite_exists(global.sprite_radio_button)
sc_error("sp_radio_button not found");
	
global.sprite_slider = sprite_add(global.directory + "sprites/sp_slider.png",1,0,1,0,0);
sprite_set_offset(global.sprite_slider,
	sprite_get_width(global.sprite_slider)/2, sprite_get_height(global.sprite_slider)/2);
if !sprite_exists(global.sprite_slider)
sc_error("sp_slider not found");
	
global.sprite_slider_bar = sprite_add(global.directory + "sprites/sp_slider_bar.png",1,0,1,0,0);
sprite_set_offset(global.sprite_slider_bar,
	sprite_get_width(global.sprite_slider_bar)/2, sprite_get_height(global.sprite_slider_bar)/2);
if !sprite_exists(global.sprite_slider_bar)
sc_error("sp_slider_bar not found");
	
global.sprite_slider_bar_h = sprite_add(global.directory + "sprites/sp_slider_bar_h.png",1,0,1,0,0);
sprite_set_offset(global.sprite_slider_bar_h,
	sprite_get_width(global.sprite_slider_bar_h)/2, sprite_get_height(global.sprite_slider_bar_h)/2);
if !sprite_exists(global.sprite_slider_bar_h)
sc_error("sp_slider_bar_h not found");

global.sprite_social = sprite_add(global.directory + "sprites/sp_social.png",3,0,1,0,0);
sprite_set_offset(global.sprite_social,
	sprite_get_width(global.sprite_social)/2, sprite_get_height(global.sprite_social)/2);
if !sprite_exists(global.sprite_social)
sc_error("sp_social not found");
	
global.sprite_warning = sprite_add(global.directory + "sprites/sp_warning.png",1,0,1,0,0);
sprite_set_offset(global.sprite_warning,
	sprite_get_width(global.sprite_warning)/2, sprite_get_height(global.sprite_warning)/2);
if !sprite_exists(global.sprite_warning)
sc_error("sp_warning not found");
	
global.sprite_warning_small = sprite_add(global.directory + "sprites/sp_warning_small.png",1,0,1,0,0);
sprite_set_offset(global.sprite_warning_small,
	sprite_get_width(global.sprite_warning_small)/2, sprite_get_height(global.sprite_warning_small)/2);
if !sprite_exists(global.sprite_warning_small)
sc_error("sp_warning_small not found");
	
name = global.directory + "config/images.ini";
ini_open(name);
i = 1;
sect = "Orbs"
area = "Image config, Orbs"
while true
{
	if ini_key_exists(sect,"sprite"+string(i))
	and ini_key_exists(sect,"frames"+string(i))
	{
		path = global.directory + "sprites/" + ini_read_string(sect,"sprite"+string(i),"") + ".png";
		frame = ini_read_real(sect,"frames"+string(i),0);
		global.sprite_orb[i] = sprite_add(path,frame,0,1,0,0);
		if !sprite_exists(global.sprite_accuracy)
		sc_error("Orb" + string[i] + "sprite not found");
		sprite_set_offset(global.sprite_orb[i],
			sprite_get_width(global.sprite_orb[i])/2, 
			sprite_get_height(global.sprite_orb[i])/2);
		global.orb_shadow[i] = ini_read_real(sect,"shadow"+string(i),1);
		
		global.orb_sprites = i;
		if i > 19
		global.color[i] = make_color_rgb(255,255,255);
	}
	else
	{
		if i > 10 and i < 20
		sc_error("No sprite assigned for orb");
		if i > 10
		break;
	}
	i+=1;
}

//Backgrounds
area = "Image config, Backgrounds";
sect = "Backgrounds";
path = global.directory + "backgrounds/" + ini_read_string(sect,"menu","") + ".png";
global.back_menu = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_menu)
sc_error("Menu background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"map","") + ".png";
global.back_map = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_map)
sc_error("Map background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"freeplay","") + ".png";
global.back_play = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_play)
sc_error("Freeplay background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"instructions","") + ".png";
global.back_instruct = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_instruct)
sc_error("Instructions background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"stats","") + ".png";
global.back_stat = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_stat)
sc_error("Stats background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"ending","") + ".png";
global.back_end = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_end)
sc_error("Ending background not found");

path = global.directory + "backgrounds/" + ini_read_string(sect,"credits","") + ".png";
global.back_credits = sprite_add(path,1,0,1,0,0);
if !sprite_exists(global.back_credits)
sc_error("Credits background not found");

//Rest of sprites
sect = "Orbs"
area = "Image config, Orbs"
global.sprite_shooter = sprite_add(global.directory + "sprites/sp_shooter.png",
	ini_read_real(sect,"shooterframes",1),0,1,0,0);
sprite_set_offset(global.sprite_shooter,
	sprite_get_width(global.sprite_shooter)/2, sprite_get_height(global.sprite_shooter)/2);
if !sprite_exists(global.sprite_shooter)
sc_error("sp_shooter not found");

global.sprite_pad = sprite_add(global.directory + "sprites/sp_pad.png",
	ini_read_real(sect,"shooterframes",1),0,1,0,0);
sprite_set_offset(global.sprite_pad,
	sprite_get_width(global.sprite_pad)/2, sprite_get_height(global.sprite_pad)/2);
if !sprite_exists(global.sprite_pad)
sc_error("sp_pad not found");
	
global.sprite_pad2 = sprite_add(global.directory + "sprites/sp_pad2.png",2,0,1,0,0);
sprite_set_offset(global.sprite_pad2,
	sprite_get_width(global.sprite_pad2)/2, sprite_get_height(global.sprite_pad2)/2);
if !sprite_exists(global.sprite_pad2)
sc_error("sp_pad2 not found");
	
global.shooter_offset = ini_read_real(sect,"shooteroffset",0);
global.pad_offset = ini_read_real(sect,"padoffset",0);

origin_x = ini_read_real("Powerup display","precise_origin_x",0);
origin_y = ini_read_real("Powerup display","precise_origin_y",0);
global.sprite_precise = sprite_add(global.directory + "sprites/sp_precise.png",1,0,1,origin_x,origin_y);

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

if error_raised
exit;
progress = 90;
alarm[7] = delay;