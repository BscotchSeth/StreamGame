// Inherit the parent event
event_inherited();

var specialness_chance = 0.1;
special = (random(1) <= specialness_chance);

image_index = special;

scalemod	= random_range(.6,1);
width		= 120*scalemod;
height		= 70*scalemod;
xscale		= choose(-1,1);

anim_timer = random(10);

set_mask(width);