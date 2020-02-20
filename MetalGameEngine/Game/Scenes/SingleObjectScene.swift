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
    
    override init() {
        super.init()
        self.setCamera(self.camera)
        
        SkyboxManager.setSkybox(.space)
        
        let light = Light()
        light.setLightColor(ColorUtil.getColor(.green))
        light.setLightAmbientIntensity(1)
        self.setLight(light)
        
        self.camera.setPositionZ(0)
        
        let gameObject = GameObject(.cube)
        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        gameObject.setScale(0.05)
        gameObject.move(-, 0.1, 0, 1)
        gameObject.rotateX(+, 0.5)
        gameObject.rotateY(+, 0.2)
        
        let gameObject2 = GameObject(.cube)
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
//        self.camera.rotateX(+, GameTime.deltaTime)
//        self.camera.rotateY(+, GameTime.deltaTime)
//        self.camera.moveZ(+, 0.007)
    }
    
}
