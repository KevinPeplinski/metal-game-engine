//
//  Location.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 25.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

struct Location: Codable, Identifiable {
    
    let id: UUID
    let name: String
    let country: String
    let population: Float
    let capital: Bool
    let long: Float
    let lat: Float
    
    func getRotationVector() -> SIMD2<Float> {
        let step = Float.pi / 180

        let x = step * self.lat
        let y = step * self.long
        
        return SIMD2<Float>(x, y)
    }
    
}
