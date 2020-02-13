//
//  SceneManager.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum SceneType {
    case none
    case singleObjectScene
}

class SceneManager: Manager {

    private static var currentScene: Scene?
    
    public static func initialize() -> Void {
        self.currentScene = .none
    }
    
    public static func initialize(current: Scene) -> Void {
        self.currentScene = current
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) -> Void {
        if let scene = currentScene {
            
        } else {
            fatalError("no current scene")
        }
    }
    
}
