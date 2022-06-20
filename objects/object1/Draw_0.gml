draw_set_color(#000000);

if editmode == false { keyboard_string_remember = keyboard_string; }

for (var i = 0; i < array_length(keyarray); i++;) {
	var linespercolumn = 80;
	if string_copy(string_delete(ds_grid_get(grid, 0, i), string_length(keyboard_string_remember)+1, 999), 0, 999) == keyboard_string_remember {
		var printtext = string(ds_grid_get(grid, 0, i)) + " : " + string(ds_grid_get(grid, 1, i));
		draw_text(floor(successes / linespercolumn) * 350, ((successes mod linespercolumn) * 15) + 100, printtext);
		entrykey = ds_grid_get(grid, 0, i);
		successes++;
	}
}

draw_text(0, 0, keyboard_string_remember);

if editmode == true and keyboard_check_pressed(vk_enter) {
	ds_map_replace(savefile, entrykey, keyboard_string);
	ds_map_secure_save(savefile, filepath);
	editmode = false;
	keyboard_string = "";
	keyboard_string_remember = entrykey;
	reload_save();
}

if editmode == true and keyboard_check_pressed(vk_tab) {
	editmode = false;
	keyboard_string = "";
	keyboard_string_remember = "";
}

if successes == 1 {
	if editmode == false { draw_text(0, 40, "Hit! Press Enter to edit " + string(entrykey)); }
	if keyboard_check_pressed(vk_enter) {
		editmode = true;
		keyboard_string = "";
	}
	if editmode == true {
		draw_text(0, 15, keyboard_string);
		draw_text(0, 40, "Editing... Press Tab to exit. Press Enter to save the inputted value.");
	}
} else { 
	editmode = false;
	draw_text(0, 40, "Type the key you wish to edit.");
}

successes = 0;