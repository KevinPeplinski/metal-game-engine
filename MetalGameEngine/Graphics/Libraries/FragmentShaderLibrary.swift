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
    case skybox
}

class FragmentShaderLibrary: Library<FragmentShaderType, MTLFunction> {
    
    private var fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    override func fillLibrary() {
        fragmentShaders.updateValue(
            Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"),
            forKey: .basic
        )
        
        fragmentShaders.updateValue(
            Shader(name: "Skybox Fragment Shader", functionName: "skybox_fragment_shader"),
            forKey: .skybox
        )
    }
    
    override subscript(_ type: FragmentShaderType) -> MTLFunction {
        return (fragmentShaders[type]?.function)!
    }
}
