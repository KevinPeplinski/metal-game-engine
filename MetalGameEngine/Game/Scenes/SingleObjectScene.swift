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
        
        self.camera.setPositionZ(0)
//        self.camera.setPositionX(-1.1)
        
        let gameObject = GameObject(.cube)
        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        
        gameObject.move(+, 1.1, 0.0, 0.0)
        
        let gameObject2 = GameObject(.cube)
        gameObject2.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        
        gameObject2.move(-, 1.1, 0.0, 0.0)
        
        print(gameObject.getPosition())
        print(gameObject2.getPosition())
        
        let skybox = Skybox()
        self.addChild(skybox)

//        self.addChild(gameObject)
//        self.addChild(gameObject2)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
//        self.camera.rotateY(+, GameTime.deltaTime)
//        self.camera.rotateX(+, GameTime.deltaTime)
    }
    
}
