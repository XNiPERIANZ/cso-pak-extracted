uniform sampler2D TexDiffusemap;
uniform sampler2DArray TexLightmap;
uniform sampler2D TexFilter;

uniform int Switch;
uniform vec4 FogColor;
uniform vec4 FilterParam;

in VAR
{
    vec4 color;
    vec2 texCoord;
    vec3 lightmapCoord;
    float fogFactor;
} fs_in;

out vec4 FragColor;

void main (void)
{
    vec4 diffuse = texture(TexDiffusemap, fs_in.texCoord);

    vec4 light = vec4(1.0);
    if( bool(Switch & SWITCH_LIGHTMAP) )
    {
        light = texture(TexLightmap, fs_in.lightmapCoord);
    }
    else// if( bool(Switch & SWITCH_FILTERMODE) )
    {
        light.xyz = FilterParam.yzw;
    }

    vec4 color = diffuse * light * fs_in.color;

    if( bool(Switch & SWITCH_WIREFRAME) )
        color = fs_in.color;
    
    // fog
    color.xyz = mix(FogColor.xyz, color.xyz, fs_in.fogFactor);
    color.xyz = clamp(color.xyz, 0.0, 1.0);
    
    FragColor = color;
}