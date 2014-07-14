#version 150 core
#extension GL_EXT_gpu_shader4 : enable
#extension GL_EXT_geometry_shader4 : enable

layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

in vec2 fragTexCoordT[3];
in vec3 fragVertT[3];
in vec3 fragNormalT[3];

out vec2 fragTexCoord;
out vec3 fragVert;
out vec3 fragNormal;

//uniform vec2 WIN_SCALE;
noperspective out vec3 dist;

void main(void)
{
	vec2 WIN_SCALE = vec2(800, 600);

	// taken from 'Single-Pass Wireframe Rendering'
	vec2 p0 = WIN_SCALE * gl_PositionIn[0].xy/gl_PositionIn[0].w;
	vec2 p1 = WIN_SCALE * gl_PositionIn[1].xy/gl_PositionIn[1].w;
	vec2 p2 = WIN_SCALE * gl_PositionIn[2].xy/gl_PositionIn[2].w;
	vec2 v0 = p2-p1;
	vec2 v1 = p2-p0;
	vec2 v2 = p1-p0;
	float area = abs(v1.x*v2.y - v1.y * v2.x);

	dist = vec3(area/length(v0),0,0);
	fragTexCoord = fragTexCoordT[0];
	fragVert = fragVertT[0];
	fragNormal = fragNormalT[0];
	gl_Position = gl_PositionIn[0];
	EmitVertex();
	dist = vec3(0,area/length(v1),0);
	fragTexCoord = fragTexCoordT[1];
	fragVert = fragVertT[1];
	fragNormal = fragNormalT[1];
	gl_Position = gl_PositionIn[1];
	EmitVertex();
	dist = vec3(0,0,area/length(v2));
	fragTexCoord = fragTexCoordT[2];
	fragVert = fragVertT[2];
	fragNormal = fragNormalT[2];
	gl_Position = gl_PositionIn[2];
	EmitVertex();
	EndPrimitive();
}