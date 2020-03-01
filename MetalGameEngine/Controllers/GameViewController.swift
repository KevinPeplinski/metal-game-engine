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
    
    // .start
    @IBOutlet weak var startButton: UIButton!
    
    // .inRound
    @IBOutlet weak var locateButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    
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
        
        self.hideAllUIElementsNotInStart()
    }
    
    private func hideAllUIElementsNotInStart() -> Void {
        self.locateButton.isHidden = true
        self.cityLabel.isHidden = true
    }
    
    // .start
    // startButton Action
    @IBAction func startGame(_ sender: Any) {
        if StateManager.getState() == .start {
            self.game.startRound()
            self.locateButton.isHidden = false
            self.startButton.isHidden = true
        }
    }
    
    // .inRound
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        if StateManager.getState() == .inRound {
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
    }
    
    @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if StateManager.getState() == .inRound {
            EarthScale.scale(Float(gesture.scale))
        }
    }
    
    // LocateButton Action
    @IBAction func getRotation(_ sender: Any) {
        if StateManager.getState() == .inRound {
            print(EarthRotate.getLatitudinal())
        }
    }
}

