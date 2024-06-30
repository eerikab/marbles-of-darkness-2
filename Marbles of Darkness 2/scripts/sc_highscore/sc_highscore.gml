// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sc_highscore(_score){
	//Overwrite Adventure data
	ini_open(global.savefile + "save.ini");
	ini_section_delete("Adventure");
	ini_write_real("Adventure","placeholder",0);
	
	//If highscore reached, insert it
	i = 1;
	while(i <= 5)
	{
		if _score > global.highscore[i]
		{
			j = 5;
			while(j > i and j > 1)
			{
				global.highscore[j] = global.highscore[j-1];
				j -= 1;
			}
			global.highscore[i] = _score;
			break;
		}
		i += 1;
	}
	
	//Save changes
	ini_write_real("Highscore","1",global.highscore[1]);
	ini_write_real("Highscore","2",global.highscore[2]);
	ini_write_real("Highscore","3",global.highscore[3]);
	ini_write_real("Highscore","4",global.highscore[4]);
	ini_write_real("Highscore","5",global.highscore[5]);
	ini_close();
}