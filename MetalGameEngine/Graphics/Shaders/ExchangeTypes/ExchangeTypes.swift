//
//  ExchangeTypes.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

struct CameraUniforms: Sizeable {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

struct ModelUniforms: Sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct LightData: Sizeable {
    var position: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    var color: SIMD3<Float> = SIMD3<Float>(1, 1, 1)
    var brightness: Float = 1.0
    
    var ambientIntensity: Float = 1.0
}

struct Material: Sizeable {
    var color = SIMD4<Float>(0.5, 0.7, 0.3, 1.0)
//    var useMaterialColor = false
//    var useTexture = false
//    var isLit = true
//    
//    var ambient: SIMD3<Float> = SIMD3<Float>(0.3, 0.3, 0.3)
}
