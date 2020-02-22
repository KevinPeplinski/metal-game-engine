//
//  VertexDescriptorLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum VertexDescriptorType {
    case basic
    case textured
    case skybox
}

class VertexDescriptorLibrary: Library<VertexDescriptorType, MTLVertexDescriptor>  {
    
    private var vertexDescriptors: [VertexDescriptorType: VertexDescriptor] = [:]
    
    override func fillLibrary() {
        vertexDescriptors.updateValue(BasicVertexDescriptor(), forKey: .basic)
        vertexDescriptors.updateValue(SkyboxVertexDescriptor(), forKey: .skybox)
        vertexDescriptors.updateValue(TexturedVertexDescriptor(), forKey: .textured)
    }
    
    override subscript(_ type: VertexDescriptorType) -> MTLVertexDescriptor {
        return vertexDescriptors[type]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

public struct TexturedVertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].offset = 0
        
        // Normal
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].offset = SIMD3<Float>.stride
        
        // Textture Cords
        vertexDescriptor.attributes[VertexAttributeIndizes.textureCords.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.textureCords.rawValue].format = .float2
        vertexDescriptor.attributes[VertexAttributeIndizes.textureCords.rawValue].offset = SIMD3<Float>.stride + SIMD3<Float>.stride

        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}

public struct BasicVertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].offset = 0
        
        // Normal
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttributeIndizes.normal.rawValue].offset = SIMD3<Float>.stride

        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}

public struct SkyboxVertexDescriptor: VertexDescriptor {
    var name: String = "Skybox Vertex Descriptor"
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].bufferIndex = VertexBufferIndizes.buffer.rawValue
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttributeIndizes.position.rawValue].offset = 0

        vertexDescriptor.layouts[0].stride = SIMD3<Float>.stride
    }
}
