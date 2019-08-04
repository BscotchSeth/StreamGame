/// @arg width

width = argument0;

mask_index		= sp_mask_circular;
image_xscale	= width/sprite_get_width(sp_mask_circular);
image_yscale	= image_xscale*GRID_RATIO;