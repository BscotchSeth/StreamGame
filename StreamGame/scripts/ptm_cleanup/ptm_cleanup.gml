for (var i = 0; i < ds_list_size(my_particle_systems); i++){
	part_system_destroy(my_particle_systems[|i]);	
}

for (var i = 0; i < ds_list_size(my_particle_types); i++){
	part_type_destroy(my_particle_types[|i]);	
}