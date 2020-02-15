//
//  Camera.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

class Camera: RotateableObject {
    
    var viewMatrix: matrix_float4x4 {
        return self.modelMatrix
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(fov: 45, aspectRatio: Renderer.aspectRatio, near: 0.1, far: 1000)
    }
    
}
