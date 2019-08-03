/// @arg main_sprite
/// @arg [sprite_to_copy_to]
/// @arg [...]

var main_sprite = argument[0];

var main_xoffset = sprite_get_xoffset(main_sprite);
var main_yoffset = sprite_get_yoffset(main_sprite);

for ( var i = 1; i < argument_count; i++){
	var sprite_to_copy_to = argument[i];
	sprite_set_offset(sprite_to_copy_to, main_xoffset, main_yoffset)
}