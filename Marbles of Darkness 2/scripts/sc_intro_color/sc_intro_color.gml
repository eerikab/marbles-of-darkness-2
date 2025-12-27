// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_intro_color(col){
	///Fade everything in from black during level intro
	sc_background_colour(col);
	ob_shooter.image_blend = col;
	if instance_exists(ob_tunnel)
	ob_tunnel.image_blend = col;
	if instance_exists(ob_pad2)
	ob_pad2.image_blend = col;
}