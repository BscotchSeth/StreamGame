/*
particle_systems				= ds_list_create(); // A list of all known particle systems.
particle_system_types			= ds_map_create(); // Particle types that are mapped to particle systems, so when their parent system is destroyed, the types are destroyed.
particle_system_destroy_timers	= ds_map_create(); // Timers for cleaning up particle systems *later*.
particle_system_instances		= ds_map_create(); // Attach particle systems to instances, so those systems can be cleaned up if the instances stop existing.
*/

for ( var i = 0; i < ds_list_size(particle_systems); i++){
	var this_ps = particle_systems[|i];
	var should_destroy_ps = false;
	
	if ds_map_exists(particle_system_instances, this_ps) {
		var this_instance = particle_system_instances[?this_ps];
		if !instance_exists(this_instance) {
			should_destroy_ps = true;
		}
	}
	
	if ds_map_exists(particle_system_destroy_timers, this_ps) {
		should_destroy_ps = false;
		particle_system_destroy_timers[?this_ps] -= SECONDS_SINCE_UPDATE;
		if particle_system_destroy_timers[?this_ps] <= 0 {
			should_destroy_ps = true;	
		}
	}
	
	if should_destroy_ps {
		ptm_cleanup_ps(this_ps);
	}
}