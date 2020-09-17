if (isMouseOnSprite()) {
	size += sizeInc;

	if (size > maxSize) {
		size = maxSize;
		sizeInc = -sizeInc;
	} else if (size < 1) {
		size = 1;
		sizeInc = -sizeInc;
	}
} else {
	size = 1;
}

image_xscale = size;
image_yscale = size;