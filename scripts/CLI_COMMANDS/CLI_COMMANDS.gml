global.CLI_map_cmd = ds_map_create();
global.CLI_map_cmd[? "validation"] = true;

// DEFINE COMMANDS HERE //

#region EXAMPLES/SAMPLES

/*
	Commands are stored in the global.CLI_map_cmd map structure.
	the id string will be the actual command that you use.
	
	for example:
	
	 to use CLI_HELP:
		1. add a help function to the global.CLI_map_cmd map with the id of "CLI_HELP"
		2. type CLI_HELP in the in-game console
*/

//example 1: commands without arguments
global.CLI_map_cmd[? "CLI_HELP"] = CLI_cmd_help;

function CLI_cmd_help(){
	//return help message string
	return "Add commands in the \"CLI_COMMANDS\" Script asset.\nExamples are also available."
			+"\nYou can also read CLI_howToUse file for better understanding.";
}

//example 2: commands with arguments
//usage: CLI_add var1 var2
global.CLI_map_cmd[? "CLI_ADD"] = CLI_cmd_add;

function CLI_cmd_add(_args){
	/*functions will get arguments as an array
	  you can check the length of the argument array or something to add
	  safety features. This is just a simple example.
	*/
	return real(_args[0]) + real(_args[1]);
}

//example 3: commands to execute GML code
/*
 due to how internal GML scripts work, the following may not work:
 
 global.CLI_map_cmd[? "CLI_QUIT"] = game_end;
 
  instead, it will probably be better to make your own equivelent of the function
 and use that instead.
*/

global.CLI_map_cmd[? "CLI_QUIT"] = CLI_game_end;

function CLI_game_end(){
	//in this case, we can also safely destroy the CLI_map_cmd data structure, so it is definitely better
	// to make our own game_end function.
	ds_map_destroy(global.CLI_map_cmd);
	game_end();
}

//example for in-game appliances

global.CLI_map_cmd[? "CLI_GODMODE"] = CLI_godmode;

function CLI_godmode(){
	return "GODMODE enabled";
}

global.CLI_map_cmd[? "CLI_SETSPEED"] = CLI_setspeed;

function CLI_setspeed(_args){
	return "speed set to " + string(_args[0]);
}

#endregion
