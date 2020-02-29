//
//  Game.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 28.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class Game {
    
    private var currentLocation: Location?
    
    init() {
        StateManager.setState(.start)
    }
    
    func startRound() -> Void {
        StateManager.setState(.inRound)
        self.currentLocation = LocationUtils.getLocation(by: "Berlin")
    }
    
    func endRound() -> Void {
        StateManager.setState(.roundEnd)
    }
}
