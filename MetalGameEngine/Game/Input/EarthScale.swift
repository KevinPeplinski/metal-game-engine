//
//  EarthScale.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 23.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class EarthScale {
    
    private static var maxScale: Float = 0.07
    private static var minScale: Float = 0.03
    private static var stepSize: Float = 0.0004
    
    private static var lastScalar: Float?
    
    static var scale: Float = 0.05
    
    static func scale(_ scalar: Float) -> Void {
        
        if self.lastScalar == nil {
            self.lastScalar = scalar
        }
        
        let scaleValue = scalar * self.stepSize
        
        var newScaleValue: Float = 0.0
        if scalar > self.lastScalar! {
            newScaleValue = self.scale + scaleValue
        } else {
            newScaleValue = self.scale - scaleValue
        }
        
        if newScaleValue > self.minScale && newScaleValue < self.maxScale {
            self.scale = newScaleValue
        }
        
        self.lastScalar = scalar
    }
    
}
