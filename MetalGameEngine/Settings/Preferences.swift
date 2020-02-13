//
//  Preferences.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

class Preferences {
    
    // Metal Settings
    public static let clearColor: MTLClearColor = ClearColors.black
    public static let colorPixelFormat: MTLPixelFormat = .bgra8Unorm
    public static let mainDepthPixelFormat: MTLPixelFormat = .depth32Float

}
