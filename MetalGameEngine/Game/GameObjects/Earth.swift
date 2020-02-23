//
//  Earth.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 22.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class Earth: GameObject {

    init() {
        super.init(.earth_water)
        
        self.material.shininess = 1.2
    }
    
}
