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
        
        self.camera.setPositionZ(10)
        
        let gameObject = GameObject(.cube)
        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        
        gameObject.setScale(0.05)
        gameObject.move(+, 0, 0, 0.1)
        
        let gameObject2 = GameObject(.cube)
        gameObject2.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        
        gameObject2.setScale(0.05)
        gameObject2.move(+, 0, 0, 0.1)
        
        self.addChild(gameObject)
//        self.addChild(gameObject2)
    }
    
    override func doUpdate() {
        super.doUpdate()
//        self.camera.rotateX(+, GameTime.deltaTime)
//        self.camera.rotateY(+, GameTime.deltaTime)
//        self.camera.moveZ(+, 0.007)
    }
    
}
