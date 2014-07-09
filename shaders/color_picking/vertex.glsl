#version 150 core

in vec3 vPosition;
in vec3 vUV;
in vec3 vNormal;

out vec2 fragTexCoord;

uniform mat4 Model;

uniform struct Camera
{
  mat4 view;
  mat4 proj;
} camera;

void main() 
{
  // Pass some variables to the fragment shader
  fragTexCoord = vec2( vUV.x, vUV.y );
  gl_Position = camera.proj * camera.view * Model * vec4(vPosition,1.0);
}
