//
//  Game.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 28.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class Game {
    init() {
        StateManager.setState(.start)
    }
    
    func startRound() -> Void {
        StateManager.setState(.inRound)
    }
    
    func endRound() -> Void {
        StateManager.setState(.roundEnd)
    }
}
