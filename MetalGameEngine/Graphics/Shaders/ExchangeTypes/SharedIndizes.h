//
//  SharedIndizes.h
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

#ifndef SharedIndizes_h
#define SharedIndizes_h

#ifdef __METAL_VERSION__
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#define NSInteger metal::int32_t
#else

#import <Foundation/Foundation.h>

#endif /* __METAL_VERSION__ */
#endif /* SharedIndizes_h */

#import <simd/simd.h>

typedef NS_ENUM(NSInteger, VertexAttributeIndizes)
{
    VertexAttributeIndizesPosition      = 0,
    VertexAttributeIndizesNormal        = 1,
    VertexAttributeIndizesTextureCords  = 2,
};

typedef NS_ENUM(NSInteger, VertexBufferIndizes)
{
    VertexBufferIndizesBuffer        = 0,
    VertexBufferIndizesCameraUniform = 1,
    VertexBufferIndizesModelUniform  = 2,
};

typedef NS_ENUM(NSInteger, FragmentBufferIndizes)
{
    FragmentBufferIndizesMaterial   = 0,
    FragmentBufferIndizesLightData  = 1,
};

typedef NS_ENUM(NSInteger, FragmentTextureIndizes)
{
    FragmentTextureIndizesBaseColor = 0,
};

typedef struct ModelUniforms {
    simd_float4x4 modelMatrix;
} ModelUniforms;

typedef struct CameraUniforms {
    simd_float4x4 viewMatrix;
    simd_float4x4 projectionMatrix;
    simd_float3 cameraPosition;
} CameraUniforms;

typedef struct Material {
    simd_float4 color;
    float shininess;
    
    ////    var useMaterialColor = false
    ////    var useTexture = false
    ////    var isLit = true
    ////
    ////    var ambient: SIMD3<Float> = SIMD3<Float>(0.3, 0.3, 0.3)
    
} Material;

typedef struct LightData {
    simd_float3 position;
    simd_float3 color;
    float brigthness;
    float ambientIntensity;
} LightData;
