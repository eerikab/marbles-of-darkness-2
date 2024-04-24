/// @description Insert description here
// You can write your code in this editor

//Set variables
gap = 16;
gap_text = 16;
hud_width = 192;

selected = -1;
dragging = -1;

filename = "pt_default"

hud_left = window_get_width()-hud_width;
hud_right = window_get_width();
background = 0;
mouse_last_x = mouse_x;
mouse_last_y = mouse_y;
preview = 0;
debug = 0;
zoom = 1;
grid_select = 0;

//Init path
path = path_add();
path_set_closed(path,0);
path_set_kind(path,1);
path_set_precision(path,8);

//Init font
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);