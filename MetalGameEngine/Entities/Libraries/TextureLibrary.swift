//
//  TextureLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 18.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

enum TextureType {
    case none
    case earth
}

class TextureLibrary: Library<TextureType, MTLTexture> {
    
    private var textures: [TextureType: Texture] = [:]
    
    override func fillLibrary() {
        
        textures.updateValue(Texture("texture_land", ext: "jpg"), forKey: .earth)
        
    }
    
    override subscript(_ type: TextureType) -> MTLTexture {
        return textures[type]!.texture
    }
}

class Texture {
    var texture: MTLTexture!
    
    init(_ textureName: String, ext: String = "png", origin: MTKTextureLoader.Origin = .topLeft) {
        let textureLoader = TextureLoader(textureName, ext: ext, origin: origin)
        self.texture = textureLoader.loadTextureFromBundle()
    }
}

class TextureLoader {
    private var textureName: String
    private var ext: String
    private var origin: MTKTextureLoader.Origin
    
    init(_ textureName: String, ext: String = "png", origin: MTKTextureLoader.Origin = .topLeft) {
        self.textureName = textureName
        self.ext = ext
        self.origin = origin
    }
    
    public func loadTextureFromBundle() -> MTLTexture {
        var texture: MTLTexture!
        
        if let url = Bundle.main.url(forResource: textureName, withExtension: ext) {
            let textureLoader = MTKTextureLoader(device: Engine.device)
            
            let options: [MTKTextureLoader.Option : MTKTextureLoader.Origin] = [MTKTextureLoader.Option.origin : origin]
            
            do {
                texture = try textureLoader.newTexture(URL: url, options: options)
                texture.label = textureName
            } catch let error as NSError {
                print("Error creating Texture \(textureName) . \(ext): \(error)")
            }
            
        } else {
            print("Error: creating Texture \(textureName) . \(ext): Not Found")
        }
        
        return texture
    }
}
