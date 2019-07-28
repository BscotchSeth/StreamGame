/// @arg xgrid
/// @arg ygrid

var xg = argument0;
var yg = argument1;

buffer_seek(GRID_BUFFER, buffer_seek_start, 0);
buffer_write(GRID_BUFFER, buffer_s16, xg);
buffer_write(GRID_BUFFER, buffer_s16, yg);
buffer_seek(GRID_BUFFER, buffer_seek_start, 0);

return buffer_base64_encode(GRID_BUFFER, 0, 4);