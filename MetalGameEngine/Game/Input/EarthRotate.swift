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
    
    // 0 - 0  SIMD2<Float>(-0.013090005, 1.3465213)
    private static var rotation: SIMD2<Float> = SIMD2<Float>(-0.026228666 + 0.710572, 1.3769915 + 1.2916455)
    
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
    
    private static func rotateUp(by: Float) -> Void {
        self.rotation.x += by
    }
    
    private static func rotateRight(by: Float) -> Void {
        self.rotation.y += by
    }
    
    static func getRotation() -> SIMD3<Float> {
        return SIMD3<Float>(self.rotation, 0)
    }
    
}
