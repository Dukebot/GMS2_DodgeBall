if (global.inventoryMode) {
	other.bombs++;
	instance_destroy();
	exit;
}

var totalEnemies = 0;
totalEnemies += instance_number(oEnemy1);
totalEnemies += instance_number(oEnemy2);
totalEnemies += instance_number(oEnemy3);
totalEnemies += instance_number(oEnemy4);
	
explosion();
	
if (totalEnemies > 10) {
	//if achievement_available() achievement_post("CgkIuJj_1NgFEAIQAg", 100);
}

instance_destroy();