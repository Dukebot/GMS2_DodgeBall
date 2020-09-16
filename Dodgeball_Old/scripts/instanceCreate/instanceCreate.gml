///@param object
var object = 0;
if (argument_count > 0) object = argument[0];

///@param x
var X = 0;
if (argument_count > 1) X = argument[1];

///@param y
var Y = 0;
if (argument_count > 2) Y = argument[2];

///@param layer
var Layer = "Instances";
if (argument_count > 3) Layer = argument[3];

///@return instance created
return instance_create_layer(X, Y, Layer, object);