var spawn_chances = 0;
spawn_chances[terrain_type.interior]	= .05;
spawn_chances[terrain_type.edge]		= .3;
spawn_chances[terrain_type.bridge]		= 0;

for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_terrain_coords = TERRAIN_LOCATIONS[|i];
	var this_terrain_type = TERRAIN_TYPES[?this_terrain_coords];
	var this_spawn_chance = spawn_chances[this_terrain_type];
	
	if random(1) <= this_spawn_chance {
		var this_world_pos	= coord_to_world(this_terrain_coords);
		instance_create(o_tongueflower, this_world_pos[0], this_world_pos[1]);
	}
}