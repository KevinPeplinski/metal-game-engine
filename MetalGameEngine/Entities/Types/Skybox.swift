//
//  Skybox.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 17.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation
import MetalKit

//class Skybox: GameObject {
//    init() {
//        super.init(.cube)
//    }
//}

class Skybox: Renderable {

    let position = SIMD3<Float>(0, 0, 0)

    let mesh: Mesh = Entities.meshes[.cube]

    var cubeMap: MTLTexture!

    init() {
        let textureLoader = MTKTextureLoader(device: Engine.device)

        do {
            self.cubeMap = try textureLoader.newTexture(name: "Cube Texture", scaleFactor: 1.0, bundle: .main, options: nil)

            if self.cubeMap.textureType == .typeCube {

            }
        } catch {
            print(error)
        }
    }

    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(Graphics.renderPipelineStates[.skybox])
        renderCommandEncoder.setDepthStencilState(Graphics.depthStencilStates[.less])

        // Fragment
        renderCommandEncoder.setFragmentTexture(self.cubeMap, index: 0)
        renderCommandEncoder.setFragmentSamplerState(Graphics.samplerStates[.linear], index: 0)

        self.mesh.drawPrimitives(renderCommandEncoder)
    }
    
    func doUpdate() {
        
    }
}
