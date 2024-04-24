/// @description Insert description here
// You can write your code in this editor

if !instance_exists(ob_orb)
{
	//Fade in
	alpha += 0.02;
	if alpha = 1
	{
		//Fail screen
		if global.gamemode == 1
		{
			//On adventure, remove a life and save
			lives -= 1;
			global.adv_lives-=1;
			global.adv_points = score;
			sc_save();
			if lives < 1
			{
				instance_create_depth(x,y,depth-25,ob_gameover);
			}
			else
			instance_create_depth(global.rm_width/2,global.rm_height/2,depth-25,ob_tryagain);
		}
		else
		instance_create_depth(x,y,depth-25,ob_gameover);
	}
	else
	alarm[0] = 1;
}
alarm[0] = 1;