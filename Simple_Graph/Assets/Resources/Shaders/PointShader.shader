Shader "Test/PointShader"
{
    Properties
    {
        [MainColor] _BaseColor("Base Color", Color) = (1, 1, 1, 1)
        [MainTexture] _BaseMap("Base Map", 2D) = "white"
    }
    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
            "RenderPipeline" = "UniversalPipeline"
            "UniversalMaterialType" = "Lit"
            "Queue"="Geometry"
            "DisableBatching"="False"
        }
        
        Pass
        {
            HLSLPROGRAM

            #pragma target 3.0
            #pragma multi_compile_instancing
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Macros.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS: POSITION;
                float2 uv: TEXCOORD0;
            };

            struct Varyings
            {
                half4 worldPosition: COLOR0;
                float4 positionHCS: SV_POSITION;
                float2 uv: TEXCOORD0;
            };

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);

            CBUFFER_START(UnityPerMaterial)

                half4 _BaseColor;
                float4 _BaseMap_ST;
            
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;

                OUT.worldPosition = half4(TransformObjectToWorld(IN.positionOS), 1);
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

                return OUT;
            }

            half4 frag(Varyings IN): SV_Target
            {
                half4 color = IN.worldPosition;

                return color;
            }
            
            ENDHLSL
        }
    }
}
