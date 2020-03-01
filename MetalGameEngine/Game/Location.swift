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
        return SIMD2<Float>(self.lat, self.long)
    }
    
}
