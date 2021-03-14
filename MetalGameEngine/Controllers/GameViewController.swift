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
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var locateButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var crosshair: UILabel!
    @IBOutlet weak var debuggTrueFalse: UILabel!
    
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
        self.crosshair.isHidden = true
        self.debuggTrueFalse.isHidden = true
        self.pointsLabel.isHidden = true
    }
    
    // .start
    // startButton Action
    @IBAction func startGame(_ sender: Any) {
        if StateManager.getState() == .start {
            self.game.startRound()
            
            self.locateButton.isHidden = false
            self.cityLabel.isHidden = false
            self.crosshair.isHidden = false
            self.pointsLabel.isHidden = false
            self.pointsLabel.text = "\(self.game.getPoints())"
            self.cityLabel.text = self.game.currentLocation!.name
            #if DEBUG
                self.debuggTrueFalse.isHidden = false
                self.debuggTrueFalse.text = ""
            #endif
            
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
            let earthLatitudinal = EarthRotate.getLatitudinal()
            let locationLatitudinal = self.game.currentLocation!.getRotationVector()
            
            let x = locationLatitudinal.x - earthLatitudinal.x
            let y = locationLatitudinal.y - earthLatitudinal.y
            
            if x < 1.5 && x > -1.5 && y < 1.5 && y > -1.5 {
                self.game.nextRound()
                self.cityLabel.text = self.game.currentLocation!.name
                self.game.addPoint()
                self.pointsLabel.text = "\(self.game.getPoints())"
            } else {
                self.debuggTrueFalse.text = "wrong"
            }
        }
    }
}

