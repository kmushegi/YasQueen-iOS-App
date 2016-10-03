//
//  ViewController.swift
//  YasQueen
//
//  Created by Konstantine Mushegian on 9/26/16.
//  Copyright © 2016 Konstantine Mushegian. All rights reserved.
//

import UIKit
import AVFoundation

var player = AVAudioPlayer()

var yqURL = NSBundle.mainBundle().URLForResource("yqAudio",withExtension: "wav")
var snLeftURL = NSBundle.mainBundle().URLForResource("snapLeft", withExtension: "wav")
var snRightURL = NSBundle.mainBundle().URLForResource("snapRight", withExtension: "wav")

var snapRight = false

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func yasQueenPressed(sender: UIButton) {
        do {
            player = try AVAudioPlayer(contentsOfURL: yqURL!)
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    @IBAction func snapsPressed(sender: UIButton) {
        do {
            if(snapRight) {
                player = try AVAudioPlayer(contentsOfURL: snRightURL!)
                snapRight = false;
            } else {
                player = try AVAudioPlayer(contentsOfURL: snLeftURL!)
                snapRight = true
            }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }


}

