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
        light.setPosition(SIMD3<Float>(0.1, 0.1, -0.5))
        
        
        self.setLight(light)

        self.camera.setPositionZ(0)
        
        self.earth.setPositionZ(-1.0)
        self.addChild(self.earth)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        if StateManager.getState() != .inRound {
            EarthRotate.rotateRight(by: -0.001)
            EarthRotate.rotateUp(by: 0.0002)
        }
    }
    
}
