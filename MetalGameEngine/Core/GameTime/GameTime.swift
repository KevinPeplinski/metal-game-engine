//
//  GameTime.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class GameTime {
    private static var privateTotalGameTime: Float = 0.0
    private static var privateDeltaTime: Float = 0.0
    public static func updateTime(deltaTime: Float) -> Void {
        self.privateDeltaTime = deltaTime
        self.privateTotalGameTime += deltaTime
    }
}

extension GameTime {
    public static var totalGameTime: Float {
        return self.privateTotalGameTime
    }
    
    public static var deltaTime: Float {
        return self.privateDeltaTime
    }
}
