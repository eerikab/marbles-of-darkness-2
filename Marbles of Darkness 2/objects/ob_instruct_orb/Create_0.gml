/// @description Insert description here
// You can write your code in this editor

if array_length(global.sprite_orb) == 0
instance_destroy();

colour = 1;
sprite_index = global.sprite_orb[1];
if x < 512
image_angle = 90;
else
{
	image_speed = 0;
	image_index = round(x*0.3) mod image_number;
}
x = global.rm_width/2-(512-x);
y = global.rm_height/2-(288-y);
alarm[0] = 1;

shadow = instance_create_depth(x,y,depth,ob_orb_shadow);
shadow.orb = id;