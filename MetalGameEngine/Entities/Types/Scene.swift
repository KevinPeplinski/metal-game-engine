//
//  Scene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

class Scene: Renderable {
    
    private var children: [Renderable]?
    private var camera: Camera?
    
    public func addChild(_ renderableObject: Renderable) -> Void {
        if self.children?.append(renderableObject) == nil {
            self.children = [renderableObject]
        }
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
    }
    
    func doUpdate() {
        if let camera = self.camera {
            camera.doUpdate()
            
            if let children = self.children {
                children.forEach {
                    $0.doUpdate()
                }
            }
        }
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        if let camera = self.camera {
            // Render Camera
            camera.doRender(renderCommandEncoder)
            
            // Render Skybox allways before all other Elements
            if let skybox = SkyboxManager.currentSkybox {
                skybox.doRender(renderCommandEncoder)
            }
            
            // Render all Childs
            if let children = self.children {
                children.forEach {
                    $0.doRender(renderCommandEncoder)
                }
            }
        }
    }
    
}
