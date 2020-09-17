duration = 120;
size = 16;
spdx = random_range(4,16)*sign(random_range(-1,1));
spdy = random_range(4,16)*sign(random_range(-1,1));

audio_sound_pitch(sndPlasmaShoot, random_range(0.8, 1.2));
audio_play_sound(sndPlasmaShoot, 0, false);

/*
// set up motion

//Shoot in a random direction
direction = point_direction(x, y, random(room_width), random(room_height));

speed = 8;
image_angle = direction;
*/