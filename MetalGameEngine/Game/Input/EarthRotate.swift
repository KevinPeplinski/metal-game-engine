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
    
    private static var rotation: SIMD2<Float> = SIMD2<Float>(0, 0)
    
    static func rotate(_ point: CGPoint) -> Void {
        
        let test = SIMD2<Float>(Float(point.x), Float(point.y))
        
        self.rotation = normalize(test)
        
    }
    
    static func getRotation() -> SIMD3<Float> {
        return SIMD3<Float>(self.rotation, 0)
    }
    
}
