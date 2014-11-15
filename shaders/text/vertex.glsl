#version 150

in vec2 vPosition;
in vec2 vUV;

out vec2 fragUV;

void main()
{
  fragUV = vUV;
  gl_Position = vec4(vPosition.xy, 0, 1);
}
