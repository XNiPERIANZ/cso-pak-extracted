uniform sampler2D Tex1;
uniform sampler2D Tex2;

uniform vec4 Param;
uniform vec4 FogColor;

in VAR
{
    vec4 color;
    vec2 texCoord0;
    vec2 texCoord1;
    float fogFactor;
} fs_in;

out vec4 FragColor;

void main()
{
    vec4 texel0 = texture(Tex1, fs_in.texCoord0);
    vec4 texel1 = vec4(1.0);

    bool bTex2 = bool(Param.z);
    if(bTex2)
    {
        texel1 = texture(Tex2, fs_in.texCoord1);
        texel1.xyz *= 2.0; // GL_RGB_SCALE
    }
    
    vec4 color = fs_in.color * texel0 * texel1;
    color.xyz = mix(FogColor.xyz, color.xyz, fs_in.fogFactor);

    FragColor = color;
}