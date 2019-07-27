if blinking <= 0 {
	if random(1) <= 2*SLOMO_SECONDS {
		blinking += SLOMO_SECONDS;
	}
}
else {
	blinking += SLOMO_SECONDS;
	if blinking >= 1 {
		blinking = 0;
	}
}