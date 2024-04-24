/// @description Insert description here
// You can write your code in this editor

length = path_get_length(global.path[pathnr]);
i = 1;
repeat(round(10*global.path_multi))
{
	instance_create_depth(-32,-32,-50,ob_antiorb,{
		pathnr : pathnr,
		pos : i})
	i += 32/length;
}
instance_destroy();