// set up motion
audio_sound_pitch(sndShoot, random_range(0.8, 1.2));
audio_play_sound(sndShoot, 0, false);
direction = point_direction(x, y, random(room_width), random(room_height));
//direction = direction + random_range(-4,4);
speed = 16;
image_angle = direction-90;