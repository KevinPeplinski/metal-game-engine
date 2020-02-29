//
//  EarthRotate.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 23.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd
import UIKit

class EarthRotate {
    
    // 0 - 0  SIMD2<Float>(-0.013090005, 1.3769915)
//    private static var rotation: SIMD2<Float> = SIMD2<Float>(-0.026228666 + 0.710572, 1.3769915 + 1.2916455)
    private static var rotation: SIMD2<Float> = SIMD2<Float>(-0.013090005, 1.3769915)
    
    public static var zero: SIMD2<Float> = SIMD2<Float>(-0.013090005, 1.3769915)
    
    static var previousPanPoint: CGPoint?
    
    private static let pixelToAngleConstant: Float = .pi / 1200
    
    static func rotate(_ point: CGPoint) -> Void {
        
        if let previousPoint = self.previousPanPoint {
            let dx = Float(point.x - previousPoint.x)
            let dy = Float(point.y - previousPoint.y)
            
            self.rotateUp(by: dy * pixelToAngleConstant)
            self.rotateRight(by: dx * pixelToAngleConstant)
        }

        self.previousPanPoint = point
    }
    
    static func rotateUp(by: Float) -> Void {
        self.rotation.x += by
        
        if self.rotation.x > .pi {
            self.rotation.x = -.pi + self.rotation.x.truncatingRemainder(dividingBy: .pi)
        }
        
        if self.rotation.x < -.pi {
            self.rotation.x = .pi - self.rotation.x.truncatingRemainder(dividingBy: .pi)
        }
    }
    
    static func rotateRight(by: Float) -> Void {
        self.rotation.y += by
        
        if self.rotation.y > .pi {
            self.rotation.y = -.pi + self.rotation.y.truncatingRemainder(dividingBy: .pi)
        }
        
        if self.rotation.y < -.pi {
            self.rotation.y = .pi - self.rotation.y.truncatingRemainder(dividingBy: .pi)
        }
    }
    
    static func getRotation() -> SIMD3<Float> {
        return SIMD3<Float>(self.rotation, 0)
    }
    
    static func getLatitudinal() -> SIMD2<Float> {

        let step: Float = .pi / 180
        let rota = self.rotation - self.zero
        
        let x: Float = rota.x / step
        let y: Float = -rota.y / step
        
        print("truncating postion: \(SIMD2<Float>(x, y))")
        
        return SIMD2<Float>(x, y)
    }
    
}
