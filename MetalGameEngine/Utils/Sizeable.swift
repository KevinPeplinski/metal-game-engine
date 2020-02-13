//
//  Sizeable.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

protocol Sizeable { }

extension Sizeable {
    static var size: Int {
        return MemoryLayout<Self>.size
    }
    
    static var stride: Int {
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int) -> Int {
        return Self.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return Self.stride * count
    }
}

extension SIMD2: Sizeable {
    
}

extension SIMD3: Sizeable {
    
}

extension SIMD4: Sizeable {
    
}

extension Int32: Sizeable {
    
}

extension Float: Sizeable {
    
}
