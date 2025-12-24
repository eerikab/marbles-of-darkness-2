/// @description Insert description here
// You can write your code in this editor

if ob_instructions.page == 1
visible = 1;
else
visible = 0;

alpha1 += dir*spd;
if alpha1 = 1 or alpha1 = 0
dir *= -1;

angle += 0.2;