//
//  VertexShaderLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum VertexShaderType {
    case basic
}

class VertexShaderLibrary: Library<VertexShaderType, MTLFunction> {
    
    private var vertexShaders: [VertexShaderType: Shader] = [:]
    
    override func fillLibrary() {
        vertexShaders.updateValue(
            Shader(name: "Basic Vertex Shader", functionName: "basic_vertex_shader"),
            forKey: .basic
        )
    }
    
    override subscript(_ type: VertexShaderType) -> MTLFunction {
        return (vertexShaders[type]?.function)!
    }

}
