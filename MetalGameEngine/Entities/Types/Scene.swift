//
//  Scene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

class Scene: Renderable {
    
    private var children: [Updateable]?
    private var camera: Camera?
    
    public func addChild(_ updateableObject: Updateable) -> Void {
        if self.children?.append(updateableObject) == nil {
            self.children = [updateableObject]
        }
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
        self.addChild(camera)
    }
    
    func doUpdate() {
        if let children = self.children {
            children.forEach {
                $0.doUpdate()
            }
        }
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        print("doRender Scene")
    }
    
}
