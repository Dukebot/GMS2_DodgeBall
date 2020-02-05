//Grow big and small with time
size += sizeInc;

if (size > 1 + sizeRange) {
	size = 1 + sizeRange;
	sizeInc = -sizeInc;
} 
else if (size < 1 - sizeRange) {
	size = 1 - sizeRange;
	sizeInc = -sizeInc;
}

image_xscale = size;
image_yscale = size;