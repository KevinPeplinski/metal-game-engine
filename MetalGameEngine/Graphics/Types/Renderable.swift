//
//  Renderable.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

protocol Renderable: Updateable {
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) -> Void
    
}
