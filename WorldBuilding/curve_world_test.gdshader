shader_type spatial;

uniform float vertical_curviness = -0.001; uniform float horizontal_curviness = 0.0; uniform float curve_offset = 5.0;

void vertex() { vec4 view_pos = MODELVIEW_MATRIX * vec4(VERTEX, 1.0); float z_dist = -view_pos.z;

if (z_dist > curve_offset) {

float delta = z_dist - curve_offset;

float dist_sq = delta * delta;



view_pos.y += dist_sq * vertical_curviness;

view_pos.x += dist_sq * horizontal_curviness;

}



VERTEX = (inverse(MODELVIEW_MATRIX) * view_pos).xyz;

}

