/// @arg particle_system

var the_particle_system = argument0;

with o_particle_manager {
	ds_list_delete_element(particle_systems, the_particle_system);
	
	if ds_map_exists(particle_system_types, the_particle_system) {
		var these_types = particle_system_types[?the_particle_system];
		for ( var i = 0; i < ds_list_size(these_types); i++){
			var type_to_destroy = these_types[|i];
			part_type_destroy(type_to_destroy);
		}
		ds_list_destroy(these_types);
		ds_map_delete(particle_system_types, the_particle_system);
	}
	
	ds_map_delete(particle_system_destroy_timers,	the_particle_system);
	ds_map_delete(particle_system_instances,		the_particle_system);
}