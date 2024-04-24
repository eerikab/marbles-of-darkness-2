/// @description Insert description here
// You can write your code in this editor

//Set colour
sprite_index = global.sprite_orb[1];
colour = ob_shooter.image_index;
ob_shooter.image_index = irandom_range(1,global.dif_col[global.difficulty]);
while ob_shooter.image_index > 10 and ob_shooter.image_index < 20
ob_shooter.image_index = irandom_range(1,global.dif_col[global.difficulty]);

//Initialise
shot = false;
image_angle = 90;
new_ball = 0;
matching = false;
knockback = 0;
reverse = 0;
pos = 0;
orb = 0;
depth = -75;
create_orb = 1;
moving = 0;

x = ob_shooter.x;
y = ob_shooter.y-16;