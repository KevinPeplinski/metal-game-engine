//
//  SamplerStateLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum SamplerStateType {
    case linear
}

class SamplerStateLibrary: Library<SamplerStateType, MTLSamplerState> {
    
    private var samplerStates: [SamplerStateType: SamplerState] = [:]
    
    override func fillLibrary() {
        samplerStates.updateValue(LinearSamplerState(), forKey: .linear)
    }
    
    override subscript(_ type: SamplerStateType) -> MTLSamplerState {
        return samplerStates[type]!.samplerState
    }
    
}

protocol SamplerState {
    var name: String { get }
    var samplerState: MTLSamplerState! { get }
}

class LinearSamplerState: SamplerState {
    var name: String = "Linear Sampler State"
    var samplerState: MTLSamplerState!
    
    init() {
        let samplerDescriptor = MTLSamplerDescriptor()
        samplerDescriptor.minFilter = .linear
        samplerDescriptor.magFilter = .linear
        samplerDescriptor.label = name
        samplerState = Engine.device.makeSamplerState(descriptor: samplerDescriptor)
    }
    
}
