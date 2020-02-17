//
//  RenderPipelineStateLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum RenderPipelineStateType {
    case basic
    case skybox
}

class RenderPipelineStateLibrary: Library<RenderPipelineStateType, MTLRenderPipelineState> {
    
    private var renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = [:]
    
    override func fillLibrary() {
        renderPipelineStates.updateValue(
            RenderPipelineState(renderPipelineDescriptorType: .basic),
            forKey: .basic
        )
        
        renderPipelineStates.updateValue(
            RenderPipelineState(renderPipelineDescriptorType: .skybox),
            forKey: .skybox
        )
    }
    
    override subscript(_ type: RenderPipelineStateType) -> MTLRenderPipelineState {
        return renderPipelineStates[type]!.renderPipelineState
    }
 
    
}

class RenderPipelineState {
    
    var renderPipelineState: MTLRenderPipelineState!
    init(renderPipelineDescriptorType: RenderPipelineDescriptorType) {
        do{
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: Graphics.renderPipelineDescriptors[renderPipelineDescriptorType])
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__::\(error)")
        }
    }
    
}
