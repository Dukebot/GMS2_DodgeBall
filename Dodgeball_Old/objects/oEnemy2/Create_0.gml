event_inherited();

var speedBonus = random_range(1, 2);

Speed = oGame.enemySpeed
		* (random_range(0.75,1.25))
		* sign(random_range(-1,1))
		* speedBonus;
