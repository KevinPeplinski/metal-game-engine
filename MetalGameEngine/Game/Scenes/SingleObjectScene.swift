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
    
//    let lightvisual = GameObject(.cube)
        
    override init() {
        super.init()
        self.setCamera(self.camera)
        
        SkyboxManager.setSkybox(.space)
        
        light.setLightColor(ColorUtil.getColor(.white))
        light.setLightAmbientIntensity(0.006)
//        light.setPosition(SIMD3<Float>(40, 80, -1.25))
        light.setPosition(SIMD3<Float>(5, 11, 1.25))
//        light.setPosition(SIMD3<Float>(1.4, 1.4, -0.452))
        
//        lightvisual.setScale(0.005)
//        lightvisual.material.color = ColorUtil.getColor(.white)
//        lightvisual.setPosition(light.getPosition())
        
        
        self.setLight(light)

        self.camera.setPositionZ(0)
        
        self.earth.setPositionZ(-1.0)
        self.addChild(self.earth)
//        self.addChild(lightvisual)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
//        self.light.moveZ(-, GameTime.deltaTime * 0.1)
//        self.lightvisual.setPosition(self.light.getPosition())
//        self.camera.rotateX(-, GameTime.deltaTime)
//        self.camera.rotateY(-, GameTime.deltaTime)
        
//        if StateManager.current == .start {
//            self.earth.rotateX(+, GameTime.deltaTime * 0.1)
//            self.earth.rotateY(+, GameTime.deltaTime * 0.1)
//        }
        
    }
    
}
