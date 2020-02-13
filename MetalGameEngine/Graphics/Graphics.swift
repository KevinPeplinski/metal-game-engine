//
//  Graphics.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

class Graphics {
    
    private static var privateVertexShaderLibrary: VertexShaderLibrary!
    public static var vertexShaders: VertexShaderLibrary { return privateVertexShaderLibrary }
    
    private static var privateFragmentShaderLibrary: FragmentShaderLibrary!
    public static var fragmentShaders: FragmentShaderLibrary { return privateFragmentShaderLibrary }
    
    private static var privateVertexDescriptorLibrary: VertexDescriptorLibrary!
    public static var vertexDescriptors: VertexDescriptorLibrary { return privateVertexDescriptorLibrary }
    
    private static var privateRenderPipelineDescriptorLibrary: RenderPipelineDescriptorLibrary!
    public static var renderPipelineDescriptors: RenderPipelineDescriptorLibrary { return privateRenderPipelineDescriptorLibrary }
    
    private static var privateRenderPipelineStateLibrary: RenderPipelineStateLibrary!
    public static var renderPipelineStates: RenderPipelineStateLibrary { return privateRenderPipelineStateLibrary }
    
    private static var privateDepthStencilStateLibrary: DepthStencilStateLibary!
    public static var depthStencilStates: DepthStencilStateLibary { return privateDepthStencilStateLibrary }
    
    private static var privateSamplerStateLibrary: SamplerStateLibrary!
    public static var samplerStates: SamplerStateLibrary { return privateSamplerStateLibrary }
    
    public static func initialize() -> Void {
        self.privateVertexShaderLibrary = VertexShaderLibrary()
        self.privateFragmentShaderLibrary = FragmentShaderLibrary()
        self.privateVertexDescriptorLibrary = VertexDescriptorLibrary()
        self.privateRenderPipelineDescriptorLibrary = RenderPipelineDescriptorLibrary()
        self.privateRenderPipelineStateLibrary = RenderPipelineStateLibrary()
        self.privateDepthStencilStateLibrary = DepthStencilStateLibary()
        self.privateSamplerStateLibrary = SamplerStateLibrary()
    }
    
}
