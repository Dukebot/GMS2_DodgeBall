if (mouse_x > x - sprite_width/2 and mouse_x < x + sprite_width/2
		and mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2) {

	audio_stop_sound(sndBackground);
	room_goto(rMenu);
}