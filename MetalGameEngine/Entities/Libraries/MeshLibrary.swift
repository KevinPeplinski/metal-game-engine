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
    
    case cruiser
    case earth
}

class MeshLibrary: Library<MeshType, Mesh> {
     
    private var meshes: [MeshType: Mesh] = [:]
    
    override func fillLibrary() {
        meshes.updateValue(CubeMesh(), forKey: .cube)
        meshes.updateValue(SkyboxMesh(), forKey: .skyboxCube)
        
        meshes.updateValue(ModelMesh(modelName: "cruiser"), forKey: .cruiser)
        meshes.updateValue(ModelMesh(modelName: "EARTH_HighPoly"), forKey: .earth)
    }
    
    override subscript(_ type: MeshType) -> Mesh {
        return meshes[type]!
    }

}
