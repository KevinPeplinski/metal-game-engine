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
//    let gameObject2 = GameObject(.cube)
//    let gameObject = GameObject(.cube)
    
    let earth = Earth()
        
    override init() {
        super.init()
        self.setCamera(self.camera)
        
        SkyboxManager.setSkybox(.space)
        
//        self.camera.setRotationY(Float.pi / 2)
        
        light.setLightColor(ColorUtil.getColor(.white))
        light.setLightAmbientIntensity(0.001)
//        light.setPosition(SIMD3<Float>(40, 80, -1.25))
        light.setPosition(SIMD3<Float>(35, 80, 9))
        
//        light.setLightAmbientIntensity(0.001)
//        light.setPosition(SIMD3<Float>(-10, -20, 1.25))
        
        self.setLight(light)
        
        self.camera.setPositionX(0)
        
//        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
//        gameObject.setScale(0.05)
//        gameObject.move(-, 0.1, 0.1, 1)
//        gameObject.rotateX(+, 0.5)
//        gameObject.rotateY(+, 0.2)
//
//        gameObject2.material.color = ColorUtil.getRandomColorNotWhiteBlack()
//        gameObject2.setScale(0.05)
//        gameObject2.move(-, -0.1, 0, 1)
//        gameObject2.rotateX(+, 0.3)
//        gameObject2.rotateY(+, 0.7)
//
//        self.addChild(gameObject)
//        self.addChild(gameObject2)
        
//        self.camera.lookAt(point: gameObject.getPosition())
        
        self.earth.material.color = ColorUtil.getColor(.red)
        self.earth.setScale(0.05)
        self.earth.setPositionZ(-1)
        self.addChild(self.earth)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.earth.rotateX(+, GameTime.deltaTime * 0.1)
        self.earth.rotateY(+, GameTime.deltaTime * 0.1)
        
        
//        self.earth.material.shininess += 0.01
//        print(self.earth.material.shininess)
//        self.camera.moveX(-, GameTime.deltaTime * 0.009)
//
//        self.gameObject2.rotateX(+, GameTime.deltaTime)
//        self.gameObject2.rotateY(+, GameTime.deltaTime)
//        self.camera.rotateX(+, GameTime.deltaTime)
//        self.camera.rotateY(+, GameTime.deltaTime)
//        self.camera.moveZ(+, 0.007)
        
//        self.light.moveX(+, GameTime.deltaTime)
//        self.light.moveZ(-, GameTime.deltaTime)
//        self.camera.moveX(+, GameTime.deltaTime)
//        self.camera.lookAt(point: gameObject.getPosition())
//        self.camera.lookAt(point: gameObject2.getPosition())
        
//        if self.camera.getRotationY() > 0 {
//            self.camera.rotateY(-, GameTime.deltaTime)
//        }
    }
    
}
