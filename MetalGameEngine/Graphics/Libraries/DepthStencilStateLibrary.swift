//
//  DepthStencilStateLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum DepthStencilStateType {
    case less
}

class DepthStencilStateLibary: Library<DepthStencilStateType, MTLDepthStencilState> {
    
    private var depthStencilStates: [DepthStencilStateType: DepthStencilState] = [:]
    
    override func fillLibrary() {
        depthStencilStates.updateValue(LessDepthStecilState(), forKey: .less)
    }
    
    override subscript(_ type: DepthStencilStateType) -> MTLDepthStencilState {
        return depthStencilStates[type]!.depthStencilState
    }
}

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState! { get }
}

class LessDepthStecilState: DepthStencilState {
    var depthStencilState: MTLDepthStencilState!
    
    init() {
        let depthStencilDescription = MTLDepthStencilDescriptor()
        depthStencilDescription.isDepthWriteEnabled = true
        depthStencilDescription.depthCompareFunction = .less
        depthStencilState = Engine.device.makeDepthStencilState(descriptor: depthStencilDescription)
    }
    
}
