// revive player
if instance_number(oPlayer) == 0 {
	instance_create_layer(room_width/2, room_height/2, "Instances", oPlayer);
}
oGame.playerLives = 3;
	
// Destroy all enemies
explosion();
		
global.rewarded = true;
global.pause = false;