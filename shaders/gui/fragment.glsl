#version 150 core

in vec2 fragTexCoord;
in vec3 fragVert;
in vec3 fragNormal;
out vec4 finalColor;

struct Light 
{
   vec3 position;
   vec3 intensities;
   float attenuation;
   float ambientCoefficient;
};

uniform Light lights[10];

struct Material
{
  // diffuse_color
  // specular color
  bool activate_texture, activate_color;
  sampler2D texture;
  vec4 color;
};

uniform Material material;

uniform float opacity;
uniform mat4 Model;

void main()
{
  vec4 surfaceColor;
  if( material.activate_texture ) surfaceColor = texture(material.texture, fragTexCoord);
  if( material.activate_color ) surfaceColor *= material.color;
  finalColor = surfaceColor;
}
