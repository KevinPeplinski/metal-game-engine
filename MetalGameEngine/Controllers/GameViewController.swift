//
//  ViewController.swift
//  MetalGameEngine
//
//  Created by Kevin Peplinski on 13.02.20.
//  Copyright © 2020 Kevin Peplinski. All rights reserved.
//

import UIKit
import MetalKit

class GameViewController: UIViewController {
    
    private var renderer: Renderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let metalView = self.view as! MTKView
        
        metalView.device = MTLCreateSystemDefaultDevice()
        metalView.clearColor = Preferences.clearColor
        metalView.colorPixelFormat = Preferences.colorPixelFormat
        metalView.depthStencilPixelFormat = Preferences.mainDepthPixelFormat
        
        self.renderer = Renderer(metalView)
        metalView.delegate = renderer
        
        Engine.ignite(device: metalView.device!)
    }
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        switch gesture.state {
        case .began:
            EarthRotate.previousPanPoint = gesture.location(in: gestureView)
        case .changed:
            EarthRotate.rotate(gesture.location(in: gestureView))
        default:
            EarthRotate.previousPanPoint = nil
        }
    }
    
    @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        print(Float(gesture.scale))
        
        EarthScale.scale(Float(gesture.scale))
    }
    
    @IBAction func getRotation(_ sender: Any) {
        print(EarthRotate.getRotation())
    }
}

