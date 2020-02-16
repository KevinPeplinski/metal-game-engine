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
}

class VertexDescriptorLibrary: Library<VertexDescriptorType, MTLVertexDescriptor>  {
    
    private var vertexDescriptors: [VertexDescriptorType: VertexDescriptor] = [:]
    
    override func fillLibrary() {
        vertexDescriptors.updateValue(BasicVertexDescriptor(), forKey: .basic)
    }
    
    override subscript(_ type: VertexDescriptorType) -> MTLVertexDescriptor {
        return vertexDescriptors[type]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

public struct BasicVertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        vertexDescriptor.attributes[VertexAttribute.position.rawValue].bufferIndex = 0
        vertexDescriptor.attributes[VertexAttribute.position.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttribute.position.rawValue].offset = 0
        
        // Normal
        vertexDescriptor.attributes[VertexAttribute.normal.rawValue].bufferIndex = 0
        vertexDescriptor.attributes[VertexAttribute.normal.rawValue].format = .float3
        vertexDescriptor.attributes[VertexAttribute.normal.rawValue].offset = SIMD3<Float>.stride

        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}
