#version 150

in vec2 fragUV;

out vec4 finalColor;

uniform sampler2D materialTex;

void main(void) {
  vec4 color = vec4(1);
  finalColor = vec4(1, 1, 1, texture(materialTex, fragUV).a) * color;
}
