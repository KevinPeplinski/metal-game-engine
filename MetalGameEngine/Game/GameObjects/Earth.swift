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
        super.init(.earth_around)
        self.material.color = ColorUtil.getColor(.earth_around)
        self.material.shininess = 1.2
        
        let water = GameObject(.earth_water)
        water.material.color = ColorUtil.getColor(.earth_water)
        water.material.shininess = 1.2
//        water.scale(-, 0.01)
        
        let land = GameObject(.earth_land)
        land.material.color = ColorUtil.getColor(.earth_land)
        land.material.shininess = 1.2
        
        self.addChild(water)
        self.addChild(land)
        
        self.setScale(EarthScale.scale)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.setScale(EarthScale.scale)
    }
    
}
