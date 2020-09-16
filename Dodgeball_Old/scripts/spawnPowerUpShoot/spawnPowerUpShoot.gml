var pUpSpawnX = random_range(100,room_width-100);
var pUpSpawnY = random_range(100,room_height-100);
instance_create_layer(pUpSpawnX, pUpSpawnY, "PowerUpLayer", oPowerUpMachineGun);