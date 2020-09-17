//if (y < 120) y = 120;
event_inherited();

var speedSlower = random_range(0.5, 1);

Speed = oGame.enemySpeed*(random_range(0.75,1.25))
		*sign(random_range(-1,1))
		*speedSlower;