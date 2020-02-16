//
//  ColorUtils.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

enum KPColor {
    case red
    case green
    case blue
}

class ColorUtil {
    
    public static func getRandomColor() -> SIMD4<Float> {
        let range: ClosedRange<Float> = 0...1
        return SIMD4<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range), 1)
    }
    
    public static func getRandomColor() -> SIMD3<Float> {
        let range: ClosedRange<Float> = 0...1
        return SIMD3<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range))
    }
    
    public static func getRandomColorNotWhiteBlack() -> SIMD4<Float> {
        let range: ClosedRange<Float> = 0.1...0.9
        return SIMD4<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range), 1)
    }
    
    public static func getRandomColorNotWhiteBlack() -> SIMD3<Float> {
        let range: ClosedRange<Float> = 0.1...0.9
        return SIMD3<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range))
    }
    
    public static func getColor(_ color: KPColor) -> SIMD4<Float> {
        switch color {
        case .blue:
            return SIMD4<Float>(0, 0, 1, 1)
        case .green:
            return SIMD4<Float>(0, 1, 0, 1)
        case .red:
            return SIMD4<Float>(1, 0, 0, 0)
        }
    }
    
    public static func getColor(_ color: KPColor) -> SIMD3<Float> {
        switch color {
        case .blue:
            return SIMD3<Float>(0, 0, 1)
        case .green:
            return SIMD3<Float>(0, 1, 0)
        case .red:
            return SIMD3<Float>(1, 0, 0)
        }
    }

}
