//
//  ClearColors.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

public enum ClearColors {
    
    static let black: MTLClearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    static let white: MTLClearColor = MTLClearColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
}
