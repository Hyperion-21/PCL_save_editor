function reload_save(){
	savefile = ds_map_secure_load(filepath);
	keyarray = ds_map_keys_to_array(savefile);
	valuearray = ds_map_values_to_array(savefile);
	grid = ds_grid_create(2, array_length(keyarray));
	
	for (var i = 0; i < array_length(keyarray); i++;) {
		ds_grid_add(grid, 0, i, keyarray[i]);
		ds_grid_add(grid, 1, i, valuearray[i]);
	}

	ds_grid_sort(grid, 0, true);
}