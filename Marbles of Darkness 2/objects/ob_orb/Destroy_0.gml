/// @description Remove from path
// You can write your code in this editor

index = array_get_index(global.ls_orbs[pathnr],id);
array_delete(global.ls_orbs[pathnr],index,1);
if pos < 1
{
	effect_create_below( ef_spark,x,y,1, global.color[colour]);
	global.stat_clear += 1;
}