//The Text() function searches for the key and reprints the string associated with it
draw_text(x, y, Text("textA"))
draw_text(x, y+30, Text("textB"))
draw_text(x, y+60, Text("textC"))

//Switch To Next Language
if(keyboard_check_pressed(vk_space))
{
	if(global.languageNumber+1 < array_length(global.languages))
	{
		global.languageNumber ++;
		InitTranslations()
	}else
	{
		global.languageNumber = 0;
		InitTranslations()
	}
}