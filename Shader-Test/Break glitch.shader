shader_type canvas_item;

uniform bool apply = true;
uniform float amountX = 1.0;
uniform float amountY = 1.0;
uniform sampler2D offset_texture : hint_white;

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	//vec4 color = vec4(1.0 , 1.0 , 1.0, 1.0); 
	vec4 color = texture_color;
	if (apply == true){
		float offset_amountX = (amountX/100.0) * texture(offset_texture, UV).r;
		float offset_amountY = (amountY/100.0) * (texture(offset_texture, UV).r -1.0);
		color = texture(TEXTURE, vec2(UV.x + offset_amountX, UV.y + offset_amountY));
	}
	
	COLOR = color;
}