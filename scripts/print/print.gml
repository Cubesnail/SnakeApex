// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(){
/// print(variables or strings)

var output_string = "";

for (var i = 0; i < argument_count; i++) {
    output_string += string(argument[i]) + " ";
}

show_debug_message(output_string);
}