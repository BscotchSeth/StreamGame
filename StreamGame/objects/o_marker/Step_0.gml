lifetime -= SECONDS_SINCE_UPDATE;
if lifetime <= 0 {
	instance_destroy();	
}