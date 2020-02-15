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
        (descriptor.attributes[0] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        (descriptor.attributes[2] as! MDLVertexAttribute).name = MDLVertexAttributeNormal
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
                renderCommandEncoder.setVertexBuffer(vertexBuffer.buffer, offset: vertexBuffer.offset, index: 0) // TODO INDEX
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
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0) // TODO INDEX
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
}
