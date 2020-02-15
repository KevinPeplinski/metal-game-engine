//
//  Scene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

class Scene: Renderable {
    
    private var sceneConstants = SceneConstants()
    
    private var lights: [Light] = []
    private var gameObjects: [GameObject] = []
    private var camera: Camera!
    
    public func addLight(_ light: Light) -> Void {
        self.lights.append(light)
    }
    
    public func addChild(_ node: GameObject) -> Void {
        self.gameObjects.append(node)
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
    }
    
    func doUpdate() {
        print("doUpdate Scene")
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        print("doRender Scene")
    }
    
}
