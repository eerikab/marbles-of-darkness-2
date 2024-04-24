/// @description Insert description here
// You can write your code in this editor

if global.instruct_pad
{
sprite_index = global.sprite_pad;
image_angle = 90;
}
else
sprite_index = global.sprite_shooter;
image_speed = 0;
image_index = 1;
alarm[0] = 120;
x = global.rm_width/2-(512-x);
y = global.rm_height/2-(288-y);