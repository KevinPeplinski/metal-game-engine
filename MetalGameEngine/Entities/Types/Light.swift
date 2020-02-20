//
//  Light.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

class Light: LocateableObject {
    
    private var lightData = LightData()
    
    override init() {
        self.lightData.color = ColorUtil.getColor(.white)
        self.lightData.brigthness = 1
        self.lightData.ambientIntensity = 1
        self.lightData.position = SIMD3<Float>(0, 0, 0)
    }
    
    override func doUpdate() {
        super.doUpdate()
        
        self.lightData.position = self.getPosition()
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setFragmentBytes(&lightData, length: LightData.stride, index: FragmentBufferIndizes.lightData.rawValue)
    }
    
}

extension Light {
    public func setLightColor(_ color: SIMD3<Float>) -> Void {
        self.lightData.color = color
    }
    
    public func getLightColor() -> SIMD3<Float> {
        return self.lightData.color
    }
    
    public func setLightBrigthness(_ brigthness: Float) -> Void {
        self.lightData.brigthness = brigthness
    }
    
    public func getightBrigthness() -> Float {
        return self.lightData.brigthness
    }
    
    public func setLightAmbientIntensity(_ ambientIntensity: Float) -> Void {
        self.lightData.ambientIntensity = ambientIntensity
    }
    
    public func getightAmbientIntensity() -> Float {
        return self.lightData.ambientIntensity
    }
}
