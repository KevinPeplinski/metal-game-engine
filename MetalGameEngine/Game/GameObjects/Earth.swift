//
//  Earth.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 22.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class Earth: GameObject {

    init() {
        super.init(.earth_around)
        self.material.color = ColorUtil.getColor(.earth_around)
        self.material.shininess = 5.2
        
        let water = GameObject(.earth_water)
        water.material.color = ColorUtil.getColor(.earth_water)
        water.material.shininess = 5.2
//        water.scale(-, 0.01)
        
        let land = GameObject(.earth_land)
        land.material.color = ColorUtil.getColor(.earth_land)
        land.material.shininess = 5.2
        
        self.addChild(water)
        self.addChild(land)
        
        self.setScale(EarthScale.getScale())
        self.setRotation(EarthRotate.getRotation())
        
//        self.rotate(+, 0.4686221, 0.6331452, 0.6331452)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.setScale(EarthScale.getScale())
        self.setRotation(EarthRotate.getRotation())
        
//        self.setRotation(SIMD3<Float>(0.905826, 1.1405728, 0.0))
    }
    
}
