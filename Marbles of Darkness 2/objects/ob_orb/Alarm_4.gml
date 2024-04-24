/// @description Clear orb
// You can write your code in this editor

score += 100;
global.level_progress += 1;
effect_create_above(ef_explosion,x,y,0, make_colour_rgb(0,255,0));
instance_destroy();