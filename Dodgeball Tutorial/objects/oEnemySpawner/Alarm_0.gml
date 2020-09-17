//Choose a random enemy to spawn
var random_enemy = choose(oEnemyMedium, oEnemySmall, oEnemyBig, oEnemySpecial);

//Chose a random side to spawn the enemy
var random_side = random(1);

if random_side < 0.25 {
	//Spawn from top
	instance_create_layer(random(room_width), 0, "Enemies", random_enemy);
} 
else if random_side < 0.5 {
	//Spawn from bot
	instance_create_layer(random(room_width), room_height, "Enemies", random_enemy);	
} 
else if random_side < 0.75 {
	//Spawn from left
	instance_create_layer(0, random(room_height), "Enemies", random_enemy);
} 
else {
	//Spawn from right
	instance_create_layer(room_width, random(room_height), "Enemies", random_enemy);
}

//we reset the alarm becase we want to keep spawning enemies
alarm[0] = spawn_rate;