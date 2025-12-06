/// @description Add on path
// You can write your code in this editor

//Start path and initialise
sprite_index = global.sprite_orb[1];
path_start(path,0,path_action_stop,true);
length = path_get_length(path);
image_speed = 0;
matched = false;
reverse = 0;
knockback = 0;
shootable = 1;
depth = 50;
hidden = 1;
alarm[1] = 3;
combo = 1;
shadow = instance_create_depth(x,y,depth,ob_orb_shadow);
shadow.orb = id;
poison = 0;
poison_dir = 0;

//If it's a new orb
if index = -1
{
	//Set colour
	colour = irandom_range(1,global.dif_col[global.difficulty]);
	while colour > 10 and colour < 20
	colour = irandom_range(1,global.dif_col[global.difficulty]);

	//Add to list
	if array_length(global.ls_orbs[pathnr]) > 1 and irandom(2) == 0
	colour = global.ls_orbs[pathnr, array_length(global.ls_orbs[pathnr])-1].colour;
	
	if colour < 1
	colour = 1;
	
	array_push(global.ls_orbs[pathnr],id);
}
else
//If added by an orb
{
	if colour < 1
	colour = 1;
	
	array_insert(global.ls_orbs[pathnr],index,id);
	match_knockback = 0;
	alarm[2] = 3;
}