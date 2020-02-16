//
//  LocatableObject.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

class LocateableObject: Updateable {
    
    private var position: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    var modelMatrix: matrix_float4x4 = matrix_identity_float4x4
    
    func doUpdate() {
        self.modelMatrix = matrix_identity_float4x4
        
        // TODO I dont thing its a good Idea to check for Camera every Element Every Call (60 times a sec)
        if self is Camera {
            self.modelMatrix.translate(direction: -self.getPosition())
            return
        }
        self.modelMatrix.translate(direction: self.getPosition())
    }

}

extension LocateableObject {
    func setPosition(_ position: SIMD3<Float>) -> Void {
        self.position = position
    }
    
    func setPositionX(_ xPosition: Float) -> Void {
        self.position.x = xPosition
    }
    
    func setPositionY(_ yPosition: Float) -> Void {
        self.position.y = yPosition
    }
    
    func setPositionZ(_ zPosition: Float) -> Void {
        self.position.z = zPosition
    }
    
    func getPosition() -> SIMD3<Float> {
        return self.position
    }
    
    func getPositionX() -> Float {
        return self.position.x
    }
    
    func getPositionY() -> Float {
        return self.position.y
    }
    
    func getPositionZ() -> Float {
        return self.position.z
    }
    
    func move(_ operation:((SIMD3<Float>, SIMD3<Float>) -> SIMD3<Float>), _ x: Float, _ y: Float, _ z: Float) -> Void {
        self.position = operation(self.position, SIMD3<Float>(x, y, z))
    }
    
    func moveX(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.position.x = operation(self.position.x, delta)
    }
    
    func moveY(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.position.y = operation(self.position.y, delta)
    }
    
    func moveZ(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.position.z = operation(self.position.z, delta)
    }
}
