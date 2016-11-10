// Polygon curve - gives you the (x, y) coordinates (in respect to the unit circle)
// for any point along an n-sided polygon's curve
//
// usage: polygon_curve(real numsides, real theta, <optional> ds_list coordinateList)
//
// Arguments:
//      0   -  number of sides
//      1   -  theta angle
//      2   -  (optional) pointer to coordinateList member variable
// Returns:
//      (void) if coordinateList is defined
//      (ds_list) if coordinateList is undefined

var ns = round(argument0);
var theta = argument1;

var dv = (1 / cos((2 / ns) * arcsin(sin((ns / 2) * theta))));

var sinx = dv * sin(theta);
var siny = dv * cos(theta);

if( argument2 != noone ) {
    ds_list_add(argument2, sinx, siny);
    exit;
} else {
    retList = ds_list_create();
    ds_list_add(retList, sinx, siny);
    return retList;
}
