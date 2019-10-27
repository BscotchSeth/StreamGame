particle_systems				= ds_list_create(); // A list of all known particle systems.
particle_system_types			= ds_map_create(); // Particle types that are mapped to particle systems, so when their parent system is destroyed, the types are destroyed.
particle_system_destroy_timers	= ds_map_create(); // Timers for cleaning up particle systems *later*.
particle_system_instances		= ds_map_create(); // Attach particle systems to instances, so those systems can be cleaned up if the instances stop existing.