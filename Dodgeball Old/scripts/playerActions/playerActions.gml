//Shoot machine gun
machineGunCount--;
if (machineGunCount < 0) {
	if (mouse_check_button(mb_left)) {
		if (machineGun > 0) {
			machineGun--;
			machineGunCount = machineGunCooldown;
				
			var shoot = instanceCreate(oShootBullet, x, y);
			shoot.direction = point_direction(x, y, mouse_x, mouse_y);
		}
	}
}

//Shoot plasma gun
plasmaGunCount--;
if (plasmaGunCount < 0) {
	if (mouse_check_button(mb_right)) {
		if (plasmaGun > 0) {
			plasmaGun--;
			plasmaGunCount = plasmaGunCooldown;
				
			var shoot = instanceCreate(oShootPlasma, x, y);
			shoot.direction = point_direction(x, y, mouse_x, mouse_y);
		}
	}
}

//Activate Bomb
if (keyboard_check_pressed(vk_space)) {
	if (bombs > 0) {
		bombs--;
		explosion();
	}
}