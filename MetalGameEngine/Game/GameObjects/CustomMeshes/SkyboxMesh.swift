//
//  SkyboxMesh.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 5009.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class SkyboxMesh2: CustomMesh {
    
    override func createVertices() {
        self.vertices = [
             //Left
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             
             //RIGHT
             Vertex(position: SIMD3<Float>( 500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             
             //TOP
             Vertex(position: SIMD3<Float>( 500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             
             //BOTTOM
             Vertex(position: SIMD3<Float>( 500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             
             //BACK
             Vertex(position: SIMD3<Float>( 500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0,-500.0), normal: SIMD3<Float>(500,0,500)),
             
             //FRONT
             Vertex(position: SIMD3<Float>(-500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>(-500.0, 500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
             Vertex(position: SIMD3<Float>( 500.0,-500.0, 500.0), normal: SIMD3<Float>(500,0,500)),
         ]
    }
    
}
