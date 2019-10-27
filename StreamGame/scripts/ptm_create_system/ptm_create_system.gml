/// @arg [instance_parent]

var instance_parent = noone;
if argument_count > 0 { instance_parent = argument[0]; }

with o_particle_manager {
	var ps = part_system_create();
	ds_list_add(particle_systems, ps);
	if instance_parent != noone {
		ds_map_add(particle_system_instances, ps, instance_parent);
	}
	return ps;
}

show_error("Cannot create a particle system without the particle manager.", true);