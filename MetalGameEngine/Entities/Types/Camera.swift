//
//  Camera.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal
import simd

class Camera: RotateableObject, Renderable {
    
    private var cameraUniforms = CameraUniforms()
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(fov: 45, aspectRatio: Renderer.aspectRatio, near: 0.1, far: 1000)
    }
    
    func lookAt(point: SIMD3<Float>) -> Void {
        
        let t1 = point - self.getPosition()
        
        self.setRotationY(normalize(t1).x)
        self.setRotationX(-normalize(t1).y)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.cameraUniforms.viewMatrix = self.modelMatrix
        self.cameraUniforms.projectionMatrix = self.projectionMatrix
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&cameraUniforms, length: CameraUniforms.stride, index: VertexBufferIndizes.cameraUniform.rawValue)
    }
    
}
