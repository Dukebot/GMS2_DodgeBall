if (!global.pause) {
	if (duration < 0) instance_destroy();
	duration--;	
	// bouncing screen movement
	if (x + size > room_width) or (x - size < 0) {
		spdx = -spdx;
		audio_sound_pitch(sndBounce, random_range(0.9, 1.1));
		audio_play_sound(sndBounce, 0, false);
	}
	if (y + size > room_height) or (y - size < 50) {
		spdy = -spdy;
		audio_sound_pitch(sndBounce, random_range(0.9, 1.1));
		audio_play_sound(sndBounce, 0, false);
	}
	x = x + spdx;
	y = y + spdy;
}

