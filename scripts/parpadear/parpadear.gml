// parpadear
if (hit) {
	hitCount--;
	if (hitCount < 0) hit = false;
	if (alphaInc < 0) and (image_alpha < 0) alphaInc *= -1;
	else if (alphaInc > 0) and (image_alpha > 1) alphaInc *= -1;
	image_alpha += alphaInc;
} else {
	image_alpha = 1;
}