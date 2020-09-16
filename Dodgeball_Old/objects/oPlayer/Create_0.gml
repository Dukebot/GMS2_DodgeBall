star = false;
shield = false;
alphaInc = 0.25;

mouseXBefore = 0;
mouseYBefore = 0;

hit = false;
hitDuration = 20;
hitCount = 0;

speedBase = 32;

direction = 0;
speed = speedBase;

if (global.inventoryMode) {
	machineGun = 30;
	machineGunCooldown = 6;
	machineGunCount = 0;
	
	plasmaGun = 30;
	plasmaGunCooldown = 30;
	plasmaGunCount = 0;
	
	bombs = 3;
}