//
//  MeshLibrary.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import Metal

enum MeshType {
    // Customs
    case cube
    case skyboxCube
    
    // Models
    case cruiser
    // EarthModel
    case earth
    case earth_land
    case earth_water
    case earth_around
}

class MeshLibrary: Library<MeshType, Mesh> {
     
    private var meshes: [MeshType: Mesh] = [:]
    
    override func fillLibrary() {
        meshes.updateValue(CubeMesh(), forKey: .cube)
        meshes.updateValue(SkyboxMesh(), forKey: .skyboxCube)
        
        meshes.updateValue(ModelMesh(modelName: "cruiser"), forKey: .cruiser)
        meshes.updateValue(ModelMesh(modelName: "EARTH_HighPoly"), forKey: .earth)
        meshes.updateValue(ModelMesh(modelName: "earth_land"), forKey: .earth_land)
        meshes.updateValue(ModelMesh(modelName: "earth_water"), forKey: .earth_water)
        meshes.updateValue(ModelMesh(modelName: "earth_around"), forKey: .earth_around)
    }
    
    override subscript(_ type: MeshType) -> Mesh {
        return meshes[type]!
    }

}
