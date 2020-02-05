var randomItem = random(1);
var pUpSpawnX = random_range(100,room_width-100);
var pUpSpawnY = random_range(100,room_height-100);
	
if (randomItem < 0.2) 
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpBomb);	
else if (randomItem < 0.4) 
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpStar);
else if (randomItem < 0.6)
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpMachineGun);
else if (randomItem < 0.8)
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpPlasma);
else if (randomItem < 0.9)
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpShield);
else
	instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpExtraLife);