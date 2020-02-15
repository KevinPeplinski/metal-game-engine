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
    
    private var lights: [Light]?
    private var gameObjects: [GameObject]?
    private var camera: Camera?
    
    public func addLight(_ light: Light) -> Void {
        if self.lights?.append(light) == nil {
            self.lights = [light]
        }
    }
    
    public func addChild(_ gameObject: GameObject) -> Void {
        if self.gameObjects?.append(gameObject) == nil {
            self.gameObjects = [gameObject]
        }
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
    }
    
//    func updateSceneConstants() -> Void {
//        self.sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
//        self.sceneConstants.projectionMatrix = cameraManager.currentCamera.projectionMatrix
//        self.sceneConstants.totalGameTime = GameTime.totalGameTime
//    }
    
    func doUpdate() {
        if let camera = self.camera {
            camera.doUpdate()
        }
        
        if let lights = self.lights {
            lights.forEach {
                $0.doUpdate()
            }
        }
        
        if let gameObjects = self.gameObjects {
            gameObjects.forEach {
                $0.doUpdate()
            }
        }
        
        print("doUpdate Scene")
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        print("doRender Scene")
    }
    
}
