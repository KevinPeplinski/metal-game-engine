//
//  LocatableObject.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import simd

class LocateableObject: Updateable {
    
    private var position: SIMD3<Float> = SIMD3<Float>(0, 0, 0)
    
    func doUpdate() {
        print("doUpdate LocateableObject")
    }
    
}
