if (visible) {
	audio_play_sound(sndPUpPickup, 0, false);
	visible = false;
}

if (global.inventoryMode) {
	other.machineGun += machineGunAmount;
	instance_destroy();
}
