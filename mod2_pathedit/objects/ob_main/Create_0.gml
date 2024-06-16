/// @description Insert description here
// You can write your code in this editor

//Set variables
gap = 16;
gap_text = 16;
hud_width = 192;

selected = -1;
dragging = -1;

title = "MoD2 Path Editor v0.1";
filepath = "unnamed"
filename = "unnamed"
window_set_caption(filename + " - " + title);

hud_left = window_get_width()-hud_width;
hud_right = window_get_width();
background = 0;
mouse_last_x = mouse_x;
mouse_last_y = mouse_y;
preview = 0;
debug = 0;
zoom = 1;
grid_select = 0;
bg_view = 1;

openfile = 0;
newfile = 0;
pastefile = 0;
import = 0;
question = 0;
changed = 0;

path_points = -1;

//Init path
path = path_add();
path_set_closed(path,0);
path_set_kind(path,1);
path_set_precision(path,8);

//Init font
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Buttons
btn_count = 15;
btn_size = 28;
btn_offset = 14;
i = 1;
pos = btn_size*2;
repeat(btn_count)
{
	btn_pos[i] = pos;
	btn_up[i] = pos-btn_size/2;
	btn_down[i] = pos+btn_size/2;
	btn_req[i] = -1;
	if i > 4 and i < 8
	btn_req[i] = 0;
	if i = 6
	btn_req[i] = 1;
	if i = 8
	btn_req[i] = -1;
	
	pos += btn_size;
	if i = 4 or i = 7 or i = 11
	pos += btn_size;
	
	i += 1;
}
btn_text[1] = "New path"
btn_text[2] = "Load path"
btn_text[3] = "Save path"
btn_text[4] = "Background"
btn_text[5] = "Delete"
btn_text[6] = "Insert"
btn_text[7] = "Depth"
btn_text[8] = "Grid"
btn_text[9] = "Reverse"
btn_text[10] = "Flip horizontal"
btn_text[11] = "Flip vertical"
btn_text[12] = "BG view"
btn_text[13] = "Preview"
btn_text[14] = "Reset view"
btn_text[15] = "Statistics"