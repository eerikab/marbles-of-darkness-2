/// @description Add to path
// You can write your code in this editor

sprite_index = global.sprite_pusher;
//Start path and initialise
path_start(path,0,path_action_stop,true);
length = path_get_length(path);
max_spd = (global.push_boost_const + (length*global.push_boost_path)) * global.hardness;
spd = max_spd;
reverse = 0;
knockback = 0;
shootable = 0;
colour = 0;
combo = 1;

slow = 0;
reverse = 0;
stop = 0;
power_reverse = 0;
shadow = instance_create_depth(x,y,depth,ob_orb_shadow);
shadow.orb = id;
shadow.sprite_index = global.sprite_pusher_shadow;

//Add to list
array_push(global.ls_orbs[pathnr],id);