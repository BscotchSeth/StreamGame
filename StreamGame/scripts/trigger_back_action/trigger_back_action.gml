switch room {
	case rm_gameplay:
		room_goto(rm_mainmenu);
		break;
	case rm_mainmenu:
		game_end();
		break;
}