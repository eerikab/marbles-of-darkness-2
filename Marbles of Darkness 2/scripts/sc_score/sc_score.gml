// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_score(_points,_x,_y,_col,_chain,_combo){
	//Create score text
	_points = round(_points);
	score += _points;
	object = instance_create_depth(_x,_y-32,0,ob_scoring);
	object.point_get = _points;
	object.blend = _col;
	if _chain == 1 and global.chain >= 3
	object.chain = global.chain;
	object.combo = _combo;
	
	//Statistics
	if global.chain > global.chain_high
	global.chain_high = global.chain;
	
	if global.chain > global.stat_chain
	global.stat_chain = global.chain;
	
	if _combo > global.combo_high
	global.combo_high = _combo;
	
	if _combo > global.stat_combo
	global.stat_combo = _combo;
}