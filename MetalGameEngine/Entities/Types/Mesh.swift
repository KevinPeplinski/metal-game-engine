//
//  Mesh.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import MetalKit

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) -> Void
}

class ModelMesh: Mesh {
    var vertexBuffer: MTLBuffer!
    private var meshes: [Any]!
    
    init(modelName: String) {
        loadModel(modelName: modelName)
    }
    
    func loadModel(modelName: String) -> Void {
        guard let assetURL = Bundle.main.url(forResource: modelName, withExtension: "obj") else {
            fatalError("OBJ File for \(modelName) not found")
        }
        
        let descriptor = MTKModelIOVertexDescriptorFromMetal(Graphics.vertexDescriptors[.basic])
        (descriptor.attributes[VertexAttributeIndizes.position.rawValue] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        (descriptor.attributes[VertexAttributeIndizes.normal.rawValue] as! MDLVertexAttribute).name = MDLVertexAttributeNormal
//        (descriptor.attributes[3] as! MDLVertexAttribute).name = MDLVertexAttributeTextureCoordinate
        
        let bufferAllocator = MTKMeshBufferAllocator(device: Engine.device)
        let asset: MDLAsset = MDLAsset(url: assetURL, vertexDescriptor: descriptor, bufferAllocator: bufferAllocator)
        
        do {
            self.meshes = try MTKMesh.newMeshes(asset: asset, device: Engine.device).metalKitMeshes
        } catch {
            print("Error Loading Mesh \(modelName) : \(error)")
        }
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        guard let meshArray = meshes as? [MTKMesh] else {
            return
        }
        
        for mesh in meshArray {
            for vertexBuffer in mesh.vertexBuffers {
                renderCommandEncoder.setVertexBuffer(vertexBuffer.buffer, offset: vertexBuffer.offset, index: VertexBufferIndizes.buffer.rawValue)
                for submesh in mesh.submeshes {
                    renderCommandEncoder.drawIndexedPrimitives(type: submesh.primitiveType,
                                                               indexCount: submesh.indexCount,
                                                               indexType: submesh.indexType,
                                                               indexBuffer: submesh.indexBuffer.buffer,
                                                               indexBufferOffset: submesh.indexBuffer.offset)
                }
            }
        }
    }
    
    
}

class CustomMesh: Mesh {
    var vertexBuffer: MTLBuffer!
    
    var vertices: [Vertex]!
    
    init() {
        self.createVertices()
        
        if let vertices = self.vertices {
            self.vertexBuffer = Engine.device.makeBuffer(bytes: self.vertices, length: Vertex.stride * vertices.count, options: [])
        } else {
            fatalError("Error initializing a custom Mesh, vertices is Empty override func createVertices and define vertices")
        }
    }
    
    func createVertices() -> Void {}
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) -> Void {

        renderCommandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: VertexBufferIndizes.buffer.rawValue)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.vertices.count)
        
    }
}

class SkyboxMesh: Mesh {
    var vertexBuffer: MTLBuffer!
    
    var positionData: [SIMD3<Float>]!
    
    init() {
        self.createVertices()
        
        if let positions = self.positionData {
            self.vertexBuffer = Engine.device.makeBuffer(bytes: self.positionData, length: SIMD3<Float>.stride * positions.count, options: [])
        }
    }
    
    func createVertices() -> Void {
        self.positionData = [
             //LEFT
             SIMD3<Float>(-500.0,-500.0,-500.0),
             SIMD3<Float>(-500.0,-500.0, 500.0),
             SIMD3<Float>(-500.0, 500.0, 500.0),
             SIMD3<Float>(-500.0,-500.0,-500.0),
             SIMD3<Float>(-500.0, 500.0, 500.0),
             SIMD3<Float>(-500.0, 500.0,-500.0),
             
             //RIGHT
             SIMD3<Float>( 500.0, 500.0, 500.0),
             SIMD3<Float>( 500.0,-500.0,-500.0),
             SIMD3<Float>( 500.0, 500.0,-500.0),
             SIMD3<Float>( 500.0,-500.0,-500.0),
             SIMD3<Float>( 500.0, 500.0, 500.0),
             SIMD3<Float>( 500.0,-500.0, 500.0),
             
             //TOP
             SIMD3<Float>( 500.0, 500.0, 500.0),
             SIMD3<Float>( 500.0, 500.0,-500.0),
             SIMD3<Float>(-500.0, 500.0,-500.0),
             SIMD3<Float>( 500.0, 500.0, 500.0),
             SIMD3<Float>(-500.0, 500.0,-500.0),
             SIMD3<Float>(-500.0, 500.0, 500.0),
             
             //BOTTOM
             SIMD3<Float>( 500.0,-500.0, 500.0),
             SIMD3<Float>(-500.0,-500.0,-500.0),
             SIMD3<Float>( 500.0,-500.0,-500.0),
             SIMD3<Float>( 500.0,-500.0, 500.0),
             SIMD3<Float>(-500.0,-500.0, 500.0),
             SIMD3<Float>(-500.0,-500.0,-500.0),
             
             //BACK
             SIMD3<Float>( 500.0, 500.0,-500.0),
             SIMD3<Float>(-500.0,-500.0,-500.0),
             SIMD3<Float>(-500.0, 500.0,-500.0),
             SIMD3<Float>( 500.0, 500.0,-500.0),
             SIMD3<Float>( 500.0,-500.0,-500.0),
             SIMD3<Float>(-500.0,-500.0,-500.0),
             
             //FRONT
             SIMD3<Float>(-500.0, 500.0, 500.0),
             SIMD3<Float>(-500.0,-500.0, 500.0),
             SIMD3<Float>( 500.0,-500.0, 500.0),
             SIMD3<Float>( 500.0, 500.0, 500.0),
             SIMD3<Float>(-500.0, 500.0, 500.0),
             SIMD3<Float>( 500.0,-500.0, 500.0),
             
         ]
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) -> Void {

        renderCommandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: VertexBufferIndizes.buffer.rawValue)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.positionData.count)
        
    }
}
