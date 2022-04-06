uniform sampler2D texDiffuseMap;
uniform samplerCube texEnvMap;
uniform vec4 glowColor;
uniform vec4 fogColor;

in VAR
{
	vec4 color;
	vec3 normal;
	vec2 texCoord;
	vec3 texCoordCube;
	float fogFactor;
} fs_in;

out vec4 FragColor;

void main (void)
{
    vec4 vDiffuse = texture(texDiffuseMap, fs_in.texCoord).rgba * fs_in.color;

#ifdef CSO_ENV
    vec3 cubeColor = texture(texEnvMap, fs_in.texCoordCube).rgb;
    vDiffuse.xyz = (vDiffuse.xyz + glowColor.www) * cubeColor;
#elif defined(CSO_GLOW)
    vec3 cubeColor = texture(texEnvMap, fs_in.texCoordCube).rgb;
    vDiffuse.xyz = vDiffuse.xyz + (cubeColor * glowColor.xyz);        
#endif
    
#if defined(CSO_EXP2_FOG) || defined(CSO_LINEAR_FOG)
    vDiffuse.xyz = mix(fogColor.xyz, vDiffuse.xyz, fs_in.fogFactor);
#endif
    
    FragColor = vDiffuse;
}