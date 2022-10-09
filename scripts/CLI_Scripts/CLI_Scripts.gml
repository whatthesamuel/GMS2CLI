function CLI_explode(_del, _str){
	//original explode function is licenced under GMLscripts.com/license as free to use
	//I modified the names a bit to avoid possible conflicts of existing functions/variables
    var _arr;
    _str += _del;
    var _len = string_length(_del);
    var _ind = 0;
    repeat (string_count(_del, _str)) {
        var _pos = string_pos(_del, _str) - 1;
        _arr[_ind] = string_copy(_str, 1, _pos);
        _str = string_delete(_str, 1, _pos + _len);
        _ind++;
    }
    return _arr;
}

function CLI_command_execute(_cmd, _args) {
	var _out;
	if(ds_map_exists(global.CLI_map_cmd, _cmd)){
		try{
			_out = script_execute(global.CLI_map_cmd[? _cmd], _args);
			return _out;
		} catch(e) {
			show_debug_message(e.message);
		}
	} else {
		if(!ds_map_exists(global.CLI_map_cmd, "validation")) show_debug_message("ds_map not found");
		else {
			show_debug_message("unrecognized command: \"" + _cmd + "\"");
		}
	}
	
}
