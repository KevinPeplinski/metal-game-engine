//
//  CubeMesh.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 15.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class CubeMesh: CustomMesh {
    
    override func createVertices() {
        self.vertices = [
             //Left
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             
             //RIGHT
             Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             
             //TOP
             Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             
             //BOTTOM
             Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             
             //BACK
             Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), normal: SIMD3<Float>(1,0,1)),
             
             //FRONT
             Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
             Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), normal: SIMD3<Float>(1,0,1)),
         ]
    }
    
}
