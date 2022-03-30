layout(location=0) in vec3 aPos;
layout(location=1) in vec3 aColor;
layout(location=2) in vec3 aSkyColor;
layout(location=3) in vec2 aTexCoord0;
layout(location=4) in vec2 aTexCoord1;
layout(location=5) in vec2 aTexOffset;
layout(location=6) in vec3 aLight;

uniform mat4 ModelView;
uniform mat4 Projection;
uniform vec3 ViewOrg;
uniform vec4 Param;
uniform vec4 Sky;
uniform vec4 Filter;
uniform vec4 FogParam;

out VAR
{
    vec4 color;
    vec2 texCoord0;
    vec2 texCoord1;
    float fogFactor;
} vs_out;

void main()
{
    vec4 pos = vec4(aPos.xyz, 1.0);
    vec3 viewPos = (ModelView * pos).xyz;
    float dist = length(viewPos);
    gl_Position = Projection * ModelView * pos;

    // Fog
	int fogMode = int(FogParam.x);
    float fogDensity = FogParam.y;
    float fogStart = FogParam.z;
    float fogEnd = FogParam.w;
    float fogFactor = 1.0;
    if(fogMode == 1) // GL_LINEAR
    {
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
    vs_out.fogFactor = fogFactor;

    // 하늘색
    float SKY_INTERP = Sky.x;
    vec3 filterColor = Filter.xyz;
    float filterBrightness = Filter.w;
    vec3 color = mix(aColor, aSkyColor, SKY_INTERP);

    // filter
    color *= filterColor * filterBrightness;

    // 동적 라이트
    bool dlight = bool(Sky.z);
    if(dlight)
    {
        color += aLight;
        color = clamp(color, 0.0, 1.0);
    }

    // 가장자리 반투명
    float alpha = 1.0;
    alpha = (HALF_WORLD_SIZE - max(abs(aPos.x), abs(aPos.y))) / EDGE_FADE_DIST;
    alpha = clamp(alpha, 0.0, 1.0);

    // 클립 반투명
    bool bFadeMat = bool(Param.w);
    if(bFadeMat)
    {
        float fallof = 1.0 - clamp(dist / VXL_DIST_MAX, 0.1, 1.0);
        fallof = fallof * fallof;
        alpha *= fallof;
    }
    
    vs_out.color = vec4(color, alpha);

    vs_out.texCoord0 = aTexCoord0 + aTexOffset;
    vs_out.texCoord1 = aTexCoord1;

    bool bWater = bool(Param.y);
    if(bWater)
    {
        // 큰 물결
        float realtime = Param.x;
        vs_out.texCoord1.x = aPos.x * 0.001 + aPos.z * 0.001;
        vs_out.texCoord1.y = aPos.y * 0.001 + aPos.z * 0.001 + realtime * 0.02;
    }
}