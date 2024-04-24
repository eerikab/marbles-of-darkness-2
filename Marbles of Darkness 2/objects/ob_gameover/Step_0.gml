/// @description Insert description here
// You can write your code in this editor

if !active
exit

if image_alpha < 1
{
	//Fade in box
	image_alpha += 0.02;
	with(ob_button_next)
	{
		image_alpha = other.image_alpha;
	}
}
else
{
	//Fade in stats
	if score_count < 1
	{
		score_count += 0.02;
		display_score = round(level_score * score_count);
	}
	else if stat_alpha < 2.25
	stat_alpha += 0.02;
}