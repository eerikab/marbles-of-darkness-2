// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_pause(){
	//Deactivate level objects
	instance_deactivate_object(ob_shooter);
	instance_deactivate_object(ob_orb);
	instance_deactivate_object(ob_orbshot);
	instance_deactivate_object(ob_pusher);
	instance_deactivate_object(ob_control);
	instance_deactivate_object(ob_spawner);
	instance_deactivate_object(ob_antiorb);
	instance_deactivate_object(ob_powerup);
	instance_deactivate_object(ob_inferno);
	instance_deactivate_object(ob_blocker);
	instance_deactivate_object(ob_orb_shadow);
	instance_deactivate_object(ob_final_bonus);
}