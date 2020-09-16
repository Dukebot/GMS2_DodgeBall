if (isMouseOnSprite()) {
	if (room == rPlay) {
		global.levelSelected++;
	}
	room_goto(rPlay);
}