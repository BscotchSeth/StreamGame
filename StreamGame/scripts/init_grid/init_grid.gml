globalvar GRID_WIDTH;	GRID_WIDTH	= 184;
globalvar GRID_HEIGHT;	GRID_HEIGHT = 106;
globalvar GRID_RATIO;	GRID_RATIO	= GRID_HEIGHT/GRID_WIDTH;

globalvar GRID_BUFFER; GRID_BUFFER = buffer_create(4, buffer_fixed, 1);

/*

COORDS
	Two S16 bit integers (grid coordinates) -> Write them into the buffer
	Base64 encode the buffer
	Base64 decode the buffer

Two S16 bit integers (grid coordinates) -> Write them into the buffer
Read them back out as a 32-bit integer

/*
BINARY.
0 1 0 0 0 1 0 0