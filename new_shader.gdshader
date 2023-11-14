shader_type canvas_item;

void fragment() {
	if((UV.x * TEXTURE_PIXEL_SIZE.x <= 0.2 || UV.y * TEXTURE_PIXEL_SIZE.y <= 0.2) || (UV.x * TEXTURE_PIXEL_SIZE.x >= 0.8 || UV.y * TEXTURE_PIXEL_SIZE.y >= 0.8)){
		COLOR.rgb = vec3(0,1,0);
	}
}
