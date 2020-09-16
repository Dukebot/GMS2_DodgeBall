show_debug_message("Creating oGame.");
show_debug_message("Game mode is = " + string(global.gameMode));

if (instance_number(oGame) > 1) show_error("More than 1 oGame has been instanciated.", 1);
	
audio_stop_sound(sndBackground);

gameWin = false;
gameLost = false;

time = 0;

level = 1;
levelUpFrec = 10*60;

//gameOverTime = 5*60;
//gameOverCount = gameOverTime;

playerLives = 3;
playerEnemiesKilled = 0;
playerScore = 0;

enemySpeed = 4;
enemySpeedInc = 0.1;
enemyScore = 100;
enemySpawnRate = 1.5*60;
enemySpawnRateInc = 0.95;
enemySpawnCooldown = enemySpawnRate;

pUpSpawn = true;
pUpSpawnRate = 10*60;
pUpSpawnRateInc = 1;
pUpSpawnCooldown = pUpSpawnRate;

global.rewarded = true;
global.gamesPlayed++;

if (global.gameMode == GameMode.time) {
	level = global.levelSelected;
	timeLimit = 60*60;
	pUpSpawn = true;
	
	for (var i = 0; i < level; i++) {
		enemySpeed += enemySpeedInc;
		enemySpawnRate *= enemySpawnRateInc;
	}
	spawnRandomEnemy();
}

if os_type == os_android {	
	internet = admob_has_internet_connection();
	alarm[0] = 5;
}