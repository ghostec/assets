#version 150

in vec2 fragUV;

out vec4 finalColor;

uniform vec4 color;
uniform sampler2D materialTex;

void main(void)
{
  finalColor = vec4(1, 1, 1, texture(materialTex, fragUV).r) * color;
}
