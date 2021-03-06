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

    var mesh: Mesh
    private var modelUniforms = ModelUniforms()
    private var scale = SIMD3<Float>(1, 1, 1)
    var material = Material()
    
    var parentModelMatrix = matrix_identity_float4x4
    
    private var children: [GameObject]?
    
    init(_ mesh: MeshType) {
//        self.modelUniforms.modelMatrix = matrix_identity_float4x4
        self.mesh = Entities.meshes[mesh]
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.modelMatrix.scale(axis: self.scale)
        self.modelUniforms.modelMatrix = matrix_multiply(self.parentModelMatrix, self.modelMatrix)
        
        if let children = self.children {
            for child in children {
                
                child.parentModelMatrix = self.modelMatrix
                child.doUpdate()
            }
        }
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        
        renderCommandEncoder.setRenderPipelineState(Graphics.renderPipelineStates[.basic])
        renderCommandEncoder.setDepthStencilState(Graphics.depthStencilStates[.less])
    
        // Vertex Shader
        renderCommandEncoder.setVertexBytes(&modelUniforms, length: ModelUniforms.stride, index: VertexBufferIndizes.modelUniform.rawValue)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: FragmentBufferIndizes.material.rawValue)
        
        self.mesh.drawPrimitives(renderCommandEncoder)
        
        if let children = self.children {
            for child in children {
                child.doRender(renderCommandEncoder)
            }
        }
    }
    
    func addChild(_ child: GameObject) -> Void {
        if self.children?.append(child) == nil {
            self.children = [child]
        }
    }
    
}

extension GameObject {
    func setScale(_ scale: SIMD3<Float>) -> Void {
        self.scale = scale
    }
    
    func setScale(_ scale: Float) -> Void {
        setScale(SIMD3<Float>(scale, scale, scale))
    }
    
    func setScaleX(_ scaleX: Float) -> Void {
        self.scale.x = scaleX
    }
    
    func setScaleY(_ scaleY: Float) -> Void {
        self.scale.y = scaleY
    }
    
    func setScaleZ(_ scaleZ: Float) -> Void {
        self.scale.z = scaleZ
    }
    
    func getScale() -> SIMD3<Float> {
        return self.scale
    }
    
    func getScaleX() -> Float {
        return self.scale.x
    }
    
    func getScaleY() -> Float {
        return self.scale.y
    }
    
    func getScaleZ() -> Float {
        return self.scale.z
    }
    
    func scale(_ operation:((SIMD3<Float>, SIMD3<Float>) -> SIMD3<Float>), _ x: Float, _ y: Float, _ z: Float) -> Void {
        self.scale = operation(self.scale, SIMD3<Float>(x, y, z))
    }
    
    func scale(_ operation:((SIMD3<Float>, SIMD3<Float>) -> SIMD3<Float>), _ delta: Float) -> Void {
        self.scale = operation(self.scale, SIMD3<Float>(delta, delta, delta))
    }
    
    func scaleX(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.scale.x = operation(self.scale.x, delta)
    }
    
    func scaleY(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.scale.y = operation(self.scale.y, delta)
    }
    
    func scaleZ(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.scale.z = operation(self.scale.z, delta)
    }
}
