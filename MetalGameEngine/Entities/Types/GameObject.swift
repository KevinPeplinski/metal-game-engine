//
//  GameObject.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal
import simd

class GameObject: RotateableObject, Renderable {

    private var modelConstants = ModelConstants()
    private var scale = SIMD3<Float>(1, 1, 1)
    private var children: [GameObject] = []
    
//    private var parentModelMatrix = matrix_identity_float4x4
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        print("doRender Gameobject")
    }
    
}
