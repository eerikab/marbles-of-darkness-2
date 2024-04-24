/// @description Insert description here
// You can write your code in this editor

life_bonus = global.adv_lives*global.lifebonus;
total = global.adv_points + life_bonus;
txt = global.txt_end;
txt += "\n\n\n\n"+global.txt_end_score + string(global.adv_points);
txt += "\n\n"+global.txt_end_bonus + string(life_bonus);
txt += "\n\n"+global.txt_end_total + string(total);

sc_highscore(total);