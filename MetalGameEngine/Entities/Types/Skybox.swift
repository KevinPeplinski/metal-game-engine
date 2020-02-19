//
//  Skybox.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 17.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation
import MetalKit

class Skybox: Renderable {

    private let cubeMesh: Mesh = Entities.meshes[.skyboxCube]

    private var cubeMap: MTLTexture!

    init(name: String) {
        let textureLoader = MTKTextureLoader(device: Engine.device)

        do {
            let texture = try textureLoader.newTexture(name: name, scaleFactor: 1.0, bundle: .main, options: nil)

            if texture.textureType == .typeCube {
                self.cubeMap = texture
            } else {
                fatalError("Skybox: could load Texture \(name), but its not a cubemap!")
            }
        } catch {
            print(error)
        }
    }

    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(Graphics.renderPipelineStates[.skybox])
        renderCommandEncoder.setDepthStencilState(Graphics.depthStencilStates[.less])

        // Fragment
        renderCommandEncoder.setFragmentTexture(self.cubeMap, index: 0) // Index
        renderCommandEncoder.setFragmentSamplerState(Graphics.samplerStates[.linear], index: 0) // Index

        self.cubeMesh.drawPrimitives(renderCommandEncoder)
    }
    
    func doUpdate() {
        
    }
}
