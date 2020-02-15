//
//  SingleObjectScene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class SingleObjectScene: Scene {
    
    override init() {
        super.init()
        self.setCamera(Camera())
        
        let gameObject = GameObject(.cube)
        gameObject.scale(+, 0.1)
        
        gameObject.rotateX(+, 0.2)
        
        gameObject.move(+, 0.5, 0.7, 0.3)
        
        self.addChild(gameObject)
    }
    
}
