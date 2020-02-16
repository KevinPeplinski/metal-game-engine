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
        
        self.camera.setPositionZ(10)
        self.camera.setPositionX(1.1)
        
        let gameObject = GameObject(.cube)
        gameObject.material.color = ColorUtil.getRandomColorNotWhiteBlack()
        
        gameObject.move(+, 2, 0.0, 0.0)
        
        self.addChild(gameObject)
    }
    
}
