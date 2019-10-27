/// @arg system_parent

var system_parent = argument0;

with o_particle_manager {
	var pt = part_type_create();
	if !ds_map_exists(particle_system_types, system_parent) {
		ds_map_add_list(particle_system_types, system_parent, ds_list_create());	
	}
	
	var this_system_list = particle_system_types[?system_parent];
	ds_list_add(this_system_list, pt);
	
	return pt;
}

show_error("Cannot create a particle type without the particle manager.", true);