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
    float3 normal;
};

vertex RastorizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant CameraUniforms &cameraUniforms [[ buffer(VertexBufferIndizesCameraUniform) ]],
                                          constant ModelUniforms &modelUniforms [[ buffer(VertexBufferIndizesModelUniform) ]]) {
    RastorizerData rd;
    
    rd.position = cameraUniforms.projectionMatrix * cameraUniforms.viewMatrix * modelUniforms.modelMatrix * float4(vIn.position, 1);
    rd.normal = vIn.normal;
    
    return rd;
}

fragment half4 basic_fragment_shader(RastorizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(FragmentBufferIndizesMaterial) ]]) {
    
    return half4(material.color.r, material.color.g, material.color.b, material.color.a);
}
