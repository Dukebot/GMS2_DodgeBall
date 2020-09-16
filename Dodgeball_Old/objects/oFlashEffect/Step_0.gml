alpha -= 0.04;
layer_background_alpha(layer_background_get_id(layer_get_id("Flash")), alpha);
if (alpha <= 0) {
	layer_background_alpha(layer_background_get_id(layer_get_id("Flash")), 0);
	instance_destroy();
}