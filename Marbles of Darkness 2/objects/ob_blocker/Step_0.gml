/// @description Insert description here
// You can write your code in this editor

if path_position > 1- 64/length 
path_position -= 1/length;
image_angle += 1;

//Find front orb position
if (array_length(global.ls_orbs[pathnr]) == 0)
exit;
orb = global.ls_orbs[pathnr,0];

//Break front orb if too close
if instance_exists(orb) and orb.pos > path_position - 34/length 
{
	instance_destroy(orb);
	life -= 1;
	//Explode if destroyed
	if life == 0
	{
		with(ob_orb)
		{
			if point_distance(x,y,other.x,other.y) < 160
			{
				score += 100;
				global.level_progress += 1;
				instance_destroy();
			}
		}
		audio_play_sound(global.sou_power_fireball_blast,0,0);
		effect_create_above(ef_explosion,x,y,2,make_color_rgb(255,128,0));
		instance_destroy();
	}
}