//
//  Game.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 28.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

class Game {
    
    private var points: UInt = 0
    private var wasBerlin: Bool = false
    
    var currentLocation: Location? {
        didSet {
            print("Test")
        }
    }
    
    init() {
        StateManager.setState(.start)
    }
    
    func startRound() -> Void {
        StateManager.setState(.inRound)
        self.currentLocation = LocationUtils.getLocation(by: "Tokyo")
    }
    
    func nextRound() -> Void {
        if !wasBerlin {
            self.currentLocation = LocationUtils.getLocation(by: "Berlin")
            self.wasBerlin = true
            return
        }
        self.currentLocation = LocationUtils.getRandomLocation()
    }
    
    func endRound() -> Void {
        StateManager.setState(.roundEnd)
    }
    
    func getPoints() -> UInt {
        return points
    }
    
    func addPoint() -> Void {
        self.points = self.points + 1
    }
}
