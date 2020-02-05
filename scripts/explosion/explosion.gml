// explosion
audio_play_sound(sndExplosion, 0, false);
instance_create_layer(0, 0, "instances", oFlashEffect);
instance_destroy(oEnemy);
screenShake(1, 0.5);