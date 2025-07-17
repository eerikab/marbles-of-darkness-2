// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_get_index(array,value){
	for (var _index = 0; _index < array_length(array); _index += 1)
	{
		if (array[_index] == value)
		return _index;
	}
	
	return -1;
}