//
//  SkyboxManager.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 18.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum SkyboxType {
    case space
}

class SkyboxManager {
    
    static var currentSkybox: Skybox?
    
    static func setSkybox(_ skyboxType: SkyboxType?) -> Void {

        if skyboxType == nil {
            self.currentSkybox = nil
            return
        }
        
        self.currentSkybox = Skybox()
    }
    
}
