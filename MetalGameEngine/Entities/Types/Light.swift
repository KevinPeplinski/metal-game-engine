//
//  Light.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class Light: LocateableObject {
    
    private var lightData = LightData()
    
    override init() {
        self.lightData.color = ColorUtil.getColor(.white)
    }
    
}
