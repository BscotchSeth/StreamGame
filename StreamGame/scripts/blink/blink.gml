if blinking <= 0 {
	if random(1) <= 2/room_speed {
		blinking += 1/room_speed;
	}
}
else {
	blinking += 1/room_speed;
	if blinking >= 1 {
		blinking = 0;
	}
}