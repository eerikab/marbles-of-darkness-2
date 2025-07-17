// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_error(msg){
	if error_raised
	exit;
	
	error = show_message_async(txt_error + "\n\n" + area + "\n" + msg);
	error_raised = true;
}