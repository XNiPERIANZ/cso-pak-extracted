layout(location=0) in vec3 aPos;
layout(location=1) in vec2 aTexCoord;
layout(location=2) in vec3 aLightmapCoord;
layout(location=3) in vec2 aDetailCoord;
layout(location=4) in vec4 aColor;

uniform int Switch;
uniform mat4 ModelView;
uniform mat4 Projection;
uniform vec4 RenderColor;
uniform vec4 FogParam;

out VAR
{
    vec4 color;
    vec2 texCoord;
    vec3 lightmapCoord;
    vec2 detailCoord;
    float fogFactor;
} vs_out;

void main()
{
    vec4 pos = vec4(aPos, 1.0);
    gl_Position = Projection * ModelView * pos;

    vec4 color;
    if(bool(Switch & SWITCH_DECAL))
        color = aColor;
    else
        color = RenderColor;
    vs_out.color = color;
    
    vs_out.texCoord = aTexCoord;
    vs_out.lightmapCoord = aLightmapCoord;
    vs_out.detailCoord = aDetailCoord;

    float fogFactor = 1.0;
    if( bool(Switch & SWITCH_FOG) )
    {
        int fogMode = int(FogParam.x);
        float fogDensity = FogParam.y;
        float fogStart = FogParam.z;
        float fogEnd = FogParam.w;
        vec3 viewPos = (ModelView * pos).xyz;

        if(fogMode == 1) // GL_LINEAR
        {
            float dist = length(viewPos);
            fogFactor = (dist - fogStart) / (fogEnd - fogStart);
            fogFactor = 1.0 - clamp(fogFactor, 0.0, 1.0);
        }
        else // GL_EXP2
        {
            const float LOG2 = 1.442695;
            float distSQ = dot(viewPos, viewPos);
            fogFactor = exp2(-fogDensity * fogDensity * distSQ * LOG2);
            fogFactor = clamp(fogFactor, 0.0, 1.0);	
        }
    }
    vs_out.fogFactor = fogFactor;
}