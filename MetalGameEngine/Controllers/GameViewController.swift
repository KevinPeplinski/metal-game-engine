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
    private var game: Game = Game()
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var locateButton: UIButton!
    
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
        
        self.locateButton.isHidden = true
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
        EarthScale.scale(Float(gesture.scale))
    }
    
    // LocateButton Action
    @IBAction func getRotation(_ sender: Any) {

        print(EarthRotate.getLatitudinal())
        
    }
    
    // startButton Action
    @IBAction func startGame(_ sender: Any) {
        self.game.startRound()
        self.locateButton.isHidden = false
        self.startButton.isHidden = true
    }
}

