#version 150

in vec2 vPosition;
in vec2 vUV;

out vec2 fragUV;

uniform mat4 Model;

void main()
{
  fragUV = vUV;
  gl_Position = Model * vec4(vPosition.xy, 0, 1);
}
