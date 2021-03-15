# Nightcore Backend ![alt text](https://img.shields.io/badge/language-Swift-orange "language: Swift") ![alt text](https://img.shields.io/badge/framework-Metal-blue "framework: Metal")

MetalGameEngine and a small example game, were created for learning purposes. Mainly it was about building a rudimentary GameEngine, which can be used as a basis for simple 3D games and thereby learn how 3D computer graphics work in detail. 

## Game Engine

- Custom vertex shader 
- Custom fragment shader 
- Custom render pipeline
- Touch controlls 
- Skybox 
- Perspective camera
- Lighting (Phong reflection model)
- Custom mesh and .obj file support 

```Metal
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
```

## Example Game

![Demo gif](demo.gif)
