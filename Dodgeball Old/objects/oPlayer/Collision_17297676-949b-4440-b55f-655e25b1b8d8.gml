
//With star we are invincible and destroy the enemy
if (star) {
//With shield we create a big explosion and lose the shield
} else if (shield) {
	shield = false;
	explosion();
//With no protection we take damage
} else {	
	audio_play_sound(sndPlayerHit, 0, false);
	oGame.playerLives--; 
	hit = true;
	hitCount = hitDuration;
	if (oGame.playerLives <= 0) instance_destroy(); 
}

//Destroy the enemy collided
with (other) instance_destroy();