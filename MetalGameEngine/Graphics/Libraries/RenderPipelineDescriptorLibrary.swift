//
//  RenderPipelineDescriptorLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum RenderPipelineDescriptorType {
    case basic
}

class RenderPipelineDescriptorLibrary: Library<RenderPipelineDescriptorType, MTLRenderPipelineDescriptor> {
    
    private var renderPipelineDescriptors: [RenderPipelineDescriptorType: RenderPipelineDescriptor] = [:]
    
    override func fillLibrary() {
        renderPipelineDescriptors.updateValue(
            BasicRenderPipelineDescriptor(),
            forKey: .basic
        )
    }
    
    override subscript(_ type: RenderPipelineDescriptorType) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[type]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.colorPixelFormat
        renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.mainDepthPixelFormat
        renderPipelineDescriptor.vertexFunction = Graphics.vertexShaders[.basic]
        renderPipelineDescriptor.fragmentFunction = Graphics.fragmentShaders[.basic]
        renderPipelineDescriptor.vertexDescriptor = Graphics.vertexDescriptors[.basic]
    }
}
