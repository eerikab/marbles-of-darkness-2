/// @description Remove from lists
// You can write your code in this editor

index = array_get_index(global.ls_orbs[pathnr],id);
array_delete(global.ls_orbs[pathnr],index,1)

global.end_bonus[pathnr] = pos;

if global.game
{
	effect_create_below( ef_spark,x,y,1, c_white);
	audio_play_sound(global.sou_pusher_break,0,0);
}