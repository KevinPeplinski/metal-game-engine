//
//  FragmentShaderLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum FragmentShaderType {
    case basic
}

class FragmentShaderLibrary: Library<FragmentShaderType, MTLFunction> {
    
    private var fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    override func fillLibrary() {
        fragmentShaders.updateValue(
            Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"),
            forKey: .basic
        )
    }
    
    override subscript(_ type: FragmentShaderType) -> MTLFunction {
        return (fragmentShaders[type]?.function)!
    }
}
