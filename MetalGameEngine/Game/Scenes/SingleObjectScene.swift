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
    let gameObject2 = GameObject(.cube)
    let gameObject = GameObject(.cube)
    
    override init() {
        super.init()
        self.setCamera(self.camera)
        
        SkyboxManager.setSkybox(.space)
        
        light.setLightColor(ColorUtil.getColor(.white))
        light.setLightAmbientIntensity(1)
        light.setPosition(SIMD3<Float>(10, 10, -10))
        self.setLight(light)
        
        self.camera.setPositionZ(0)
        
        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        gameObject.setScale(0.05)
        gameObject.move(-, 0.1, 0, 1)
        gameObject.rotateX(+, 0.5)
        gameObject.rotateY(+, 0.2)
        
        gameObject2.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        gameObject2.setScale(0.05)
        gameObject2.move(-, -0.1, 0, 1)
        gameObject2.rotateX(+, 0.3)
        gameObject2.rotateY(+, 0.7)
        
        self.addChild(gameObject)
        self.addChild(gameObject2)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.gameObject.rotateX(+, GameTime.deltaTime)
        self.gameObject.rotateY(+, GameTime.deltaTime)
        
        self.gameObject2.rotateX(+, GameTime.deltaTime)
        self.gameObject2.rotateY(+, GameTime.deltaTime)
//        self.camera.rotateX(+, GameTime.deltaTime)
//        self.camera.rotateY(+, GameTime.deltaTime)
//        self.camera.moveZ(+, 0.007)
        
//        self.light.moveX(+, GameTime.deltaTime)
//        self.light.moveY(+, GameTime.deltaTime)
//        self.light.moveZ(+, GameTime.deltaTime)
    }
    
}
