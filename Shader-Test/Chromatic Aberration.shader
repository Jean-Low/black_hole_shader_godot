shader_type canvas_item;

uniform bool apply = false;
uniform float amount = 1.0;
uniform sampler2D offset_texture : hint_white;

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	//vec4 color = vec4(1.0 , 1.0 , 1.0, 1.0);  
	vec4 color = texture_color;
	if (apply == true){
		float offset_amount = (amount/100.0) * texture(offset_texture, UV).r;
		color.r = texture(TEXTURE, vec2(UV.x + offset_amount, UV.y)).r;
		color.g = texture(TEXTURE, UV).g;
		color.b = texture(TEXTURE, vec2(UV.x - offset_amount, UV.y)).b;
	}
	
	COLOR = color;
}