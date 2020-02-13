//
//  Scene.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal
import simd

struct SceneConstants {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

class Scene: Renderable {
    
    private var sceneConstants = SceneConstants()
    
    private var lights: [Light] = []
    private var nodes: [Node] = []
    private var camera: Camera!
    
    public func addLight(_ light: Light) -> Void {
        self.lights.append(light)
    }
    
    public func addChild(_ node: Node) -> Void {
        self.nodes.append(node)
    }
    
    public func setCamera(_ camera: Camera) -> Void {
        self.camera = camera
    }
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        <#code#>
    }
    
}
