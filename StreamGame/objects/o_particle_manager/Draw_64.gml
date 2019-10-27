var yp = gui_height()-5;

font_set(fnt_reg, fa_left, fa_bottom);

for ( var i = 0; i < ds_list_size(particle_systems); i++){
	
	var this_ps = particle_systems[|i];
	var string_to_draw = string(this_ps);
	
	if ds_map_exists(particle_system_destroy_timers, this_ps) {
		string_to_draw += ": " + string(particle_system_destroy_timers[?this_ps])
	}
	
	drawtext(10, yp, string_to_draw, 1, c_white);
	yp -= 40;
}

/*
particle_systems				= ds_list_create(); // A list of all known particle systems.
particle_system_types			= ds_map_create(); // Particle types that are mapped to particle systems, so when their parent system is destroyed, the types are destroyed.
particle_system_destroy_timers	= ds_map_create(); // Timers for cleaning up particle systems *later*.
particle_system_instances		= ds_map_create(); // Attach particle systems to instances, so those systems can be cleaned up if the instances stop existing.