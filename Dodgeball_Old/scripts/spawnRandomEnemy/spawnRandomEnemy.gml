//Choose Enemy to spawn randomly
var randomEnemy = random(1);
var enemy = 0;
var enemySpawnMargin = 0;

if (randomEnemy < 0.5) {
	enemy = oEnemy1;
	enemySpawnMargin = sprite_get_width(sEnemy1)/2;
} 
else if (randomEnemy < 0.7) {
	enemy = oEnemy2;
	enemySpawnMargin = sprite_get_width(sEnemy2)/2;
} 
else if (randomEnemy < 0.9) {
	enemy = oEnemy3;
	enemySpawnMargin = sprite_get_width(sEnemy3)/2;
} 
else {
	enemy = oEnemy4;
	enemySpawnMargin = sprite_get_width(sEnemy4)/2;
}


//Choose spawn position
var randomCorner = random(1);
var enemySpawnX;
var enemySpawnY;
	
// calculate spawn point based on random corner spawn reference
if (randomCorner < 0.25) {
	// spawn from left
	enemySpawnX = enemySpawnMargin;
	enemySpawnY = random_range(enemySpawnMargin, room_height-enemySpawnMargin);
} 
else if (randomCorner < 0.5) { 
	// spawn from top
	enemySpawnX = random_range(enemySpawnMargin, room_width-enemySpawnMargin);
	enemySpawnY = enemySpawnMargin;
} 
else if (randomCorner < 0.75) { 
	// spawn from right
	enemySpawnX = room_width-enemySpawnMargin;
	enemySpawnY = random_range(enemySpawnMargin,room_height-enemySpawnMargin);
} 
else { 
	// spawn from bot
	enemySpawnX = random_range(enemySpawnMargin,room_width-enemySpawnMargin);
	enemySpawnY = room_height-enemySpawnMargin;
}
	
// spawn a random enemy in a random corner
instance_create_layer(enemySpawnX, enemySpawnY, "EnemyLayer", enemy);