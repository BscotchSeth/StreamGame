/// @arg particle_system
/// @arg [time_to_set=0]

var the_particle_system = argument[0];
var time_to_set = 0; if argument_count > 1 { time_to_set = argument[1]; }

with o_particle_manager {
	if time_to_set > 0 {
		ds_map_replace(particle_system_destroy_timers, the_particle_system, time_to_set);
	}
	else {
		ptm_cleanup_ps(the_particle_system);
	}
}