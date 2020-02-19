//
//  MeshLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

enum MeshType {
    case cube
    case skyboxCube
}

class MeshLibrary: Library<MeshType, Mesh> {
     
    private var meshes: [MeshType: Mesh] = [:]
    
    override func fillLibrary() {
        meshes.updateValue(CubeMesh(), forKey: .cube)
        meshes.updateValue(SkyboxMesh(), forKey: .skyboxCube)
    }
    
    override subscript(_ type: MeshType) -> Mesh {
        return meshes[type]!
    }

}
