shader_type spatial;
render_mode unshaded; //unshaded is great

uniform float core_size : hint_range(0.0,1.0) = 0.5;
uniform float strenght : hint_range(0.0, 10.0) = 3.0;

//functions for procedure

//remap: "Returns a value between the x and y components of input Out Min Max based on the linear interpolation of 
//the value of input In between the x and y components of input In Min Max." - Unity Docs
//
vec4 remap(vec4 input, vec2 in_min_max, vec2 out_min_max){
    return out_min_max.x + (input - in_min_max.x) * (out_min_max.y - out_min_max.x) / (in_min_max.y - in_min_max.x);
}

// Fresnel effect, used to make a treshold
float fresnel(vec3 normal, vec3 view, float power)
{
    return pow((1.0 - clamp((dot(normalize(normal), normalize(view))),0.0,1.0)), power);
}

void vertex() {

}

void fragment() {
	
	//Get distorted UV position for making the effect, using a remap (we only need the first 2 items)
	vec2 distorted_UV = remap(vec4(SCREEN_UV, 0.0, 0.0), vec2(0.0, 1.0), vec2(1.0, -1.0)).xy;
	
	//calculate the intensity of the distortion on this pixel
	float intensity = pow((1.0 - fresnel(NORMAL, VIEW, strenght)), 6);
	
	//Apply distortion with weight based on intensity of effect (proximity with center)
	vec2 weighted_distorted_UV = intensity * distorted_UV;
	
	//Add the distorted UVs with original UVs to get relative vectorial positions
	vec2 local_weighted_distorted_UV = weighted_distorted_UV + SCREEN_UV;
	
	//From distorted UVs get the right color of that coordenate
	vec3 distorted_color = textureLod( SCREEN_TEXTURE, local_weighted_distorted_UV, 0.0).rgb;
	
	//Make core
	float core = 0.0;
	if(fresnel(NORMAL, VIEW, 0.15) > core_size){
		core = 1.0;
	}
	//Add Core with distorted cores
	ALBEDO = distorted_color * core;
	
}