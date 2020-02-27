//
//  Data.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 27.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Foundation

var data: [Location] = load("locations.json", as: [Location].self)

func load<T: Codable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    return decode(data: data, as: T.self)
}

func printJSON<T: Codable>(_ obj: T) -> Void {
    let data: Data = encode(obj: obj)
    
    print(data.prettyPrintedJSONString!)
}

func decode<T: Codable>(data: Data, as type: T.Type = T.self) -> T {
    do {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .deferredToDate
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't decode")
    }
}

func encode<T: Codable>(obj: T) -> Data {
    do {
        let encoder = JSONEncoder()
        
        return try encoder.encode(obj)
    } catch {
        fatalError("Couldn't encode")
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
