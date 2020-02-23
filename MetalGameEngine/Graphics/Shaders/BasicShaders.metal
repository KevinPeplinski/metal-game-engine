//
//  BasicShaders.metal
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

#include <metal_stdlib>
#import "ExchangeTypes/SharedIndizes.h"
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(VertexAttributeIndizesPosition) ]];
    float3 normal [[ attribute(VertexAttributeIndizesNormal) ]];
};

struct RastorizerData {
    float4 position [[ position ]];
    float3 worldSpacePosition;
    float3 normal;
    
    float3 cameraPosition;
};

vertex RastorizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant CameraUniforms &cameraUniforms [[ buffer(VertexBufferIndizesCameraUniform) ]],
                                          constant ModelUniforms &modelUniforms [[ buffer(VertexBufferIndizesModelUniform) ]]) {
    RastorizerData rd;
    
    float4 worldSpacePosition = modelUniforms.modelMatrix * float4(vIn.position, 1);
    rd.position = cameraUniforms.projectionMatrix * cameraUniforms.viewMatrix * worldSpacePosition;
    rd.worldSpacePosition = worldSpacePosition.xyz;
    rd.normal = (modelUniforms.modelMatrix * float4(vIn.normal, 1)).xyz;
    
    rd.cameraPosition = cameraUniforms.cameraPosition;
    
    return rd;
}

fragment half4 basic_fragment_shader(RastorizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(FragmentBufferIndizesMaterial) ]],
                                     constant LightData &lightData [[ buffer(FragmentBufferIndizesLightData) ]]) {
    float3 color;
    
    // Ambient
    float3 ambient = lightData.ambientIntensity * lightData.color;
    
    // Diffuse
    float3 unitNormal = normalize(rd.normal);
    float3 unitLightDirection = normalize(lightData.position - rd.worldSpacePosition);
    float diff = max(dot(unitNormal, unitLightDirection), 0.0);
    float3 diffuse = clamp(diff * lightData.color, 0.0, 1.0);
    
    // Specular
    float3 unitToCameraDirection = normalize(rd.cameraPosition - rd.worldSpacePosition);
    float3 unitReflectDir = normalize(reflect(-unitLightDirection, unitNormal));
    float spec = pow(max(dot(unitReflectDir, unitToCameraDirection), 0.0), material.shininess);
    float3 specular = clamp(spec * lightData.color, 0.0, 1.0);
    
    
    color = (ambient + diffuse + specular) * material.color.xyz;
    
    return half4(color.r, color.g, color.b, 1);
}
