//
//  SkyboxShaders.metal
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 19.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

#include <metal_stdlib>
#import "ExchangeTypes/SharedIndizes.h"
using namespace metal;

struct SkyBoxVertexIn {
    float3 position [[ attribute(VertexAttributeIndizesPosition) ]];
};

struct SkyBoxRastorizerData {
    float4 position [[ position ]];
    float3 textureCords;
};

// Skybox
vertex SkyBoxRastorizerData skybox_vertex_shader(const SkyBoxVertexIn vIn [[ stage_in ]],
                                          constant CameraUniforms &cameraUniforms [[ buffer(VertexBufferIndizesCameraUniform) ]]) {
    SkyBoxRastorizerData rd;
    
    rd.position = cameraUniforms.projectionMatrix * cameraUniforms.viewMatrix * float4(vIn.position, 1);
    rd.textureCords = vIn.position;
    
    return rd;
}


fragment half4 skybox_fragment_shader(SkyBoxRastorizerData rd [[ stage_in ]],
                                     texturecube<float> skyboxtexture [[ texture(FragmentTextureIndizesBaseColor) ]]) {
    
    constexpr sampler cubesampler(mip_filter::linear, mag_filter::linear, min_filter::linear);
    
    float4 rcolor = skyboxtexture.sample(cubesampler, rd.textureCords);
    return half4(rcolor.r, rcolor.g, rcolor.b, 1);
}
