/// @arg coord

var coord = argument0;

buffer_base64_decode_ext(GRID_BUFFER, coord, 0);
buffer_seek(GRID_BUFFER, buffer_seek_start, 0);

var xg_location = real(buffer_read(GRID_BUFFER, buffer_s16));
var yg_location = real(buffer_read(GRID_BUFFER, buffer_s16));

var xy = [ xg_location, yg_location ];

return xy;