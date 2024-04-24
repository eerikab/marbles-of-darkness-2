/// @description Variables
// You can write your code in this editor

sprite_index = global.sprite_powerup;
/*Blue - Lightning, Reverse
Red - Stop, Fireball
Yellow - Wild ball, Accuracy
Green - Slow, Colour Cloud
Purple - Anti-orbs, Precise Shot
Black - Darts, 
White - Colour Bomb, Whitener
Orange - Inferno, Poison
Cyan - Group, Blocker*/

image_speed = 0;
image_xscale = 0.5;
image_yscale = 0.5;

//Choose one powerup from the two set to the colour
if colour < 10
image_index = choose(colour*2-1,colour*2);
else
image_index = choose(1,2);

//Start moving, primarily towards the bottom, but don't go off-screen
x = clamp(x,16,room_width-16);
y = clamp(y,16,room_height-16);

direction += 90;
if direction mod 360 < 180
direction += 180;

if x < 48 and y > room_height-48
direction = 45;
else if x > room_width-48 and y > room_height-48
direction = 135;
else if x > room_width-48 and y < -48
direction = 225;
else if x < 48 and y < 48
direction = 315;
else if x < 48
direction = 0;
else if y < 48
direction = 270;
else if x > room_width - 48
direction = 180;
else if y > room_height - 48
direction = 90;

move = 32;
cooldown = global.cool_power*60;