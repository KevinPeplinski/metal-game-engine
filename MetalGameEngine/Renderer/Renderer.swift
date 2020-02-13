//
//  Renderer.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation
import MetalKit

class Renderer: NSObject {
    
    private var screenSize: SIMD2<Float> = SIMD2<Float>(0, 0)
    
    init(_ view: MTKView) {
        super.init()
        self.setScreenSize(view)
    }
    
    private func setScreenSize(_ view: UIView) -> Void {
        self.screenSize = SIMD2<Float>(Float(view.bounds.width), Float(view.bounds.height))
    }
    
}

extension Renderer: MTKViewDelegate {
    
    // Updates the view’s contents upon receiving a change in layout, resolution, or size.
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        self.setScreenSize(view)
    }
    
    // Draws the view’s contents.
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
//        SceneManager.tickScene(renderCommandEncoder: renderCommandEncoder!, deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
}
