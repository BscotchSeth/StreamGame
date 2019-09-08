for ( var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++){
	var this_coord = TERRAIN_LOCATIONS[|i];
	
	//if TERRAIN_TYPES[?this_coord] == terrain_type.interior {
		var this_xy = coord_to_grid(this_coord);
		var is_edge = false;
	
		for ( var xg = this_xy[0]-1; xg <= this_xy[0]+1 && !is_edge; xg++){
			for ( var yg = this_xy[1]-1; yg <= this_xy[1]+1 && !is_edge; yg++){
				var coord_to_check = grid_to_coord(xg,yg);
				if !ds_map_exists(TERRAIN_TYPES, coord_to_check) {
					is_edge = true;
					TERRAIN_TYPES[?this_coord] = terrain_type.edge;
				}
			}
		}
		
		if !is_edge {
			TERRAIN_TYPES[?this_coord] = terrain_type.interior;
		}
	//}
}