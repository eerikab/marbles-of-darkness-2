global.paths = global.level_paths[global.selected];
global.path[1] = global.level_path[global.selected,1];
instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : 1});
if global.paths > 1
{
	global.path[2] = global.level_path[global.selected,2];
	instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : 2});
}
if global.paths > 2
{
	global.path[3] = global.level_path[global.selected,3];
	instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : 3});
}
if global.paths > 3
{
	global.path[4] = global.level_path[global.selected,4];
	instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : 4});
}
if global.paths > 4
{
	global.path[5] = global.level_path[global.selected,5];
	instance_create_layer(640,360,"Instances",ob_spawner, {pathnr : 5});
}

sc_window();
sc_background(global.background[global.selected]);

if global.tunnel[global.selected] == 0
instance_destroy(ob_tunnel);
else
{
	ob_tunnel.sprite_index = global.tunnel[global.selected];
}

global.onehole = global.level_onehole[global.selected];

//instance_create_layer(640,360,"Instances",ob_fill_spawn)