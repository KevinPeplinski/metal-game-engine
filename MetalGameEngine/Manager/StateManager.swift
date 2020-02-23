//
//  StateManager.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 23.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

enum State {
    case start
    
    // add new states
}

class StateManager {
    
    static var current: State = .start
    
    static func setState(_ state: State) -> Void {
        self.current = state
    }
    
}
