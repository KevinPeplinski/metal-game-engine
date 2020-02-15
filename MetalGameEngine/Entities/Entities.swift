//
//  Entities.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class Entities {
    
    private static var privateMeshLibrary: MeshLibrary!
    public static var meshes: MeshLibrary {
        return privateMeshLibrary
    }
//    
//    private static var privateTextureLibrary: TextureLibrary!
//    public static var textures: TextureLibrary {
//        return privateTextureLibrary
//    }
    
    public static func initialize() -> Void {
        self.privateMeshLibrary = MeshLibrary()
//        self.privateTextureLibrary = TextureLibrary()
    }
}
