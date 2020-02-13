//
//  Engine.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

class Engine {
    
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func ignite(device: MTLDevice) -> Void {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        
        Graphics.initialize()
        
        Entities.initialize()
    }
    
}
