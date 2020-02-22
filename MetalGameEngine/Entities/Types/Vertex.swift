//
//  Vertex.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

struct Vertex: Sizeable {
    var position: SIMD3<Float>
    var normal: SIMD3<Float>
    var textureCords: SIMD2<Float> = SIMD2<Float>(0, 0)
}
