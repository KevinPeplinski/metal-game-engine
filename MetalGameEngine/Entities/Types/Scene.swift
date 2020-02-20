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
    private var light: Light?
    
    public func addChild(_ renderableObject: Renderable) -> Void {
        if self.children?.append(renderableObject) == nil {
            self.children = [renderableObject]
        }
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
    }
    
    public func setLight(_ light: Light?) -> Void {
        self.light = light
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
            SkyboxManager.doRender(renderCommandEncoder)
            
            // Render Light before all Children
            if let light = light {
                light.render(renderCommandEncoder)
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
