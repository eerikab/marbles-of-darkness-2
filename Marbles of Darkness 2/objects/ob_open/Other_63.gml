/// @description Respond to dialogue boxes
// You can write your code in this editor

var i_d = ds_map_find_value(async_load, "id");
if i_d == error
game_end(); // Close game in case of an error
else if i_d == delayed
sc_load_advance();