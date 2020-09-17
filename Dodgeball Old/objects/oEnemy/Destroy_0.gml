if instance_number(oGame) > 0 {
	oGame.playerEnemiesKilled++;
	instance_create_layer(x,y,"Interface", o100points);
}