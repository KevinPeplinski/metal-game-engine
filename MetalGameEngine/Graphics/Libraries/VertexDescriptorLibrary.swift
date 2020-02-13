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
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].offset = 0

        // Color
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].offset = SIMD3<Float>.stride
        
        // Normal
        vertexDescriptor.attributes[2].bufferIndex = 0
        vertexDescriptor.attributes[2].format = .float3
        vertexDescriptor.attributes[2].offset = SIMD3<Float>.stride + SIMD4<Float>.stride
        
        // TextureCoordinate
        vertexDescriptor.attributes[3].bufferIndex = 0
        vertexDescriptor.attributes[3].format = .float2
        vertexDescriptor.attributes[3].offset = SIMD3<Float>.stride + SIMD4<Float>.stride + SIMD3<Float>.stride

//        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}
