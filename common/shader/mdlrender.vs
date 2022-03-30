layout (location=0) in vec4 aPos;
layout (location=1) in vec3 aNormal;
layout (location=2) in vec2 aTexCoord;

uniform vec4 texOffset;
uniform vec4 colorMix;
uniform vec4 lightInfo;
uniform vec4 dLightDir;
uniform vec4 eLightPos;
uniform vec4 eLightColor;
uniform vec4 worldEye;
uniform vec4 fogInfo; // x:density, y:start, z:end
uniform vec4 param; //x:near, y:time
uniform vec4 outline;

const float v_lambert1 = 1.4953241322;
const float dMul = 1.0 / v_lambert1;
const float dAdd = (v_lambert1 - 1.0) * dMul;

layout(std140) uniform Matrices
{
	mat4 ModelView; // r_world_matrix
	mat4 Projection; // gProjectionMatrix
	vec4 BoneMat[MAXSTUDIOBONES]; // 3*4 matrix
};

out VAR
{
	vec4 color;
	vec3 normal;
	vec2 texCoord;
	vec3 texCoordCube;
	float fogFactor;
} vs_out;

void main()
{
	float alpha = lightInfo.x;
	float ambient = lightInfo.y;
	float shadeLight = lightInfo.z;
	float aniTime = lightInfo.w;
	float eLightRadius2 = eLightPos.w;
	float envBrightMul = colorMix.w;

	vec4 pos = vec4(aPos.xyz, 1.0);
	int bone = int(aPos.w);

	// bone transform
	vec4 transpos;
	vec4 boneCol0 = BoneMat[bone * 3 + 0];
	vec4 boneCol1 = BoneMat[bone * 3 + 1];
	vec4 boneCol2 = BoneMat[bone * 3 + 2];
	transpos.x = dot(pos, boneCol0);
	transpos.y = dot(pos, boneCol1);
	transpos.z = dot(pos, boneCol2);
	transpos.w = 1.0;

	vec3 viewPos = (ModelView * transpos).xyz;
	gl_Position = Projection * ModelView * transpos;

	// Normal
	vec3 normal;
	normal.x = dot(aNormal, boneCol0.xyz);
	normal.y = dot(aNormal, boneCol1.xyz);
	normal.z = dot(aNormal, boneCol2.xyz);
	vs_out.normal = normal;

	// Fog
	float fogDensity = fogInfo.x;
	float fogStart = fogInfo.y;
	float fogEnd = fogInfo.z;
	float fogFactor = 1.0;
#ifdef CSO_EXP2_FOG
    const float LOG2 = 1.442695;
    float distSQ = dot(viewPos, viewPos);
    fogFactor = exp2(-fogDensity * fogDensity * distSQ * LOG2);
    fogFactor = clamp(fogFactor, 0.0, 1.0);	
#elif defined(CSO_LINEAR_FOG)
    float dist = length(viewPos);
    fogFactor = (dist - fogStart) / (fogEnd - fogStart);
    fogFactor = 1.0 - clamp(fogFactor, 0.0, 1.0);
#endif
	vs_out.fogFactor = fogFactor;

	// Color
	vec4 color = vec4(1.0, 1.0, 1.0, alpha);
	
#ifdef CSO_FULL_DLIGHT
	color.xyz = vec3(1.0, 1.0, 1.0);
#else
    float dotNdL = dot(normal, dLightDir.xyz);
    dotNdL = max(0.0, dotNdL * dMul + dAdd);
	color.xyz = vec3(ambient);
    color.xyz -= shadeLight * dotNdL;
#endif

	color.xyz *= colorMix.xyz;

#ifdef CSO_ELIGHT
    vec3 lightVec = eLightPos.xyz - transpos.xyz;
    float attenuation = eLightRadius2 / dot(lightVec, lightVec);
    float dotNeL = max(0.0, dot(normalize(lightVec), normal));
    color.xyz += (dotNeL * attenuation) * eLightColor.xyz;
#endif

#ifdef CSO_FINAL_WHITE
    color.xyz = colorMix.xyz;
#endif

#ifdef CSO_OUTLINE
	float zLength = outline.x;
	float zMin = outline.y;
	alpha = min(alpha, (transpos.z - zMin)/zLength);
	alpha = clamp(alpha, 0.0, 1.0);

	color.xyz = colorMix.xyz;
	color.w = alpha;
#endif

	vs_out.color = color;
	
	// Texture Coordinate
	vs_out.texCoord = (aTexCoord + texOffset.xy) * texOffset.zw;

	// Cubemap
#ifdef CSO_ENV
    //Color.xyz *= envBrightMul;
	vs_out.texCoordCube = reflect(transpos.xyz - worldEye.xyz, normal);
	vs_out.texCoordCube.z *= -1.0;
#elif defined(CSO_GLOW)
    vs_out.texCoordCube = (normal * 0.2) + worldEye.xyz;
	vs_out.texCoordCube.z *= -1.0;
#endif
}