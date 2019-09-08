/// @desc Set up item information after spawn.
switch destination {
	case location.space:
		part_type_color1(line_pt, rgb(255,255,50));
		image_offset = 2;
		break;
	case location.cave:
		part_type_color1(line_pt, rgb(50,255,50));
		image_offset = 4;
		break;
	case location.underwater:
		part_type_color1(line_pt, rgb(50,50,255));
		image_offset = 0;
		break;
}