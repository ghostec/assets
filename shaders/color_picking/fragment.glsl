#version 150 core

in vec2 fragTexCoord;

uniform vec3 unique_id;
uniform sampler2D materialTex;

out vec4 finalColor;

void main() 
{
  if( texture(materialTex, fragTexCoord).a < 0.01 ) discard;
  finalColor = vec4( unique_id, 1.0 );
}
