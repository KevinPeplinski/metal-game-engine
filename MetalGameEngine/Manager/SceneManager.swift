//
//  SceneManager.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum SceneType {
    case singleObjectScene
}

class SceneManager {
    
    private static var currentScene: Scene?
    
    public static func initialize(current: SceneType) -> Void {
        self.setScene(current)
    }
    
    public static func setScene(_ sceneType: SceneType) -> Void {
        switch sceneType {
        case .singleObjectScene:
            currentScene = SingleObjectScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) -> Void {
        GameTime.updateTime(deltaTime: deltaTime)
        
        if let scene = self.currentScene {
            scene.doUpdate()
            scene.doRender(renderCommandEncoder)
        }
    }
    
}
