//
//  RotateableObject.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class RotateableObject: LocateableObject {
    
    private var rotation: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    
    override func doUpdate() {
        super.doUpdate()
        
        self.modelMatrix.rotate(angle: self.getRotationX(), axis: X_AXIS)
        self.modelMatrix.rotate(angle: self.getRotationY(), axis: Y_AXIS)
        self.modelMatrix.rotate(angle: self.getRotationZ(), axis: Z_AXIS)
    }
    
}

extension RotateableObject {
    func setRotation(_ rotation: SIMD3<Float>) -> Void {
        self.rotation = rotation
    }
    
    func setRotationX(_ xRotation: Float) -> Void {
        self.rotation.x = xRotation
    }
    
    func setRotationY(_ yRotation: Float) -> Void {
        self.rotation.y = yRotation
    }
    
    func setRotationZ(_ zRotation: Float) -> Void {
        self.rotation.z = zRotation
    }
    
    func getRotation() -> SIMD3<Float> {
        return self.rotation
    }
    
    func getRotationX() -> Float {
        return self.rotation.x
    }
    
    func getRotationY() -> Float {
        return self.rotation.y
    }
    
    func getRotationZ() -> Float {
        return self.rotation.z
    }
    
    func rotate(_ operation:((SIMD3<Float>, SIMD3<Float>) -> SIMD3<Float>), _ x: Float, _ y: Float, _ z: Float) -> Void {
        self.rotation = operation(self.rotation, SIMD3<Float>(x, y, z))
    }
    
    func rotateX(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.rotation.x = operation(self.rotation.x, delta)
    }
    
    func rotateY(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.rotation.y = operation(self.rotation.y, delta)
    }
    
    func rotateZ(_ operation:((Float, Float) -> Float), _ delta: Float) -> Void {
        self.rotation.z = operation(self.rotation.z, delta)
    }
}
