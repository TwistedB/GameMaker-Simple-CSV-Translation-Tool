//Read languages.txt to see what languages are available
var file = file_text_open_read("lang/languages.txt");

global.languages = [];

while (!file_text_eof(file))
{
    var line = file_text_read_string(file);
    file_text_readln(file); // move to next line
    
    array_push(global.languages, line);
}

file_text_close(file);

//Set the first line in the array as default language
global.languageNumber = 0;
global.locale = global.languages[global.languageNumber];
InitTranslations();

function InitTranslations()
{
	//setting language to languageNumber
	global.locale = global.languages[global.languageNumber];
	
	//Grabbing CSV file for selected language (file must be named the same as it is called in global.languages)
	//text is stored in the lang included file
	global.locData = load_csv("lang/" + global.locale + ".csv");
	
	var hh = ds_grid_height(global.locData);
	var translations = ds_map_create();
	
	for (var i = 0; i < hh; i++)
	{
		ds_map_add(translations, global.locData[# 0, i], i)
	}
	
	global.translations = translations;
}

function Text(key)
{
	var text = "";
	
	if(global.translations[? key] != undefined)
	{
		//Get language file and load the 2 column and see if key matches
		text = global.locData[# 1, global.translations[? key]]
		var a = argument_count > 1 ? argument[1] : "";
		text = string_replace_all(text, "{a}", a);
	}else
	{
		// if it doesnt return text
		text = key;
	}
	
	//Load the text that is related to the key and return as a string
	return text;
}