//
//  SingleObjectScene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class SingleObjectScene: Scene {
    
    private var camera = Camera()
    
    let light = Light()
    
    let earth = Earth()
        
    override init() {
        super.init()
        self.setCamera(self.camera)
        
        SkyboxManager.setSkybox(.space)
        
        light.setLightColor(ColorUtil.getColor(.white))
        light.setLightAmbientIntensity(0.006)
//        light.setPosition(SIMD3<Float>(40, 80, -1.25))
        light.setPosition(SIMD3<Float>(5, 11, 1.25))
        
        
        self.setLight(light)
    

        self.earth.setScale(0.05)
        self.earth.setPositionZ(-1.0)
        self.addChild(self.earth)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.earth.rotateX(+, GameTime.deltaTime * 0.1)
        self.earth.rotateY(+, GameTime.deltaTime * 0.1)
    }
    
}
