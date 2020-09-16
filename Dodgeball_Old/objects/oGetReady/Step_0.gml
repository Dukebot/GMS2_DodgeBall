if (mouse_check_button_pressed(mb_left)) {
	global.pause = false;
	audio_play_sound(sndBackground, 10, true);
	instance_destroy();
}