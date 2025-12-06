/// @description Match parent orb
// You can write your code in this editor

// Follow orb, otherwise remove
if !instance_exists(orb)
{
	instance_destroy();
	exit;
}


switch(global.orb_shadow[orb.colour])
{
	case 0:
		visible = false;
		break;
	case 1:
		visible = true;
		sprite_index = global.sprite_orb_shadow;
		break;
	default:
		visible = true;
		sprite_index = global.orb_shadow[orb.colour];
		break;
}

x = orb.x + 4;
y = orb.y + 4;
depth = orb.depth+1;
visible = orb.visible * visible;
image_angle = orb.image_angle;