#version 150 core

in vec3 vPosition;
in vec3 vUV;
in vec3 vNormal;

out vec3 vertWorldPos;
out vec3 vertWorldNormal;

out vec2 fragTexCoordT;
out vec3 fragVertT;
out vec3 fragNormalT;

uniform mat4 Model;

uniform struct Camera
{
  mat4 view;
  mat4 proj;
} camera;

void main() 
{
  // Pass some variables to the fragment shader
  fragTexCoordT = vec2( vUV.x, vUV.y );
  fragNormalT = vNormal;
  fragVertT = vPosition; 
  
  vertWorldNormal = normalize(transpose(inverse(mat3(Model))) * vNormal);
  vertWorldPos = vec3( camera.proj * camera.view * Model * vec4(vPosition,1.0) );
  
  gl_Position = camera.proj * camera.view * Model * vec4(vPosition,1.0);
}
