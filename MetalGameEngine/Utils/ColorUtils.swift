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
    case white
    case black
}

class ColorUtil {
    
    // SIMD4<Float>
    public static func getRandomColor() -> SIMD4<Float> {
        let range: ClosedRange<Float> = 0...1
        return SIMD4<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range), 1)
    }
    
    public static func getRandomColorNotWhiteBlack() -> SIMD4<Float> {
        let range: ClosedRange<Float> = 0.1...0.9
        return SIMD4<Float>(Float.random(in: range), Float.random(in: range), Float.random(in: range), 1)
    }
    
    public static func getColor(_ color: KPColor) -> SIMD4<Float> {
        switch color {
        case .blue:
            return SIMD4<Float>(0, 0, 1, 1)
        case .green:
            return SIMD4<Float>(0, 1, 0, 1)
        case .red:
            return SIMD4<Float>(1, 0, 0, 1)
        case .white:
            return SIMD4<Float>(1, 1, 1, 1)
        case .black:
            return SIMD4<Float>(0, 0, 0, 1)
        }
    }
    
    // SIMD3<Float> overloads
    public static func getRandomColor() -> SIMD3<Float> {
        let returnVector: SIMD4<Float> = ColorUtil.getRandomColor()
        return SIMD3<Float>(returnVector.x, returnVector.y, returnVector.z)
    }
    
    public static func getRandomColorNotWhiteBlack() -> SIMD3<Float> {
        let returnVector: SIMD4<Float> = ColorUtil.getRandomColorNotWhiteBlack()
        return SIMD3<Float>(returnVector.x, returnVector.y, returnVector.z)
    }
    
    public static func getColor(_ color: KPColor) -> SIMD3<Float> {
        let returnVector: SIMD4<Float> = ColorUtil.getColor(color)
        return SIMD3<Float>(returnVector.x, returnVector.y, returnVector.z)
    }

}
