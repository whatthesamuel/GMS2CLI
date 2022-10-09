if(keyboard_check_pressed(vk_enter)){
	drawText += "\n>:" + keyboard_string + "\n>:";
	var _arr = CLI_explode(" ", keyboard_string);
	if(array_length(_arr) < 2){
		/*
		 the second argument _arr is not necessary since this is a command with no arguments
		 but to keep the IDE from complaining, you can give it anything in its place.		
		*/
		drawText += string(CLI_command_execute(_arr[0], undefined));
	} else {
		var _args = array_create(array_length(_arr) - 1);
		array_copy(_args, 0, _arr, 1, array_length(_arr) - 1);
		drawText += string(CLI_command_execute(_arr[0], _args));
	}
	keyboard_string = "";
}
