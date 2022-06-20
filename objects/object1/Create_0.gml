#macro filepath "data_pcl+.sav"

window_set_fullscreen(true);

if !file_exists(filepath) { draw_text(0, 0, "error"); return; }

reload_save();

editmode = false;
successes = 0;