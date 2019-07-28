randomize();

#macro rgb make_colour_rgb

#macro c_softblue make_colour_rgb(32,105,255)
#macro c_softyellow make_colour_rgb(255,200,0)
#macro c_softred make_colour_rgb(255,64,0)
#macro c_softgreen make_colour_rgb(167,255,0)

init_time();
init_grid();
init_stage_generation();

globalvar GRAVITY;			GRAVITY = 4000;
globalvar BACKGROUND_DEPTH;	BACKGROUND_DEPTH = 60000;
globalvar TERRAIN_DEPTH;	TERRAIN_DEPTH	 = 50000;
globalvar SHADOW_DEPTH;		SHADOW_DEPTH	 = 40000;

room_goto(rm_mainmenu);