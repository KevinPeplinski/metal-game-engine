//
//  LocationUtils.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 28.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

var locationsData: [Location] = load("locations.json", as: [Location].self)

class LocationUtils {
    static func getLocation(by name: String) -> Location {
        return locationsData[0]
    }
    
    static func getShuffled() -> [Location] {
        return locationsData.shuffled()
    }
    
    static func getRandomLocation() -> Location {
        let randomIndex = Int.random(in: 0..<locationsData.count)
        
        return locationsData[randomIndex]
    }
    
    static func getLocationsByCountry(name: String) -> [Location] {
        return locationsData.filter {
            $0.country == name
        }
    }
    
    static func getCapitals() -> [Location] {
        return locationsData.filter {
            $0.capital
        }
    }
}
